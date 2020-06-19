using Parsers

euc = zeros(250, 250)
man = zeros(250, 250)

f = open("out0.txt"); 

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
	euc[k,k] = 0
	man[k,k] = 0
end

println(man[2,3])

