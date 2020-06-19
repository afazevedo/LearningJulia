#Linguagem: Julia

#Importando Pacotes
using DelimitedFiles, Parsers

euc = zeros(1068, 1068)
man = zeros(1068, 1068)

f = open("out0_UTM.txt");

m = readline(f);
y = split(join(m), keepempty=false)

vertices = parse(Int64, y[1])
arestas = parse(Int64, y[2])

println("O número de vertices é: ", vertices)
println("O número de arestas é: ", arestas)

m = readline(f);

for a in 1:vertices-1
	for b in a+1:vertices
		m = readline(f);
		y = split(join(m), keepempty=false)
		i = y[1]
		j = y[2]
		i = parse(Int64, i)
		j = parse(Int64, j)
		euc[i,j] = parse(Float64, y[3])
		man[i,j] = parse(Float64, y[4])
		euc[j,i] = euc[i,j]
		man[j,i] = man[i,j]
	end
end



for i in 2:vertices
	for j in 1:vertices
		euc[i,j] = euc[i-1,j]
		euc[i,j] = euc[j,i]
		man[i,j] = man[i-1,j]
		man[i,j] = man[j,i]
	end
end

for k in 1:vertices
	euc[1,k] = 1;
	euc[vertices, 1] = 1;
	man[1,k] = 1;
	man[vertices, 1] = 1;
end

for i in 2:vertices
	euc[i,i-1] = 0
end


#Preparação dos dados
path = "TAULA_MAP_SCENSAL.csv"
taula_data = readdlm(path, ',', header = true)
data = taula_data[1]
header = taula_data[2]

idosos = data[:,7]

for k in 1:vertices
	euc[1,k] = idosos[k]
end

arq = open("idosos.txt", "w")

write(arq, string(vertices)*"\n")

for i in 1:vertices
	for j in 1:vertices
		s1 = string(euc[i,j])
		write(arq, s1*" ")
	end
end

close(arq)
