using JuMP, Gurobi, DelimitedFiles

global p = 3
num_cli = readdlm("C:\\Users\\mndzv\\Documents\\Mestrado\\julia\\JuMP\\Relaxação Lagrangeana\\ufl_c5_f5.txt")[1,1]
num_fac = readdlm("C:\\Users\\mndzv\\Documents\\Mestrado\\julia\\JuMP\\Relaxação Lagrangeana\\ufl_c5_f5.txt")[1,2]

C = 1:num_cli
F = 1:num_fac

c = zeros(num_fac, num_cli)
d = zeros(num_fac)

d = readdlm("C:\\Users\\mndzv\\Documents\\Mestrado\\julia\\JuMP\\Relaxação Lagrangeana\\ufl_c5_f5.txt")[2,:]
d = convert(Array{Float64}, d)

for j in 1:num_cli
    for i in 1:num_fac
        c[i,j] = readdlm("C:\\Users\\mndzv\\Documents\\Mestrado\\julia\\JuMP\\Relaxação Lagrangeana\\ufl_c5_f5.txt")[i+2, j]
    end
end

global C, F, c, f, num_cli, num_fac

function optimal()
    m = Model(Gurobi.Optimizer)
    
    @variable(m, x[i in F, j in C] >= 0)
    @variable(m, y[i in F], Bin)

    @objective(m, Min, sum(d[j]*c[i,j]*x[i,j] for i in F, j in C))
    
    @constraint(m, atr[j in C], sum(x[i,j] for i in F) == 1)
    @constraint(m, turn[i in F, j in C], x[i,j] <= y[i])
    @constraint(m, median, sum(y[i] for i in F) == p)

    optimize!(m)
    optimal = objective_value(m)
    x_opt = value.(x)
    y_opt = value.(y)

    return optimal, x_opt, y_opt
end


function lower_bound(lambda)
    #Primeiro passo: Computar v
    v = zeros(num_fac)
    for i in F
        v[i] = 0
        for j in C
            v[i] = v[i] + min(0, d[j]*c[i,j]-lambda[j])
        end
    end
    println(v)

    #Segundo passo: ordenar v do mais negativo ao zeor
    idx = sortperm(v) 

    #Terceiro passo: Determinar y
    y = zeros(num_fac)
    y[idx[1:p]] .= 1

    #Quarto passo: Determinar x
    x = zeros(num_fac, num_cli)
    
    for i in F, j in C
        if y[i] == 1 && d[j]*c[i,j] - lambda[j] < 0
            x[i,j] = 1
        end
    end

    #Quinto passo: computar limite inferior
    lb = 0.0
    for j in C
        lb = lb + lambda[j]
        for i in F
            lb = lb + d[j]*c[i,j]*x[i,j] - lambda[j]*x[i,j]
        end
    end

    return lb, x, y
end

function upper_bound(y)
    #Computar x e y

    x = zeros(num_fac, num_cli)
    for j in C
        idx = argmin(c[:,j] + (1 .- y) .* maximum(c))
        x[idx, j] = 1
    end

    #Computando Z
    ub = 0.0
    for i in F
        for j in C
            ub = ub + d[j]*c[i,j]*x[i,j]
        end
    end
    return ub, x
end

function lagrangian_relaxation()
    #Parâmetros
    MAX_ITER = 100 #Número máximo de iterações
    eps = 1.0 #Fator multiplicativo

    #Inicializar limites
    UB = Array{Float64}(undef, 0)
    LB = Array{Float64}(undef, 0)

    Z_UB = Inf
    Z_LB = -Inf

    x_best = zeros(num_fac, num_cli)
    y_best = zeros(num_fac, num_cli)

    lambda = zeros(num_cli)

    for k in 1:MAX_ITER
        println(lambda)
        #Obter os limites
        Z_D, x_D, y = lower_bound(lambda)
        Z, x = upper_bound(y)

        #Atualizando o limite superior
        if Z < Z_UB
            Z_UB = Z
            x_best = x
            y_best = y
        end

        #Atulizando o limite inferior
        if Z_D > Z_LB
            Z_LB = Z_D
        end

        #Guardar histórico de limites
        push!(UB, Z)
        push!(LB, Z_D)

        #Determinando o tamanho de passo e atualizando os mutiplicadores
        
        residual = 1 .- transpose(sum(x_D, dims=1))
        t = eps * (Z_UB - Z_D)/sum(residual.^2)
        lambda = lambda + t * residual
        
        #Calculando o gap de otimalidade
        opt_gap = (Z_UB- Z_LB)/Z_UB
        if opt_gap < 0.0001
            break
        end
    end
    return Z_UB, x_best, y_best, UB, LB
end


#Encontrando a solução ótima
z_opt, x_opt, y_opt = optimal()

#Encontrando a solução pela relaxação Lagrangeana
Z_UB, x_best, y_best, UB, LB = lagrangian_relaxation()

#Plotando
using PyPlot

iter = 1:length(LB)
fig = figure()

plot(iter, LB, color="red", linewidth=2.0, linestyle = "-", marker = "o", label = "Lower Bound")
plot(iter, UB, color="blue", linewidth=2.0, linestyle="-.", marker="D", label="Upper Bound")
xlabel(L"iteration clock $k$", fontsize="x-large")
ylabel("Bounds", fontsize="x-large")
legend(loc="lower right", fontsize="x-large")

grid(color="#DDDDDD", linestyle="-", linewidth= 1.0)
tick_params(axis="both", which="major", labelsize = "x-large")

title("Lower and Upper Bounds")
savefig("iterations.png")
close(fig)