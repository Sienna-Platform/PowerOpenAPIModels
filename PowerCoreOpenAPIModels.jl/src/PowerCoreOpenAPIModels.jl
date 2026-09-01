module PowerCoreOpenAPIModels

using OpenAPI, JSON3, HTTP
using InfrastructureCoreOpenAPIModels

include("models/model_ACBusType.jl")
include("models/model_AdmittanceUnitBasis.jl")
include("models/model_DbdPnts.jl")
include("models/model_EmissionBasis.jl")
include("models/model_EnergyUnit.jl")
include("models/model_EnergyUnitBasis.jl")
include("models/model_FdbdPnts.jl")
include("models/model_GenericOperationCost.jl")
include("models/model_HydroReservoirCost.jl")
include("models/model_HydroStorageGenerationCost.jl")
include("models/model_ImpedanceUnitBasis.jl")
include("models/model_IncrementalCurveFunctionData.jl")
include("models/model_AverageRateCurve.jl")
include("models/model_IncrementalCurve.jl")
include("models/model_InputOutputCurveFunctionData.jl")
include("models/model_InputOutputCurve.jl")
include("models/model_MassUnit.jl")
include("models/model_PollutantType.jl")
include("models/model_PrimeMovers.jl")
include("models/model_ProductionVariableCostCurve.jl")
include("models/model_HydroGenerationCost.jl")
include("models/model_ReservoirLocation.jl")
include("models/model_ShuntAdmittanceUnitBasis.jl")
include("models/model_StartUpShutDown.jl")
include("models/model_StartUpStages.jl")
include("models/model_StorageCostStartUp.jl")
include("models/model_StorageCostStartUpOneOf.jl")
include("models/model_StorageTech.jl")
include("models/model_ThermalFuels.jl")
include("models/model_ThermalGenerationCostStartUp.jl")
include("models/model_ThermalGenerationCost.jl")
include("models/model_TimeSeriesAverageRateCurve.jl")
include("models/model_TimeSeriesIncrementalCurve.jl")
include("models/model_TimeSeriesInputOutputCurve.jl")
include("models/model_TurbinePump.jl")
include("models/model_TwoTerminalLoss.jl")
include("models/model_ValueCurve.jl")
include("models/model_CostCurve.jl")
include("models/model_FuelCurve.jl")
include("models/model_ImportExportCost.jl")
include("models/model_ImportExportTimeSeriesCost.jl")
include("models/model_LoadCost.jl")
include("models/model_MarketBidCost.jl")
include("models/model_MarketBidTimeSeriesCost.jl")
include("models/model_RenewableGenerationCost.jl")
include("models/model_StorageCost.jl")
include("units.jl")
include("register.jl")

export AverageRateCurve
export CostCurve
export DbdPnts
export FdbdPnts
export FuelCurve
export GenericOperationCost
export HydroGenerationCost
export HydroReservoirCost
export HydroStorageGenerationCost
export ImportExportCost
export ImportExportTimeSeriesCost
export IncrementalCurve
export IncrementalCurveFunctionData
export InputOutputCurve
export InputOutputCurveFunctionData
export LoadCost
export MarketBidCost
export MarketBidTimeSeriesCost
export ProductionVariableCostCurve
export RenewableGenerationCost
export StartUpShutDown
export StartUpStages
export StorageCost
export StorageCostStartUp
export StorageCostStartUpOneOf
export ThermalGenerationCost
export ThermalGenerationCostStartUp
export TimeSeriesAverageRateCurve
export TimeSeriesIncrementalCurve
export TimeSeriesInputOutputCurve
export TurbinePump
export TwoTerminalLoss
export ValueCurve

for n in names(InfrastructureCoreOpenAPIModels); n === :InfrastructureCoreOpenAPIModels && continue; @eval export $n; end

end
