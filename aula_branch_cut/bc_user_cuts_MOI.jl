#=
Arquivo para mostrar funcionalidade de user cuts no Gurobi
Autor: Amanda Ferreira de Azevedo
Data: 20/09/2020
=#

using Gurobi, JuMP, MathOptInterface

#=
- **User cuts**: Ajuda a fortalecer um MIP removendo soluções fracionárias. Os cortes **não** são necessários para o modelo, mas podem ajudar um MIP a resolver mais rápido.

set_optimizer_attribute(model, "PreCrush", 1) # Habilita user cuts
=#

function my_callback_function(cb_data)
    x_vals = callback_value.(Ref(cb_data), x)

    println("Relaxação linear", x_vals)

    accumulated = sum(item_weights[i] for i in 1:N if x_vals[i] > 0)
    println("Acumulado = $(accumulated)")
    n_terms = sum(1 for i in 1:N if x_vals[i] > 0)
    if accumulated > b
        con = @build_constraint(sum(x[i] for i in 1:N if x_vals[i] > 0) <= n_terms - 1)
        println("Adicionando $(con)")
        MOI.submit(model, MOI.UserCut(cb_data), con)
    end
end

N = 5 # Número de itens 
b = 50 # Peso máximo que a mochila pode carregar

item_weights = [20 8 17 13 17] # Capacidade de cada item
item_values = [30 11 20 18 17] # Custo de cada item 

model = Model(Gurobi.Optimizer)

set_optimizer_attribute(model, "PreCrush", 1) # Habilita user cuts constraints
set_optimizer_attribute(model, "Cuts", 0) # Desabilita Cortes do Gurobi 
set_optimizer_attribute(model, "Presolve", 0) # Desabilita Presolve do Gurobi
set_optimizer_attribute(model, "Heuristics", 0) # Desabilita Heurísticas do Gurobi
set_optimizer_attribute(model, "OutputFlag", 0) # Desabilita a saída na tela do Gurobi

@variable(model, x[1:N], Bin)
@constraint(model, sum(item_weights[i] * x[i] for i = 1:N) <= b)
@objective(model, Max, sum(item_values[i] * x[i] for i = 1:N))

MOI.set(model, MOI.UserCutCallback(), my_callback_function)
optimize!(model)
