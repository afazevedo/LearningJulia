#=
Arquivo para mostrar funcionalidade de lazy constraints no Gurobi
Autor: Amanda Ferreira de Azevedo
Data: 20/09/2020
=# 

using Gurobi, JuMP, MathOptInterface

#=
- **Lazy constraints**: São necessárias para o modelo: o modelo estaria incorreto sem essas restrições. Normalmente são utilizadas em modelos que contém um número relativamente grande de restrições que não são facilmente satisfeitas. 

set_optimizer_attribute(model, "LazyConstraints", 1) # Habilita lazy constraints
=#

function my_callback_function_lazy(cb_data)
    x_val = callback_value(cb_data, x) # Pegando o valor da relaxação linear de x
    y_val = callback_value(cb_data, y) # Pegando o valor da relaxação linear de y

    println("Relaxação linear (x, y) = ($x_val, $y_val)")
    println("Valor da função objetivo = ", y_val)

    status = MOI.get(model, MOI.CallbackNodeStatus(cb_data))

    if status == MOI.CALLBACK_NODE_STATUS_FRACTIONAL
        println(" - Solução é fracionária!")
    elseif status == MOI.CALLBACK_NODE_STATUS_INTEGER
        println(" - Solução é inteira! ")
    else
        status = MOI.CALLBACK_NODE_STATUS_UNKNOWN
        println(" Não sei se a solução é inteira.")
    end

    if y_val - x_val > 1 
        con = @build_constraint(y - x <= 1)
        println("Adicionando: $(con)")
        MOI.submit(model, MOI.LazyConstraint(cb_data), con)
    elseif y_val + x_val >= 3 
        con = @build_constraint(y + x <= 2)
        println("Adicionando: $(con)")
        MOI.submit(model, MOI.LazyConstraint(cb_data), con)
    end
end

model = Model(Gurobi.Optimizer)

set_optimizer_attribute(model, "LazyConstraints", 1) # Habilita lazy constraints
set_optimizer_attribute(model, "Cuts", 0) # Desabilita Cortes do Gurobi 
set_optimizer_attribute(model, "Presolve", 0) # Desabilita Presolve do Gurobi
set_optimizer_attribute(model, "Heuristics", 0) # Desabilita Heurísticas do Gurobi
set_optimizer_attribute(model, "OutputFlag", 0) # Desabilita a saída na tela do Gurobi

@variable(model, 0 <= x <= 2.5, Int)
@variable(model, 0 <= y <= 2.5, Int)

@objective(model, Max, y)

MOI.set(model, MOI.LazyConstraintCallback(), my_callback_function_lazy)
optimize!(model)
println("Solução ótima (x, y) = ($(value(x)), $(value(y)))")


