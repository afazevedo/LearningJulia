using DelimitedFiles, JuMP, Cbc, Parsers

#Dados

path = "ins_120.txt"

arq = readdlm(path, ' ', header=true)
head = arq[2] #Armazena conteúdo da primeira linha
data = arq[1] #Armazena o resto

num_itens = parse(Int64, head[1,1]) #Convertendo para inteiro
num_bins = parse(Int64, head[1,2]) #Convertendo para inteiro
Q = parse(Int64, head[1,3]) #Capacidade máxima
w = data[:,1] #Preenche vetor w
I = collect(1:num_itens) # Conjunto de itens
K = collect(1:num_bins) # Conjunto de bins

#Modelo
m = Model(Cbc.Optimizer)
set_time_limit_sec(m, 300) #Bota limite 300s para resolver

#Variáveis
@variable(m, y[k in K], Bin)
@variable(m, x[i in I, k in K], Bin)

#Função Objetivo
@objective(m, Min, sum(y[k] for k in K))

#Restrições
@constraint(m, [i in I], sum(x[i,k] for k in K) == 1)
@constraint(m, [k in K], sum(w[i]*x[i,k] for i in I) <= (Q*y[k]))

@time optimize!(m) #Resolve e imprime o tempo
println(termination_status(m)) #Mostra o status do modelo

#Impressão da Solução

for i in I
    for k in K
        if value(x[i,k]) == 1
            println("O item ", i, " foi atribuído a caixa ", k)
        end
    end
end

println("O custo ótimo foi: ", objective_value(m))
