#=
Arquivo para mostrar utilidades da linguagem Julia
Autor: Amanda Ferreira de Azevedo
Data: 20/09/2020
=#

# Pacote muito bom para grafos: Graphs 
# https://juliagraphs.org/Graphs.jl/dev/

using Graphs

n = 5 # número de vértices

# g = erdos_renyi(n, 0.5) # Definição de um grafo aleatório com n vértices e probabilidade de 0.5 de existir uma aresta entre dois vértices
G = SimpleGraph(n) # Definição de um grafo simples com n vértices

c = rand((1:10), n, n) # Matriz de custos aleatórios tamanho nxn com valores entre 1 e 10

for i = 1:n
    for j = (i+1):n
        if c[i, j] != 0
            add_edge!(G, i, j) # Adiciona uma aresta entre os vértices i e j
        end
    end
end

has_edge(G, 2, 1)

rem_edge!(G, 1, 2) # Remove a aresta entre os vértices 1 e 2

nv(G) # Número de vértices do grafo G
ne(G) # Número de arestas do grafo G

neighbors(G, 1) # Vértices vizinhos do vértice 1

# Algoritmo de Prim para encontrar a árvore geradora mínima
T_out = prim_mst(G, c)
T = SimpleGraph(nv(G))
for edge in T_out
    add_edge!(T, edge)
end


# Pacote para plotar grafos
using GraphPlot

function plotGraph(graph)
    nodelabel = 1:nv(graph)
    p = gplot(graph, nodelabel = nodelabel)
    display(p)
end

plotGraph(G)
plotGraph(T)
