using JuMP, CPLEX

#Dados
c = [
    6 4 5 7
    2 3 6 6
    5 1 4 3
    7 5 5 5
]

n = size(c)[1]

# Modelo 
model = Model(CPLEX.Optimizer)

# Definição das variáveis 
@variable(model, x[i in 1:n, j in 1:n], Bin)

# Função Objetivo
@objective(model, Min, sum(c[i, j] * x[i, j] for i = 1:n, j = 1:n))

# Restrições 
@constraint(model, pessoa[i in 1:n], sum(x[i, j] for j = 1:n) == 1)
@constraint(model, tarefa[j in 1:n], sum(x[i, j] for i = 1:n) == 1)

optimize!(model)

# Impressão dos resultados
value.(x)

for i = 1:n
    for j = 1:n
        if value(x[i, j]) == 1
            println("Pessoa $i foi atribuída ao trabalho $j com custo ", c[i, j])
        end
    end
end

println("O valor da função objetivo foi:", objective_value(model))
