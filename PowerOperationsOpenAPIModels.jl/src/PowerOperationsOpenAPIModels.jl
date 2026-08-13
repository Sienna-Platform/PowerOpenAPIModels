module PowerOperationsOpenAPIModels

using OpenAPI, JSON3, HTTP
using PowerCoreOpenAPIModels

include("models/model_ACBus.jl")
include("models/model_AGC.jl")
include("models/model_Arc.jl")
include("models/model_Area.jl")
include("models/model_AreaInterchange.jl")
include("models/model_CombinedCycleAssociation.jl")
include("models/model_CombinedCycleBlock.jl")
include("models/model_CombinedCycleConfiguration.jl")
include("models/model_CombinedCycleFractional.jl")
include("models/model_DCBus.jl")
include("models/model_DiscreteControlledACBranch.jl")
include("models/model_EmissionsData.jl")
include("models/model_EnergyReservoirStorage.jl")
include("models/model_EnergyReservoirStorageOperationCost.jl")
include("models/model_ExponentialLoad.jl")
include("models/model_FACTSControlDevice.jl")
include("models/model_FixedAdmittance.jl")
include("models/model_FixedForcedOutage.jl")
include("models/model_GenericArcImpedance.jl")
include("models/model_GeometricDistributionForcedOutage.jl")
include("models/model_GroupReserve.jl")
include("models/model_HybridSystem.jl")
include("models/model_HydroDispatch.jl")
include("models/model_HydroDispatchOperationCost.jl")
include("models/model_HydroPowerPlant.jl")
include("models/model_HydroPumpTurbine.jl")
include("models/model_HydroReservoir.jl")
include("models/model_HydroTurbine.jl")
include("models/model_ImpedanceCorrectionData.jl")
include("models/model_InterconnectingConverter.jl")
include("models/model_InterruptiblePowerLoad.jl")
include("models/model_InterruptiblePowerLoadOperationCost.jl")
include("models/model_InterruptibleStandardLoad.jl")
include("models/model_Line.jl")
include("models/model_LoadConformity.jl")
include("models/model_LoadZone.jl")
include("models/model_MarketBidCost1.jl")
include("models/model_MonitoredLine.jl")
include("models/model_MotorLoad.jl")
include("models/model_OfflineReserve.jl")
include("models/model_OnlineReserve.jl")
include("models/model_PlannedOutage.jl")
include("models/model_PlantAssociation.jl")
include("models/model_PowerLoad.jl")
include("models/model_RenewableDispatch.jl")
include("models/model_RenewableDispatchOperationCost.jl")
include("models/model_RenewableNonDispatch.jl")
include("models/model_RenewablePowerPlant.jl")
include("models/model_ReserveDirection.jl")
include("models/model_ServiceAssociation.jl")
include("models/model_ShiftablePowerLoad.jl")
include("models/model_Source.jl")
include("models/model_StandardLoad.jl")
include("models/model_Substation.jl")
include("models/model_SwitchedAdmittance.jl")
include("models/model_SynchronousCondenser.jl")
include("models/model_TModelHVDCLine.jl")
include("models/model_ThermalMultiStart.jl")
include("models/model_ThermalMultiStartOperationCost.jl")
include("models/model_ThermalPowerPlant.jl")
include("models/model_ThermalStandard.jl")
include("models/model_ThermalStandardOperationCost.jl")
include("models/model_ThreeWindingTransformer.jl")
include("models/model_ThreeWindingTransformerShuntLocation.jl")
include("models/model_TransformerCircuit.jl")
include("models/model_TransformerControlObjective.jl")
include("models/model_TransmissionInterface.jl")
include("models/model_TwoTerminalGenericHVDCLine.jl")
include("models/model_TwoTerminalLCCLine.jl")
include("models/model_TwoTerminalVSCLine.jl")
include("models/model_TwoWindingTransformer.jl")
include("models/model_TwoWindingTransformerShuntLocation.jl")
include("models/model_VSCACControlModes.jl")
include("models/model_VSCDCControlModes.jl")
include("models/model_VoltageUnitBasis.jl")
include("units.jl")
include("register.jl")

export ACBus
export AGC
export Arc
export Area
export AreaInterchange
export CombinedCycleAssociation
export CombinedCycleBlock
export CombinedCycleFractional
export DCBus
export DiscreteControlledACBranch
export EmissionsData
export EnergyReservoirStorage
export EnergyReservoirStorageOperationCost
export ExponentialLoad
export FACTSControlDevice
export FixedAdmittance
export FixedForcedOutage
export GenericArcImpedance
export GeometricDistributionForcedOutage
export GroupReserve
export HybridSystem
export HydroDispatch
export HydroDispatchOperationCost
export HydroPowerPlant
export HydroPumpTurbine
export HydroReservoir
export HydroTurbine
export ImpedanceCorrectionData
export InterconnectingConverter
export InterruptiblePowerLoad
export InterruptiblePowerLoadOperationCost
export InterruptibleStandardLoad
export Line
export LoadZone
export MarketBidCost1
export MonitoredLine
export MotorLoad
export OfflineReserve
export OnlineReserve
export PlannedOutage
export PlantAssociation
export PowerLoad
export RenewableDispatch
export RenewableDispatchOperationCost
export RenewableNonDispatch
export RenewablePowerPlant
export ServiceAssociation
export ShiftablePowerLoad
export Source
export StandardLoad
export Substation
export SwitchedAdmittance
export SynchronousCondenser
export TModelHVDCLine
export ThermalMultiStart
export ThermalMultiStartOperationCost
export ThermalPowerPlant
export ThermalStandard
export ThermalStandardOperationCost
export ThreeWindingTransformer
export TransformerCircuit
export TransmissionInterface
export TwoTerminalGenericHVDCLine
export TwoTerminalLCCLine
export TwoTerminalVSCLine
export TwoWindingTransformer

for n in names(PowerCoreOpenAPIModels); n === :PowerCoreOpenAPIModels && continue; @eval export $n; end

end
