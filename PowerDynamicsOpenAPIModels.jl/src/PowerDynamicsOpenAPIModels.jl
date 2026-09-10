module PowerDynamicsOpenAPIModels

using OpenAPI, JSON3, HTTP
using InfrastructureCoreOpenAPIModels
using PowerCoreOpenAPIModels

include("models/modelincludes.jl")
include("units.jl")
include("register.jl")

export AVRFixed
export AVRSimple
export AVRTypeI
export AVRTypeII
export ActiveRenewableControllerAB
export AndersonFouadMachine
export BaseMachine
export DEGOV
export DEGOV1
export DbdPnts # does this need to be here?
export ESAC1A
export ESAC6A
export ESAC8B
export ESDC1A
export ESDC2A
export ESST1A
export ESST4B
export EX4VSA
export EXAC1
export EXAC1A
export EXAC2
export EXPIC1
export EXST1
export FdbdPnts # does this need to be here?
export FiveMassShaft
export FullMachine
export GasTG
export GeneralGovModel
export HydroTurbineGov
export IEEEST
export IEEET1
export IEEETurbineGov1
export MarconatoMachine
export MinMax # does this need to be here?
export OneDOneQMachine
export PIDGOV
export PSS2A
export PSS2B
export PSS2C
export PSSFixed
export PSSSimple
export RECurrentControlB
export ReactiveRenewableControllerAB
export RenewableEnergyConverterTypeA
export RoundRotorExponential
export RoundRotorMachine
export RoundRotorQuadratic
export SCRX
export SEXS
export ST6B
export ST8C
export STAB1
export SalientPoleExponential
export SalientPoleMachine
export SalientPoleQuadratic
export SauerPaiMachine
export SimpleAFMachine
export SimpleFullMachine
export SimpleMarconatoMachine
export SingleMass
export SteamTurbineGov1
export TGFixed
export TGSimple
export TGTypeI
export TGTypeII
export UpDown # does this need to be here?
export WPIDHY

for n in names(InfrastructureCoreOpenAPIModels); n === :InfrastructureCoreOpenAPIModels && continue; @eval export $n; end
for n in names(PowerCoreOpenAPIModels); n === :PowerCoreOpenAPIModels && continue; @eval export $n; end

end
