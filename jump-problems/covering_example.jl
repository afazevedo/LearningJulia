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

#Modelo
model = Model(Gurobi.Optimizer)

#Variáveis
@variable(model, x[j in N], Bin)

#Restrições
@constraint(model, cover[i in M], sum(a[i,j]*x[j] for j in N) >= 1)

#Função Objetivo
@objective(model, Min, sum(c[j]*x[j] for j in N))

#Otimiza
print(model)
optimize!(model)

