function leitura_arquivo()
    #=
       Função para fazer a leitura da instância a ser resolvida
       Retorna as informações sobre a instância
    =#
end

function subproblema_lagrangeano(u)
    #=
       Retorna o limitante superior/inferior obtido como solução ótima do subproblema lagrangeano
       Pode retornar informação para a solução viável
    =#
end

function solucao_viavel()
    #=
    Retorna uma solução viável para um problema e seu valor
    =#
end

function subgradiente(maxIter, p_i, p_i_min, eps)
    u = zeros(dimensão) # Colocar a dimensão do multiplicador
    best_lim_inf = 0
    best_lim_sup = 9999999
    improve = 0

    ub, x_viavel = solucao_viavel()

    for k ∈ 1:maxIter
        z, x_sub = subproblema_lagrangeano(u)

        #=
        Se z for melhor que o melhor limite encontrado, então atualize o best_lim!
        Senão, faça improve += 1
        =#

        #= 
        Atualizar o valor da solução viável a partir de u (ou da solução do subproblema)
        Se a nova solução viável encontrada for melhor que a melhor encontrada até então, atualize o best_lim!
        =#

        #=
        Condições de otimalidade
            Se best_lim_sup - best_lim_inf for menor que 1, então pare! 
            A solução ótima é exatamente a solução viável encontrada.
        =#

        #= Opcional.
            Verifica as condições de complementariedade-folga para saber se a solução do subproblema é ótima.
        =#

        #=
        Redução de pi.
           Sempre que maxIter/20 iterações consecutivas ocorrem sem melhora em z,
           isto é, improve >= maxIter/20 reduza pi, fazendo pi = pi/2

           Se ao reduzir o pi, ele for tão pequeno quanto pi_min, pare!
        =#

        #= 
        Calcular o tamanho de passo.
            Calcular soma_s como sendo a "restrição dualizada" nas variáveis do subproblema
            Gerando s[i].
            T = p_i*(ub-z (ou z-ub))/(soma_s)^2
            Se T for menor que pi_min, pare! Tamanho de passo muito pequeno.
        =#

        #=
        Atualização dos multiplicadores.
        Para todo i, fazer
            u[i] = max{0, u[i] + (1+eps)*T*s[i]}
        =#
    end

    # retornar melhor solução encontrada e os melhores limites
end

# Sugestões de parâmetros
maxIter = 1000
p_i = 2
pi_min = 0.0001
eps = 0.1


