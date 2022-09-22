d = [10 6 20 32 15 28 3 19 8 1]
c = [
    10 6 20 32 15 28 3 19 8 13
    10 7 11 12 32 15 20 26 4 41
    13 17 31 37 21 5 13 15 14 12
    4 13 14 22 8 31 26 11 12 23
    21 21 13 18 9 27 11 16 26 32
    32 18 11 14 11 11 16 32 34 8
    15 9 13 12 14 15 32 8 12 9
    28 32 15 2 17 12 9 6 11 6
]
p = 3

locations = 1:size(c, 1) # the set, I
customers = 1:length(d) # the set, J

function lowerBound(lambda)
    # Passo 1: Calculando v
    v = Array{Float64}(undef, size(locations))
    for i in locations
        v[i] = 0
        for j in customers
            v[i] = v[i] + min(0, d[j] * c[i, j] - lambda[j])
        end
    end

    # Passo 2: Ordenando v do mais negativo ao menos negativo, pegando os índices
    idx = sortperm(v)

    # Passo 3: Identificando y
    y = zeros(Int, size(locations))

    for i = 1:p
        y[idx[i]] = 1
    end

    # Passo 4: Identificando x
    x = zeros(Int, length(locations), length(customers))
    for i in locations, j in customers
        if y[i] == 1 && d[j] * c[i, j] - lambda[j] < 0
            x[i, j] = 1
        end
    end

    # Calculando o lower bound
    Z_D = 0.0
    for j in customers
        Z_D = Z_D + lambda[j]
        for i in locations
            Z_D = Z_D + d[j] * c[i, j] * x[i, j] - lambda[j] * x[i, j]
        end
    end

    return Z_D, x, y
end

function upperBound(y)
    # Calculando x, dado y a partir da proximidade
    x = zeros(Int, length(locations), length(customers))

    for j in customers
        fac_prox = 10000
        idx = -1
        for i in locations
            if y[i] == 1 && c[i, j] <= fac_prox
                idx = i
                fac_prox = c[i, j]
            end
        end
        x[idx, j] = 1
    end

    # Calculando Z
    Z = 0.0
    for i in locations
        for j in customers
            Z = Z + d[j] * c[i, j] * x[i, j]
        end
    end

    return Z, x
end

function lagrangianRelaxation(p)
    # Número máximo de iterações permitidas no algoritmo
    MAX_ITER = 10000

    # Definindo vetores vazios do tipo Float64 para os limites superiores e inferiores
    UB = Array{Float64}(undef, 0) # Limite superior
    LB = Array{Float64}(undef, 0) # Limite inferior

    # Os melhores upper and lower bounds
    Z_UB = Inf
    Z_LB = -Inf

    # A melhor solução viável encontrada
    x_best = zeros(length(locations), length(customers))
    y_best = zeros(length(locations))

    # Inicializando multiplicadores de lagrange com zero do tamanho de clientes
    lambda = zeros(size(customers))

    for k = 1:MAX_ITER

        # Obtendo limites inferiores e superiores
        Z_D, x_D, y = lowerBound(lambda) # resolvendo o subproblema lagrangeano
        Z, x = upperBound(y) # buscando uma solução viável

        # Atualizando o upper bound
        if Z < Z_UB
            Z_UB = Z
            x_best = x
            y_best = y
        end

        # Atualizando o lower bound
        if Z_D > Z_LB
            Z_LB = Z_D
        end

        # Determinando o tamanho de passo e atualizando o multiplicador
        theta = 1.0
        residual = 1 .- transpose(sum(x_D, dims = 1))
        t = theta * (Z_UB - Z_D) / sum(residual .^ 2)
        lambda = lambda + t * residual

        # Calculando o gap de otimizalidade (1a condição de parada)
        opt_gap = (Z_UB - Z_LB) / Z_UB
        if opt_gap < 0.000001
            print("Saindo por otimalidade!")
            break
        end

    end

    return Z_UB, x_best, y_best, UB, LB
end

Z_UB, x_best, y_best, UB, LB = lagrangianRelaxation(p)
