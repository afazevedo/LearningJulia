using Gurobi, JuMP, DelimitedFiles, Parsers

function leitura(path, a, c, n)
    b = readdlm(path, Int64)[1,2]

    for i in 2:n
        a[i] = readdlm(path, Int64)[i,1]
        c[i] = readdlm(path, Int64)[i,2]
    end

    return b
end


function print_solution()
    soma = 0
    for i in 1:n
        if value(x[i]) == 1
            println("Item ", i, " foi escolhido, com peso: ", a[i], " e custo: ", c[i])
            soma = soma + a[i]
        end
    end
    println("Soma total: ", soma)
    println("Capacidade máxima: ", b)
    println("O custo ótimo foi: ", objective_value(m))
end

#Dados
path = "C:\\Users\\mndzv\\Documents\\Mestrado\\julia\\Otimização Combinatória\\Codes\\Mochila01\\knp_5_60.txt"
n = readdlm(path, Int64)[1]

a = zeros(Int64, n)
c = zeros(Int64, n)

b = leitura(path, a, c, n)

#Conjuntos
J = 1:n

#Modelo
m = Model(Gurobi.Optimizer)

#Variáveis
@variable(m, x[j in J], Bin)

#Restrições
@constraint(m, knp, sum(a[j]*x[j] for j in J) <= b)

#Função Objetiov
@objective(m, Max, sum(c[j]*x[j] for j in J))

#Otimiza
optimize!(m)

#Informando a solução

print_solution()
