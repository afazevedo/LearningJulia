# Aprendendo Julia

Se puder, dê uma estrela clicando no botão `star`🌟 para ajudar o repositório :) 


Este é um repositório de códigos em Julia, no intuito de ajudar no aprendizado da linguagem.

- Na pasta `outros_problemas` se encontra alguns exemplos de problemas resolvidos utilizando a biblioteca JuMP.
- Na pasta `aula_relaxação_lagrangeana`, se encontra um exemplo do livro *Julia Programming for Operations Research* do uso do JuMP para resolver um problema com relaxação lagrangeana, bem como um tutorial geral de como implementar. (Leitura online: https://juliabook.chkwon.net/book/lagrangian)
- Na pasta `aula_branch_cut` tem exemplos do uso do método branch-and-cut, retirado da documentação oficial do JuMP, além de um tutorial geral de como implementar. 
- Na pasta `aula_tutorial` contém exemplos didáticos de como usar o JuMP junto a um solver, além de um pdf contendo slides de como utilizar, instalar e configurar o ambiente para o uso da linguagem de programação Julia.
- Na pasta `aula_leitura_de_arquivos` contém exemplos de como ler as principais instâncias na linguagem de programação Julia.

----------------------------

Para monitoria 2022:
- https://github.com/Retsediv/ChristofidesAlgorithm
- https://jump.dev/JuMP.jl/stable/tutorials/algorithms/tsp_lazy_constraints/
- http://www.math.chalmers.se/Math/Grundutb/CTH/mve165/1112/Lectures/TSPLecture-120426.pdf

----------------------------


### Alguns pacotes interessantes para usar com o JuMP

- Solvers escritos em Julia que são chamados pelo JuMP:

https://github.com/BenChung/Socp.jl
https://github.com/TomaszWasTaken/TipiSDP.jl
https://github.com/xhub/ReSHOP.jl
https://github.com/BenChung/PIPG.jl
https://github.com/corail-research/SeaPearl.jl 
https://github.com/blegat/TraDE-OPT_2022
https://github.com/ohinder/OnePhase.jl
https://github.com/psrenergy/Anneal.jl
https://github.com/ImperialCollegeLondon/RowActionMethods.jl

- Solvers usando JuMP chamando outros solvers pelo MOI:

https://github.com/joaquimg/QuadraticToBinary.jl
https://github.com/exanauts/ActiveSetMethods
https://github.com/joehuchette/Cerberus.jl
https://github.com/JuliaIntervals/CharibdeOptim.jl
https://github.com/nexteraanalytics/LinearFractional.jl
https://github.com/joehuchette/PiecewiseLinearOpt.jl
https://github.com/henriean/solver-peeker
https://github.com/MdMahbubarRahman/Duran
https://github.com/joehuchette/QuadraticRelaxations.jl

- Solvers usando MOI:

https://github.com/LucianNita/Interesso.jl
https://github.com/ksun46/TwoLevelAlgo
https://github.com/ChrisFuelOR/NCNBD.jl
https://github.com/matbesancon/NORBiP.jl
https://github.com/manuelbb-upb/Morbit.jl
https://github.com/madeleineudell/SigmoidalProgramming.jl
https://github.com/henriquebecker91/GuillotineModels.jl
https://github.com/maihoanganh/ctpPOP
https://github.com/maihoanganh/SpectralPOP
https://github.com/kibaekkim/BundleMethod.jl
https://github.com/wangjie212/NCTSSOS
https://github.com/Shuvomoy/NExOS.jl
https://github.com/rileybadenbroek/CopositiveAnalyticCenter.jl
https://github.com/madsjulia/Mads.jl
