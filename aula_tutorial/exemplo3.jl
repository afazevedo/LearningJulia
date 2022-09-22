#= Exemplo 3 - Problema da Mochila (0-1 e Inteira)
Amanda Ferreira de Azevedo
afazevedo@cos.ufrj.br
=#

using JuMP, Gurobi, GLPK

# Dados
n = 5 # Número de itens 
b = 50 # Peso máximo que a mochila pode carregar

a = [20 8 17 13 17] # Capacidade de cada item
c = [30 11 20 18 17] # Custo de cada item 

# Definição do modelo
mochila = Model(Gurobi.Optimizer)

# Definição das variáveis
# @variable(mochila, x[j in 1:n], Bin)
@variable(mochila, x[j in 1:n], Int)

# Função Objetivo
@objective(mochila, Max, sum(c[j] * x[j] for j = 1:n))

# Restrições
@constraint(mochila, sum(a[j] * x[j] for j = 1:n) <= b)

optimize!(mochila)

# Impressão dos resultados

value.(x)

println("Soma dos pesos dos itens escolhidos: ", sum(a[j] * value(x[j]) for j = 1:n))
println("Capacidade máxima da mochila: ", b)
println("O custo ótimo foi: ", objective_value(mochila))
