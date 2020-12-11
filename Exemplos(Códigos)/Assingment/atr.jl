using Gurobi, JuMP, DelimitedFiles, Parsers

function print_solution()
    soma = 0
    for i in 1:n
        for j in 1:n
            if value(x[i,j]) == 1
                println("Pessoa ", i, " foi atribuída ao trabalho: ", j, " com custo: ", c[i,j])
                soma = soma + a[i]
            end
        end
    end
    println("O custo ótimo foi: ", objective_value(m))
end

#Dados
path = "C:\\Users\\mndzv\\Documents\\Mestrado\\julia\\Otimização Combinatória\\Codes\\Assingment\\atr_5.txt"

n = readdlm(path)[1]
c = zeros(n,n)
for i in 1:n
    for j in 1:n
        c[i,j] = readdlm(path)[i+1, j]
    end
end


#Conjuntos
I = 1:n
J = 1:n

#Modelo
m = Model(Gurobi.Optimizer)

#Variáveis
@variable(m, x[i in I, j in J],  Bin)

#Restrições
@constraint(m, pessoa[i in I], sum(x[i,j] for j in J if i != j) == 1)
@constraint(m, job[j in J], sum(x[i,j] for i in I if i!=j) == 1)

#Função Objetiov
@objective(m, Min, sum(c[i,j]*x[i,j] for i in I, j in J if i != j))

#Otimiza
optimize!(m)

#Informando a solução

print_solution()
