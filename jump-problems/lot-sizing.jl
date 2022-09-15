#= Resolução do problema 13 do Capítulo 1 do Livro do Wolsey
Uncapacitade Lot-Sizing (ULS)
Language: julia
Path: jump-problems\lot-sizing.jl
=#

using JuMP, Gurobi

n = 7 # número de períodos

f = [0, 12,15,30,23,19,45] # custo fixo para produzir no período t
p = [0, 3,4,3,4,4,5] # custo por período para produzir no período t
h = [0, 1,1,1,1,1,1] # custo por unidade de armazenamento no período t
d = [0, 6,7,4,6,3,8] # demanda no período t

maximum_prod = 10 # máximo de produtos produzidos por período 

m = Model(Gurobi.Optimizer)

@variable(m, x[t in 1:n] >= 0)
@variable(m, s[t in 1:n] >= 0)
@variable(m, y[t in 1:n], Bin)

@objective(m, Min, sum(p[t]*x[t] for t in 1:n) + sum(h[t]*s[t] for t in 1:n) + sum(f[t]*y[t] for t in 1:n))

@constraint(m, c1[t in 2:n], s[t-1] + x[t] == d[t] + s[t])

@constraint(m, c2[t in 1:n], x[t] <= maximum_prod*y[t])

@constraint(m, c3[t in 2:n], s[1] + x[2] == d[2] + s[2])

fix(s[1], 0; force = true)

optimize!(m)

objective_value(m)
