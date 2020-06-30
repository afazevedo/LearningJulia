using JuMP, Gurobi

m = Model(Gurobi.Optimizer, Presolve=0)

@variable(m, x, Bin) #Modelo m, variável x, binária
set_name(x, "x") #Dar nome a variável x
@variable(m, 0 <= y <= 1) #Modelo m, variável y entre 0 e 1
set_name(y, "y") #Dar nome a variável y

@objective(m, Max, x+y) #Maximizar a função objetivo x+y
c = @expression(m, 50x + 24y - 2400) #Criar uma expressão algébrica
@constraint(m, c<=0) #Adicionar a restrição 50x+24y-2400<=0

optimize!(m) #otimiza

println("Objetivo:", objective_value(m)) #Imprime na tela o valor da função objetivo
println(name(x), " = ", value(x)) #Imprime o valor de x
println(name(y), " = ", value(y)) #Imprime o valor de y
