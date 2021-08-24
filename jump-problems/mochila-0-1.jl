using Gurobi, JuMP

n = 5 # Número de itens 
W = 50 # Peso máximo que a mochila pode carregar

a = [20 12 17 13 17] # Capacidade de cada item
c = [30 11 20 18 17] # Custo de cada item 

#Modelo
model = Model(Gurobi.Optimizer)

#Variáveis
@variable(model, x[j in 1:n], Bin)

#Restrições
@constraint(model, knapsack, sum(a[j]*x[j] for j in 1:n) <= W)

#Função Objetivo
@objective(model, Max, sum(c[j]*x[j] for j in 1:n))

#Otimiza
print(model)
optimize!(model)

#Informando a solução
soma = 0

println("Soma dos pesos dos itens escolhidos: ", soma)
println("Capacidade máxima da mochila: ", W)
println("O custo ótimo foi: ", objective_value(model))