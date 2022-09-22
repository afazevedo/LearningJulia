using Gurobi, JuMP

a = [
    1 0 1 0
    0 0 1 1
    0 0 0 1
    1 1 0 0
    1 1 1 0
]

c = [10 40 20 30]

M = 1:5
N = 1:4

m = Model(Gurobi.Optimizer)


@variable(m, x[j in N], Bin)

@constraint(m, cover[i in M], sum(a[i, j] * x[j] for j in N) >= 1)

@objective(m, Min, sum(c[j] * x[j] for j in N))

print(m)

optimize!(m)

println(value.(x))

println(objective_value(m))
