
function leitura(path, a, c, n)
    b = readdlm(path, Int64)[1,2]

    for i in 2:n
        a[i] = readdlm(path, Int64)[i,1]
        c[i] = readdlm(path, Int64)[i,2]
    end

    return b
end



function print_solution()
    soma = 0
    for i in 1:n
        if value(x[i]) == 1
            println("Item ", i, " foi escolhido, com peso: ", a[i], " e custo: ", c[i])
            soma = soma + a[i]
        end
    end
    println("Soma total: ", soma)
    println("Capacidade máxima: ", b)
    println("O custo ótimo foi: ", objective_value(m))
end
