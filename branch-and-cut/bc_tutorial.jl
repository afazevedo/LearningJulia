function leitura(n)
    ind = collect(Int32, 1:n)
    c = ones(n)
      return ind, c
  end

  
function separacao()
    # Aqui será feita o algoritmo de separação, onde serão identificadas as possíveis soluções que podem ser violadas
end

function callbacks(cb_data, cb_where)
    if cb_where == CB_MIPNODE

        status = cbget_mipnode_status(cb_data, cb_where)

        if status == 2 #optimal
            x_val = cbget_mipnode_rel(cb_data, cb_where) # relaxação linear

            soma = separacao()
            if soma >= 1 
                # Essa restrição foi violada, logo é adicionada como plano de corte
                println("Restrição violada!!")
                ind, c = leitura(n)
                cbcut(cb_data, ind, c, '<', 1.0)
            end
        end
    end
end


# Modelo do problema

# PreCrush = 1 : Parâmetro para sinalizar o corte
# "Cuts" => 0 : Cortes do Solver desabilitado
# "Heuristics" => 0.0 : Heurísticas do Solver desabilitada

modelo = Model(
    optimizer_with_attributes(
        Gurobi.Optimizer, "PreCrush" => 1, "Cuts" => 0, "Presolve" => 0, "Heuristics" => 0.0
        )
)


# Objetivo

# Restrições 

MOI.set(modelo, Gurobi.CallbackFunction(), callbacks)

optimize!(modelo)