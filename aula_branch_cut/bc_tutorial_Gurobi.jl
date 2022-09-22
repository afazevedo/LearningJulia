using Gurobi, JuMP

cb_calls = Cint[]
function cb(cb_data, cb_where::Cint)
    #https://www.gurobi.com/documentation/9.0/refman/cb_codes.html
    #https://www.gurobi.com/documentation/9.0/refman/optimization_status_codes.html

    # You can reference variables outside the function as normal
    push!(cb_calls, cb_where)

    # You can select where the callback is run
    if cb_where == GRB_CB_PRESOLVE #Callback Presolve
        resultP = Ref{Cint}()
        GRBcbget(cb_data, cb_where, GRB_CB_PRE_COLDEL, resultP) # The number of columns removed by presolve to this point.
        cdels = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_PRE_ROWDEL, resultP) # The number of rows removed by presolve to this point.
        rdels = resultP[]
        println(cdels, " colunas e ", rdels, " linhas foram removidas")

    elseif cb_where == GRB_CB_SIMPLEX #Simplex Callback
        resultP = Ref{Cint}()
        GRBcbget(cb_data, cb_where, GRB_CB_SPX_ITRCNT, resultP) # Current simplex iteration count.
        itcnt = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_SPX_OBJVAL, resultP) # Current simplex objective value.
        obj = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_SPX_PRIMINF, resultP) # Primal infeasibility measure.
        pinf = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_SPX_DUALINF, resultP) # Dual infeasibility measure.
        dinf = resultP[]
        println("Iteracao ", itcnt, ": obj = ", obj, " pinf = ", pinf, " dinf = ", dinf)
    elseif cb_where == GRB_CB_MIP #MIP callback
        resultP = Ref{Cint}()
        GRBcbget(cb_data, cb_where, GRB_CB_MIP_NODCNT, resultP) # Current node count.
        nodecnt = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIP_OBJBST, resultP) # Best objective value found so far.
        objbst = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIP_OBJBND, resultP) # Bound on objective function.
        objbnd = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIP_SOLCNT, resultP) # Current solution count.
        solcnt = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIP_ITRCNT, resultP) # Current iteration count.
        itcnt = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIP_CUTCNT, resultP) # Current cut count.
        cutcnt = resultP[]
        println(
            "Iteracao ",
            itcnt,
            ": nodecnt = ",
            nodecnt,
            " objbst = ",
            objbst,
            " objbnd = ",
            objbnd,
            " solcnt = ",
            solcnt,
            " cutcnt = ",
            cutcnt,
        )
    elseif cb_where == GRB_CB_MIPSOL #MIPSOL callback
        resultP = Ref{Cint}()
        GRBcbget(cb_data, cb_where, GRB_CB_MIPSOL_NODCNT, resultP) # Current node count.
        nodecnt = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIPSOL_OBJBST, resultP) # Best objective value found so far.
        objbst = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIPSOL_OBJBND, resultP) # Bound on objective function.
        objbnd = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIPSOL_SOLCNT, resultP) # Current solution count.
        solcnt = resultP[]
        GRBcbget(cb_data, cb_where, GRB_CB_MIPSOL_SOL, resultP) # Current solution.
        solution = resultP[]
        println(
            "**** Nova Solução no nó ",
            nodecnt,
            " obj= ",
            objbst,
            " sol = ",
            solcnt,
            " *****",
        )
    elseif cb_where == GRB_CB_MIPNODE #MIPNODE callback
        resultP = Ref{Cint}()
        println("**** Novo nó! ****")
        GRBcbget(cb_data, cb_where, GRB_CB_MIPNODE_NODCNT, resultP) # Current node count.
        println("Nó: ", resultP[])
        GRBcbget(cb_data, cb_where, GRB_CB_MIPNODE_STATUS, resultP) # Current node status.
        status = resultP[]
        println("Status: ", status)
    end
end

model = direct_model(Gurobi.Optimizer())
set_optimizer_attribute(model, "LazyConstraints", 1) # Habilita lazy constraints
set_optimizer_attribute(model, "Cuts", 0) # Desabilita Cortes do Gurobi 
set_optimizer_attribute(model, "Presolve", 0) # Desabilita Presolve do Gurobi
set_optimizer_attribute(model, "Heuristics", 0) # Desabilita Heurísticas do Gurobi
set_optimizer_attribute(model, "OutputFlag", 0) # Desabilita a saída na tela do Gurobi

@variable(model, 0 <= x <= 2.5, Int)
@variable(model, 0 <= y <= 2.5, Int)
@objective(model, Max, y)

MOI.set(model, Gurobi.CallbackFunction(), cb)

optimize!(model)

# Solução final
println("x = ", value(x), " y = ", value(y))
println("O custo ótimo foi: ", objective_value(model))
