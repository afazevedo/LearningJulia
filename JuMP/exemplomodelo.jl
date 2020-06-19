#Importando Pacotes
using JuMP, Gurobi, DelimitedFiles

#Preparação dos dados
path1 = "network.csv"
network_data = readdlm(path, ',', header = true)
data = network_data[1]
header = network_data[2]

s = round.(Int64, data[:, 1])
t = round.(Int64, data[:, 2])

c = data[:, 3]
u = data[:, 4]

path2 = "rhs.csv"
network_data2 = readdlm(path2, ',', header = true)
data2 = network_data2[1]
header2 = network_data[2]

b = data2[:, 2]

num_nodes = max(maximum(s), maximum(t)) #max compara dois números, maximum identifica o maior elemento do vetor
num_arcs = length(s)

#Criando o grafo

nodes = 1:num_nodes

custo = zeros(Float64, num_arcs, num_arcs)
fluxo = zeros(Float64, num_arcs, num_arcs)

for i = 1:num_arcs
    custo[s[i], t[i]] = c[i]
    if (u[i] == Inf)
        fluxo[s[i], t[i]] = 100000
    end
end

fluxo[3,5] = 1

arcs = Tuple((s[i], t[i]) for i in 1:num_arcs)

#Preparando o modelo

model = Model(Gurobi.Optimizer)

#Definindo as variáveis de decisão

@variable(model, 0 <= x[i in s, j in t] <= fluxo[i, j])

#função objetivo

@objective(model, Min, sum(custo[s[i], t[i]] * x[s[i],t[i]] for i in 1:num_arcs))

#Restrições

for j in 1:num_nodes
 @constraint(model, sum(x[s[i], t[i]] for i in 1:num_arcs) - sum(x[t[i], s[i]] for i in 1:num_arcs) == b[j])
end

println(model)

optimize!(model)
println("objetivo:", objective_value(model))
println("X = ", value(x))
