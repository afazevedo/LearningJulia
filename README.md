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

- Diversos pacotes usando MOI:

Benchmarking: https://github.com/joehuchette/Justitia.jl

Regression: https://github.com/kshedden/QuantileNN.jl/

DecisionTree Training: https://github.com/1ozturkbe/OptimalTrees.jl

DecisionTree Training: https://github.com/1ozturkbe/OCTHaGOn.jl

Robust Regression: https://github.com/OpenMendel/WiSER.jl

NN Verification: https://github.com/castrong/SafePerception

ReLu NN verification: https://github.com/vtjeng/MIPVerify.jl

ReLu NN verification: https://github.com/sisl/NeuralVerification.jl

ReLu NN control loop verification: https://github.com/sisl/OVERTVerify.jl

ReLu NN reachability: https://github.com/StanfordMSL/Neural-Network-Reach

Power Network planner: https://github.com/Electa-Git/FlexPlan.jl

Power Network stuff: https://github.com/sei-international/NemoMod.jl

Power Network solver: https://github.com/exanauts/Argos.jl

Power Network stuff: https://github.com/sdwhardy/cordoba.jl

Robust Control Invariant Sets: https://github.com/blegat/SwitchOnSafety.jl

Simulation with Optimizing Agents: https://github.com/NREL/EMISAgentSimulation.jl

Custom Branch and Bound based Vehicle Inventory Managment: https://github.com/kreikrei/Tomato.jl

Time Series Prediction comparing Mixed Integer to other approaches: https://github.com/jacobusmmsmit/CoTSOpt

Example p-Lagrangian relaxation method for noncovnex MIQCQP: https://github.com/Nikita-Belyak/p_Lagrangian_Decomposition-

SVMs: https://github.com/matbesancon/SimpleSVMs.jl

Comply with German Radiation emission laws: https://github.com/Ph0non/NuVe.jl

Pallet loading MILP: https://github.com/ToralfFrich/Master_Thesis

Constraint-based metabolic modeling: https://github.com/pauljensen/Tiger.jl

Truncated k moment: https://github.com/votroto/TKMPMeasures.jl

Hydro Unit Commitment and Loading: https://github.com/petrabartmeyer/6BSGI

Zonal electricity markets: https://github.com/qlete/ZonalLongterm

Sampling for interdiction problems: https://github.com/claud10cv/SamplingInterdiction.jl

Text Layouter: https://github.com/RomeoV/TextLayouter.jl

Vehicle Routing Problems with Time Windows: https://github.com/chkwon/Routing.jl

Electricity balancing using demand side heating control: https://github.com/winkmal/jumpingSchedule

Commuter route bidding: https://github.com/jacfilip/RouteBidModel

Linear Programming Diet Planner: https://github.com/kavir1698/DietRecommender.jl

Space Shuttle Reentry Trajectory: https://github.com/ferrolho/space-shuttle-reentry-trajectory

Bayesian Adaptive Designs for single arm trials with binary outcome: https://github.com/kkmann/bad.jl

2D Contact physics simulation by solving Linear Complementarity Problems: https://github.com/adubredu/contact_sim.jl

Column Generation for Constrained POMDPs: https://github.com/qhho/CGCP.jl

Barbell weight lifting training plan notebook: https://github.com/spatil47/barbell-loadings

Generating Knapsack cuts: https://github.com/artalvpes/KnapsackCuts

Automate creation of secret santa: https://github.com/tasseff/SecretSanta.jl

Sequential Convex Programming For Non-Linear Stochastic Optimal Control: https://github.com/StanfordASL/stochasticSCP

MPC implementation: https://github.com/Amirrezz94/PkgMPC.jl

PV+storage system design for thermosyphon pump dispatch: https://github.com/hdunham/Thermosyphon_REopt_Analysis

multi-stage decision problems under uncertainty: https://github.com/gamma-opt/DecisionProgramming.jl

MILP models for a metro based crowd shipping problem: https://github.com/FilippoRanza/crowd-shipping-models

