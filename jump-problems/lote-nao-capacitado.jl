using Gurobi, JuMP

m = 4
M = 1:m
N = 1:4

f = [10 6 20 32] 

c = [
13 17 31 37 
4 13 14 22 
21 21 13 18 
32 18 11 14
]

model = Model(GLPK.Optimizer)

@variable(model, y[j in N], Bin)
@variable(model, x[i in M, j in N]>= 0)

@constraint(model, full_demand[i in M], sum(x[i,j] for j in N) == 1)
@constraint(model, max_client[j in N], sum(x[i,j] for i in M) <= m*y[j])

@objective(model, Min, sum(c[i,j]*x[i,j] for i in M, j in N) + sum(f[j]*y[j] for j in N))

print(model)

optimize!(model)

println(value.(y))
println(value.(x))

println(objective_value(model))