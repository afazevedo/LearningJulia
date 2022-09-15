using DelimitedFiles, Gurobi, JuMP, Dictionaries

path = pwd()*"\\leitura_de_arquivo\\instancias\\"
arq_ass = path*"assign100.txt"
arq_spl = path*"123Unif.txt"
arq_knap = path*"fl_l-d_kp_10_269.txt"

number_of_lines = countlines(arq_knap)

n = readdlm(arq_knap, Int64)[1, 1]
b = readdlm(arq_knap, Int64)[1, 2]
c = readdlm(arq_knap, Int64)[2:end, 1]
a = readdlm(arq_knap, Int64)[2:end, 2]

#==================================#

number_of_lines = countlines(arq_spl)
n = readdlm(arq_spl)[3, 1]
f = readdlm(arq_spl)[3, 2]

c = zeros(Int64, (n, n))

for line in 5:number_of_lines
    i = readdlm(arq_spl)[line, 1]
    j = readdlm(arq_spl)[line, 2]
    c[i,j] = readdlm(arq_spl)[line, 3]
end


#==================================#

path = pwd()*"\\leitura_de_arquivo\\instancias\\"
arq_ass = path*"assign100.txt"
arq_spl = path*"123Unif.txt"
arq_knap = path*"mknap1.txt"

n = readdlm(arq_ass)[1]
c = zeros(n, n)
i = 1
it = 0
for line in 2:countlines(arq_ass)
    lin = readdlm(arq_ass)[line, :]
    for elem in lin
        if elem != ""
            it += 1
            c[i, it] = elem
        end

        if it == n
            i += 1
            it = 0
        end
    end
end

# E = [(1,2), (3,4), (5,6), (7,8), (9,10)]

# c_dict = Dictionary(Dict(
#     (1,2) => 3,
#     (3,4) => 5,
#     (5,6) => 7,
#     (7,8) => 9,
#     (9,10) => 11
#     )
# )

# m = Model(Gurobi.Optimizer)

# @variable(m, x[e in E])

# @objective(m, Min, sum(c_dict[e]*x[e] for e in E))