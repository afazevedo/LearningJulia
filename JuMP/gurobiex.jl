using JuMP, Gurobi

m = Model(with_optimizer(Gurobi.Optimizer, Presolve=0))
#m = Model()
set_optimizer(m, Gurobi.Optimizer)


@variable(m, x, Bin)
set_name(x, "x")
@variable(m, 0 <= y <= 1)
set_name(y, "y")

@objective(m, Max, x+y)
c = @expression(m, 50x + 24y - 2400)
@constraint(m, c<=0)

optimize!(m)

println("Objetivo:", objective_value(m))
println(name(x), " = ", value(x))
println(name(y), " = ", value(y))