Toy Multi objective optimization using epsilon method: https://github.com/remi-garcia/KirlikSayin.jl

inverse game solver for noisy, partially observable uncooperative games: https://github.com/PRBonn/PartiallyObservedInverseGames.jl/search?q=optimize%21

semi-parametric structural model for electricity forward curves: https://github.com/LAMPSPUC/ForwardCurveSmoother

solving the Muffin Problem: https://github.com/GeneralPoxter/Muffins.jl

multi-locus sequence typing pipeline: https://github.com/WGS-TB/MentaLiST

Risk- and Variance-Aware Electricity Pricing: https://github.com/mieth-robert/acccopf_pricing

urban-traffic using Ollivier-Ricci curvatures: https://github.com/msmerlak/urban-traffic

sharp regression for discontinuities: https://github.com/nignatiadis/RegressionDiscontinuity.jl

maximum positively invariant set of polynomial ODEs: https://github.com/wangjie212/SparseDynamicSystem

Design of last mile delivery systems: https://github.com/anmol1104/LastMile-Resilience (nice model but missing data)

Notebook: solve bi objective optimization using scalarisation: https://github.com/sburden-group/hopper_handshake

Distributionally Robust Multistage Stochastic Mixed Integer Programming: https://github.com/hideakiv/DRMSMIP.jl

optimal power shutoff for wild fire prevention: https://github.com/WISPO-POP/PowerModelsWildfire.jl

Rocket Ascent Profile Optimizer Kerbal&Earth example: https://github.com/WhiffleFish/AscentOptimizer

energy infrastructure optimization within a large industrial site: https://github.com/timmyfaraday/EnergyInfrastructureOptimization.jl

framework for scheduling research: https://github.com/bprzybylski/Scheduling.jl

solve complex multi-stage (and multi-horizon) capacity expansion problems: https://github.com/EPOC-UoA/JuDGE.jl/

Fenske-Underwood-Gilliand method for sizing distillation columns: https://github.com/jmox0351/fug

QPControl: https://github.com/adubredu/QPJuMPControl.jl

automating assigning students projects: https://github.com/zsunberg/ProjectAssigner.jl

Non parametric efficiency and productivity analysis through the B-disposal scheme: https://github.com/sylvaticus/BDisposal.jl

Surrogate Lagrangian Jobshop Solver: https://github.com/PSORLab/Jobshop.jl

Linear Programming course PUC: https://github.com/Thiago-NovaesB/MestradoPuc.jl

mixed-integer linear programming and linear programming (MILP and LP) relaxations: https://github.com/sujeevraja/PolyhedralRelaxations.jl

Optimal Constrained Task PDDL Planning as Mixed Integer Programming: https://github.com/adubredu/miplanner.jl

Piecewise-Linear Motion Planning: https://github.com/bachirelkhadir/PathPlanningSOS.jl

Robust Dual Dynamic Programming (RDDP): https://github.com/zidanessf/RDDP.jl

Prize-Collecting TSPTW: https://github.com/cocomoff/PCTSPTW.jl

several combinatorial-optimisation algorithms with a common interface: https://github.com/dourouc05/Kombinator.jl

Cartpole system playground: https://github.com/obrusvit/cartpole-system-playground

integrate inventory and transportation to plan replenishment https://github.com/kreikrei/DispatchOps.jl

JuMPeR rewrite: https://github.com/MichaelHartisch/RobustOptimization.jl

Canteen simulation: https://github.com/jochenkrattenmacher/DTABM

multiway number partitioning problem using MILP: https://github.com/beacon-biosignals/MultiwayNumberPartitioning.jl

de novo metabolic pathway construction using MILP: https://github.com/VictorVeraFrazao/OptStoic

tasking of Earth observation satellites: https://github.com/sisl/SatelliteTasking.jl

rigourous and accurate lower bounds on the logarithmic Sobolev constants of finite Markov chains: https://github.com/oisinfaust/LogSobolevRelaxations

electricity market battery dispatch https://github.com/psrenergy/BatteryMarket.jl
