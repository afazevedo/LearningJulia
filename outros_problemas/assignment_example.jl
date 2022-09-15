#Dados
c = [
35 20 15 12
23 10 23 13
18 12 15 11
23 32 12 22
]

n = 4

# Modelo 
model = Model(Gurobi.Optimizer)

# Definição das variáveis 
@variable(model, x[i in 1:n, j in 1:n], Bin)

# Função Objetivo
@objective(model, Min, sum(c[i,j]*x[i,j] for i in 1:n, j in 1:n))

# Restrições 
@constraint(model, pessoa[i in 1:n], sum(x[i,j] for j in 1:n) == 1)
@constraint(model, tarefa[j in 1:n], sum(x[i,j] for i in 1:n) == 1)

optimize!(model)

# Impressão dos resultados
value.(x)

for i in 1:n 
    for j in 1:n
        if value(x[i,j]) == 1
            println("Pessoa $i foi atribuída ao trabalho $j com custo ", c[i,j])
        end 
    end 
end 

println("O valor da função objetivo foi:", objective_value(model))