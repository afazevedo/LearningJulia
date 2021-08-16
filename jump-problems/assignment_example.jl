using Gurobi, JuMP

#Dados
c = [
0 20 15 12
23 0 23 13
18 12 0 11
23 32 12 0
]

n = 4

#Modelo
model = Model(Gurobi.Optimizer)

#Variáveis
@variable(model, x[i in 1:n, j in 1:n; i != j], Bin)

#Restrições
@constraint(model, one_person[i in 1:n], sum(x[i,j] for j in 1:n if i != j) == 1)
@constraint(model, one_job[j in 1:n], sum(x[i,j] for i in 1:n if i!=j) == 1)

#Função Objetivo
@objective(model, Min, sum(c[i,j]*x[i,j] for i in 1:n, j in 1:n if i != j))

#Otimiza
print(model)
optimize!(model)

#Informando a solução
for i in 1:n
    for j in 1:n
        if i != j && value(x[i,j]) == 1
            println("Pessoa ", i, " foi atribuída ao trabalho: ", j, " com custo: ", c[i,j])
        end
    end
end
println("O custo ótimo foi: ", objective_value(model))