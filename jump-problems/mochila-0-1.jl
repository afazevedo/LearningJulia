using Gurobi, JuMP

n = 5 # Número de itens 
b = 50 # Peso máximo que a mochila pode carregar

a = [20 8 17 13 17] # Capacidade de cada item
c = [30 11 20 18 17] # Custo de cada item 

#Modelo
model = Model(Gurobi.Optimizer)

#Variáveis
@variable(model, x[j in 1:n]>=0, Int)

#Restrições
@constraint(model, sum(a[j]*x[j] for j in 1:n) <= b)

#Função Objetivo
@objective(model, Max, sum(c[j]*x[j] for j in 1:n))

print(model)

#Otimiza
print(model)
optimize!(model)

#Informando a solução
println(value.(x))
println("Soma dos pesos dos itens escolhidos: ", sum(a[j]*value(x[j]) for j in 1:n))
println("Capacidade máxima da mochila: ", b)
println("O custo ótimo foi: ", objective_value(model))