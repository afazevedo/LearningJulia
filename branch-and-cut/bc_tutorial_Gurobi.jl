using Gurobi, JuMP


function leitura(n)
  ind = collect(Int32, 1:n)
  c = ones(n)
    return ind, c
end


function cb(cb_data, cb_where)
  #https://www.gurobi.com/documentation/9.0/refman/cb_codes.html
  #https://www.gurobi.com/documentation/9.0/refman/optimization_status_codes.html

  if cb_where == CB_PRESOLVE
    #Callback Presolve
    cdels = cbget_pre_coldel(cb_data, cb_where)
    rdels = cbget_pre_rowdel(cb_data, cb_where)
    println(cdels, " colunas e ", rdels, " linhas foram removidas")

  elseif cb_where == CB_SIMPLEX
    #Simplex Callback
    itcnt = cbget_spx_itrcnt(cb_data, cb_where)
    obj = cbget_spx_objval(cb_data, cb_where)
    ispert = cbget_spx_ispert(cb_data, cb_where)
    pinf = cbget_barrier_priminf(cb_data, cb_where)
    dinf = cbget_barrier_dualinf(cb_data, cb_where)
    #println(itcnt, obj, ispert, pinf, dinf)

  elseif cb_where == CB_MIP
  #MIP callback
    nodecnt = cbget_mip_nodcnt(cb_data, cb_where)
    objbst = cbget_mip_objbst(cb_data, cb_where)
    objbnd = cbget_mip_objbst(cb_data, cb_where)
    solcnt = cbget_mip_solcnt(cb_data, cb_where)
    actnodes = cbget_mip_nodlft(cb_data, cb_where)
    itcnt = cbget_mip_itrcnt(cb_data, cb_where)
    cutcnt = cbget_mip_cutcnt(cb_data, cb_where)
    #println(nodecnt, actnodes, itcnt, objbst, objbnd, solcnt, cutcnt)

  elseif cb_where == CB_MIPSOL
  #MIPSOL callback
    nodecnt = cbget_mipsol_nodcnt(cb_data, cb_where)
    obj = cbget_mipsol_obj(cb_data, cb_where)
    solcnt = cbget_mipsol_solcnt(cb_data, cb_where)
    solution = cbget_mipsol_sol(cb_data, cb_where)
  #println("**** Nova Solução no nó ", nodecnt, " obj= ", obj, " sol = ", solcnt, " *****")

  elseif cb_where == CB_MIPNODE
  #MIPNODE callback
    eps = 0.0001
    n = 2
    println("**** Novo nó! ****");
    println("Nó: ", cbget_mipnode_nodcnt(cb_data, cb_where))
    status = cbget_mipnode_status(cb_data, cb_where)
    if status == 2 #optimal
      x_val, y_val = cbget_mipnode_rel(cb_data, cb_where)
      #A solução da relaxação irá ser (1.5, 2.0)
      #Podemos adicionar um corte que retire essa solução fracionária
      if x_val + y_val > 3 + eps
        #impressão do corte
        println("Corte: ", x_val, " + ", y_val, " < 3")
        ind, c = leitura(n)
        cbcut(cb_data, ind, c, '<', 3.0)
      end
    end
  end
end


m = Model(Gurobi.Optimizer)
set_optimizer_attribute(m, "PreCrush", 1) #Para usar UserCuts
set_optimizer_attribute(m, "Cuts", 0) #Desabilitar outros cortes
set_optimizer_attribute(m, "Presolve", 0) #Desabilitar presolve
set_optimizer_attribute(m, "Heuristics", 0) #Desabilitar heurística
#set_optimizer_attribute(m, "OutputFlag", 0) #Desabilitar log

# Variáveis
@variable(m, 0 <= x <= 2, Int)
@variable(m, 0 <= y <= 2, Int)

# Função Objetivo
@objective(m, Max, x + 2*y)

# Restrição
@constraint(m, y + x <= 3.5)

MOI.set(m, Gurobi.CallbackFunction(), cb)

# Resolver o problema
optimize!(m)

# Solução final
println("x = ", value(x), " y = ", value(y))
println("O custo ótimo foi: ", objective_value(m))
