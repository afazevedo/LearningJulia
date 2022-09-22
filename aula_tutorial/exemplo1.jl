#= Exemplo 1 - Livro do Wolsey
Amanda Ferreira de Azevedo
afazevedo@cos.ufrj.br
=#

using JuMP, Gurobi, GLPK

# Definir o modelo
m = Model(GLPK.Optimizer)

# Definição das Variáveis
@variable(m, x1)
@variable(m, x2)

# Definição da Função Objetivo
@objective(m, Max, x1 + 0.64 * x2)

# Definição das Restrições
@constraint(m, 50 * x1 + 31 * x2 <= 250)
@constraint(m, 3 * x1 - 2 * x2 >= -4)
optimize!(m)

value(x1)
value(x2)

print("O valor da função objetivo foi: ", objective_value(m))



print(m)
