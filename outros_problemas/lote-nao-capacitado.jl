using Gurobi, JuMP

N = 1:210
M = 1:210

m = 50

model = Model(Gurobi.Optimizer)

@variable(model, y[j in N], Bin)
@variable(model, x[i in M, j in N]>= 0, Bin)

@constraint(model, full_demand[i in M], sum(x[i,j] for j in N) == 1)
@constraint(model, max_client[j in N], sum(x[i,j] for i in M) <= m*y[j])

@objective(model, Min, sum(y[j] for j in N))

optimize!(model)

println(sum(value(y[i]) for i in N))

cont = 1
for j in N
    if value(y[j]) == 1
        println("O número de alunos no ônibus ", cont, " é: ", sum(value(x[i,j]) for i in M))
        cont = cont + 1
    end 
end 

println(objective_value(model))
