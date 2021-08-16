using JuMP, Gurobi

model = Model(Gurobi.Optimizer)

@variable(model, x1 >= 0, Int)
@variable(model, x2 >= 0, Int)

@objective(model, Max, x1 + 0.64*x2)

@constraint(model, 50*x1 + 31*x2 <= 250)
@constraint(model, 3*x1-2*x2 >= -4)

print(model)
optimize!(model)

@show value(x1)
@show value(x2)