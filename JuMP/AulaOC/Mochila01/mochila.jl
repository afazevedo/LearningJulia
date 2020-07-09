using Gurobi, JuMP, DelimitedFiles, Parsers
include("functions.jl")

#Dados
path = "knp_5_60.txt"
n = readdlm(path, Int64)[1]

a = zeros(Int64, n)
c = zeros(Int64, n)

b = leitura(path, a, c, n)

#Conjuntos
J = 1:n

#Modelo
m = Model(Gurobi.Optimizer)

#Variáveis
@variable(m, x[j in J], Bin)

#Restrições
@constraint(m, knp, sum(a[j]*x[j] for j in J) <= b)

#Função Objetiov
@objective(m, Max, sum(c[j]*x[j] for j in J))

#Otimiza
optimize!(m)

#Informando a solução

print_solution()
