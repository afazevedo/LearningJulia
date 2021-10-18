using Gurobi, JuMP

#=
- **User cuts**: Ajuda a fortalecer um MIP removendo soluções fracionárias. Os cortes **não** são necessários para o modelo, mas podem ajudar um MIP a resolver mais rápido.

- MOI.set(model, MOI.RawParameter("Precrush"), 1)

- **Lazy constraints**: São necessárias para o modelo: o modelo estaria incorreto sem essas restrições. Normalmente são utilizadas em modelos que contém um número relativamente grande de restrições que não são facilmente satisfeitas. 

- MOI.set(model, MOI.RawParameter("LazyConstraints"), 1)

Parâmetros: https://www.gurobi.com/documentation/9.1/refman/parameters.html
=#

# 

function my_callback_function_lazy(cb_data)
    x_val = callback_value(cb_data, x)
    y_val = callback_value(cb_data, y)
    println("(x, y) = ($x_val, $y_val)")
    status = MOI.get(model, MOI.CallbackNodeStatus(cb_data))
    
    println("Gap:", MOI.get(modelo, MOI.NodeCount(cb_data)))

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
        println("Adding $(con)")
        MOI.submit(model, MOI.LazyConstraint(cb_data), con)
    elseif y_val + x_val >= 3 
        con = @build_constraint(y - x <= 1)
        println("Adding $(con)")
        MOI.submit(model, MOI.LazyConstraint(cb_data), con)
    end
end

model = Model(Gurobi.Optimizer)

MOI.set(model, MOI.RawParameter("LazyConstraints"), 1) # Habilitar cortes do tipo Lazy 
MOI.set(model, MOI.RawParameter("Cuts"), 0) # Desabilitar cortes
MOI.set(model, MOI.RawParameter("Presolve"), 0) # Desabilitar presolve
MOI.set(model, MOI.RawParameter("Heuristics"), 0) # Desabilitar heurísticas
MOI.set(model, MOI.RawParameter("OutputFlag"), 0) # Desabilitar log  

@variable(model, 0 <= x <= 2.5, Int)
@variable(model, 0 <= y <= 2.5, Int)

@objective(model, Max, y)

MOI.set(model, MOI.LazyConstraintCallback(), my_callback_function_lazy)
optimize!(model)
println("Optimal solution (x, y) = ($(value(x)), $(value(y)))")


#===========================================================================================================#

function my_callback_function(cb_data)
    x_vals = callback_value.(Ref(cb_data), x)
    accumulated = sum(item_weights[i] for i in 1:N if x_vals[i] > 0)
    println("Acumulado = $(accumulated)")
    n_terms = sum(1 for i in 1:N if x_vals[i] > 0)
    if accumulated > b
        con = @build_constraint(
            sum(x[i] for i in 1:N if x_vals[i] > 0) <= n_terms - 1
        )
        println("Adicionando $(con)")
        MOI.submit(model, MOI.UserCut(cb_data), con)
    end
end

N = 5 # Número de itens 
b = 50 # Peso máximo que a mochila pode carregar

item_weights = [20 8 17 13 17] # Capacidade de cada item
item_values = [30 11 20 18 17] # Custo de cada item 

model = Model(Gurobi.Optimizer)

MOI.set(model, MOI.RawParameter("PreCrush"), 1) # Habilitar cortes do tipo UserCuts
MOI.set(model, MOI.RawParameter("Cuts"), 0) # Desabilitar cortes
MOI.set(model, MOI.RawParameter("Presolve"), 0) # Desabilitar presolve
MOI.set(model, MOI.RawParameter("Heuristics"), 0) # Desabilitar heurísticas
MOI.set(model, MOI.RawParameter("OutputFlag"), 0) # Desabilitar log  

@variable(model, x[1:N], Bin)
@constraint(model, sum(item_weights[i] * x[i] for i in 1:N) <= b)
@objective(model, Max, sum(item_values[i] * x[i] for i in 1:N))

MOI.set(model, MOI.UserCutCallback(), my_callback_function)
optimize!(model)




