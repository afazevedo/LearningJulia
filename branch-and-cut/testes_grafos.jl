using LightGraphs, GraphPlot

function plotGraph(graph)
    nodelabel = 1:nv(graph)
    p = gplot(graph, nodelabel = nodelabel)
    display(p)
end

G = LightGraphs.SimpleGraph(n)

for i in 1:n
    for j in 1:n
        add_edge!(G, i,j)
    end 
end 

rem_edge!(G, 1,2)
LightGraphs.neighbors(G, 1)
LightGraphs.adjacency_matrix(G)

A = [1,2,3]
B = [5,6,2]

A ∪ B
A ∩ B

plotGraph(G)

