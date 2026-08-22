module PowerCoreOpenAPIModels

using OpenAPI, JSON3, HTTP, JSON, TimeZones

include("models/model_ACBusType.jl")
include("models/model_AdmittanceUnitBasis.jl")
include("models/model_ComplexNumber.jl")
include("models/model_DataSource.jl")
include("models/model_DbdPnts.jl")
include("models/model_EmissionBasis.jl")
include("models/model_EnergyUnit.jl")
include("models/model_EnergyUnitBasis.jl")
include("models/model_FdbdPnts.jl")
include("models/model_FromTo.jl")
include("models/model_FromToToFrom.jl")
include("models/model_FuelCurveFuelCost.jl")
include("models/model_FunctionData.jl")
include("models/model_GenericOperationCost.jl")
include("models/model_GeographicInfo.jl")
include("models/model_HydroReservoirCost.jl")
include("models/model_HydroStorageGenerationCost.jl")
include("models/model_ImpedanceUnitBasis.jl")
include("models/model_InOut.jl")
include("models/model_IncrementalCurveFunctionData.jl")
include("models/model_AverageRateCurve.jl")
include("models/model_IncrementalCurve.jl")
include("models/model_InputOutputCurveFunctionData.jl")
include("models/model_InputOutputCurve.jl")
include("models/model_LinearFunctionData.jl")
include("models/model_MassUnit.jl")
include("models/model_MinMax.jl")
include("models/model_PiecewiseStepData.jl")
include("models/model_PollutantType.jl")
include("models/model_PrimeMovers.jl")
include("models/model_ProductionVariableCostCurve.jl")
include("models/model_HydroGenerationCost.jl")
include("models/model_QuadraticFunctionData.jl")
include("models/model_ReservoirLocation.jl")
include("models/model_ShuntAdmittanceUnitBasis.jl")
include("models/model_StartUpShutDown.jl")
include("models/model_StartUpStages.jl")
include("models/model_StorageCostStartUp.jl")
include("models/model_StorageCostStartUpOneOf.jl")
include("models/model_StorageTech.jl")
include("models/model_SupplementalAttributeAssociation.jl")
include("models/model_TechnologyFinancialData.jl")
include("models/model_ThermalFuels.jl")
include("models/model_ThermalGenerationCostStartUp.jl")
include("models/model_ThermalGenerationCost.jl")
include("models/model_TurbinePump.jl")
include("models/model_TwoTerminalLoss.jl")
include("models/model_UnitSystem.jl")
include("models/model_UpDown.jl")
include("models/model_ValueCurve.jl")
include("models/model_CostCurve.jl")
include("models/model_FuelCurve.jl")
include("models/model_ImportExportCost.jl")
include("models/model_LoadCost.jl")
include("models/model_MarketBidCost.jl")
include("models/model_RenewableGenerationCost.jl")
include("models/model_StorageCost.jl")
include("models/model_XYCoords.jl")
include("models/model_PiecewiseLinearData.jl")
include("units.jl")
include("document.jl")
include("register.jl")

export AverageRateCurve
export ComplexNumber
export CostCurve
export DataSource
export DbdPnts
export FdbdPnts
export FromTo
export FromToToFrom
export FuelCurve
export FuelCurveFuelCost
export FunctionData
export GenericOperationCost
export GeographicInfo
export HydroGenerationCost
export HydroReservoirCost
export HydroStorageGenerationCost
export ImportExportCost
export InOut
export IncrementalCurve
export IncrementalCurveFunctionData
export InputOutputCurve
export InputOutputCurveFunctionData
export LinearFunctionData
export LoadCost
export MarketBidCost
export MinMax
export PiecewiseLinearData
export PiecewiseStepData
export ProductionVariableCostCurve
export QuadraticFunctionData
export RenewableGenerationCost
export StartUpShutDown
export StartUpStages
export StorageCost
export StorageCostStartUp
export StorageCostStartUpOneOf
export SupplementalAttributeAssociation
export TechnologyFinancialData
export ThermalGenerationCost
export ThermalGenerationCostStartUp
export TurbinePump
export TwoTerminalLoss
export UpDown
export ValueCurve
export XYCoords
export has_declared_unit
export declared_unit
export declared_quantity
export has_unit_base
export unit_base
export has_conversion_factor
export conversion_factor
export UNIT_VOCABULARY

end
