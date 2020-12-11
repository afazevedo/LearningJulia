using Gurobi, JuMP, DelimitedFiles, Parsers

function print_solution()
    for i in 1:m
        for j in 1:n
            if value(x[i,j]) == 1
                println("Cliente ", i, " foi atendido por depósito ", j)
            end
        end
    end

    for j in 1:n
        if value(y[j]) == 1
            println("O depósito ", j, " foi aberta com custo: ", f[j])
        end
    end
    println("O custo ótimo foi: ", objective_value(model))
end

#Dados
path = "C:\\Users\\mndzv\\Documents\\Mestrado\\julia\\Otimização Combinatória\\Codes\\UFL\\ufl_c5_f4.txt"

m = readdlm(path)[1,1]
n = readdlm(path)[1,2]

f = zeros(n)
c = zeros(m,n)

f = readdlm(path)[2,:]

for i in 1:m
    for j in 1:n
        c[i,j] = readdlm(path)[i+2, j]
    end
end

C = m
#Conjuntos
M = 1:m
N = 1:n

#Modelo
model = Model(Gurobi.Optimizer)

#Variáveis
@variable(model, x[i in M, j in N] >= 0)
@variable(model, y[j in N], Bin)

#Restrições
@constraint(model, atr[i in M], sum(x[i,j] for j in N) == 1)
@constraint(model, turn[j in N], sum(x[i,j] for i in M) <= C*y[j])

#Função Objetiov
@objective(model, Min, sum(c[i,j]*x[i,j] for i in M, j in N) + sum(f[j]*y[j] for j in N))

#Otimiza
optimize!(model)

#Informando a solução

print_solution()
