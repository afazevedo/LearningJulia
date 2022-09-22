using Gurobi
using JuMP
using LinearAlgebra

# N-Queens
N = 500

model = Model(Gurobi.Optimizer);

@variable(model, x[i = 1:N, j = 1:N], Bin)

@objective(model, Max, sum(x[i, j] for i = 1:N, j = 1:N))

@constraint(model, horizontal[j in 1:N], sum(x[i, j] for i = 1:N) <= 1)

@constraint(model, vertical[i in 1:N], sum(x[i, j] for j = 1:N) <= 1)

@constraint(
    model,
    diag_pos[k in -(N - 2):(N-2)],
    sum(x[i, j] for i in 1:N, j in 1:N if (i - j) == k) <= 1
)

@constraint(
    model,
    diag_neg[k in 3:2*(N-1)],
    sum(x[i, j] for i in 1:N, j in 1:N if (i + j) == k) <= 1
)

optimize!(model)

println("Número de rainhas: ", objective_value(model))
solution = convert.(Int, value.(x))
