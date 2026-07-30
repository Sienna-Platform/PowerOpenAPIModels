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
include("models/model_ComplexNumber1.jl")
include("models/model_ComplexNumber2.jl")
include("models/model_ComplexNumber3.jl")
include("models/model_ComplexNumber4.jl")
include("models/model_ConstantReserve.jl")
include("models/model_ConstantReserveGroup.jl")
include("models/model_ConstantReserveNonSpinning.jl")
include("models/model_DCBus.jl")
include("models/model_DiscreteControlledACBranch.jl")
include("models/model_EmissionsData.jl")
include("models/model_EnergyReservoirStorage.jl")
include("models/model_ExponentialLoad.jl")
include("models/model_FACTSControlDevice.jl")
include("models/model_FixedAdmittance.jl")
include("models/model_FixedForcedOutage.jl")
include("models/model_FromTo1.jl")
include("models/model_FromToToFrom1.jl")
include("models/model_GenericArcImpedance.jl")
include("models/model_GeometricDistributionForcedOutage.jl")
include("models/model_HybridSystem.jl")
include("models/model_HydroDispatch.jl")
include("models/model_HydroPowerPlant.jl")
include("models/model_HydroPumpTurbine.jl")
include("models/model_HydroReservoir.jl")
include("models/model_HydroTurbine.jl")
include("models/model_ImpedanceCorrectionData.jl")
include("models/model_InOut1.jl")
include("models/model_InterconnectingConverter.jl")
include("models/model_InterruptiblePowerLoad.jl")
include("models/model_InterruptibleStandardLoad.jl")
include("models/model_Line.jl")
include("models/model_LoadConformity.jl")
include("models/model_LoadZone.jl")
include("models/model_MonitoredLine.jl")
include("models/model_MotorLoad.jl")
include("models/model_PlannedOutage.jl")
include("models/model_PlantAssociation.jl")
include("models/model_PowerLoad.jl")
include("models/model_RenewableDispatch.jl")
include("models/model_RenewableNonDispatch.jl")
include("models/model_RenewablePowerPlant.jl")
include("models/model_ReserveDirection.jl")
include("models/model_ShiftablePowerLoad.jl")
include("models/model_Source.jl")
include("models/model_StandardLoad.jl")
include("models/model_SwitchedAdmittance.jl")
include("models/model_SynchronousCondenser.jl")
include("models/model_TModelHVDCLine.jl")
include("models/model_ThermalMultiStart.jl")
include("models/model_ThermalPowerPlant.jl")
include("models/model_ThermalStandard.jl")
include("models/model_ThreeWindingTransformer.jl")
include("models/model_ThreeWindingTransformerShuntLocation.jl")
include("models/model_TransformerCircuit.jl")
include("models/model_TransformerControlObjective.jl")
include("models/model_TransmissionInterface.jl")
include("models/model_TwoTerminalGenericHVDCLine.jl")
include("models/model_TwoTerminalLCCLine.jl")
include("models/model_TwoTerminalLoss1.jl")
include("models/model_TwoTerminalVSCLine.jl")
include("models/model_TwoWindingTransformer.jl")
include("models/model_TwoWindingTransformerShuntLocation.jl")
include("models/model_VSCACControlModes.jl")
include("models/model_VSCDCControlModes.jl")
include("models/model_VariableReserve.jl")
include("models/model_VariableReserveNonSpinning.jl")
include("models/model_VoltageUnitBasis.jl")

export ACBus
export AGC
export Arc
export Area
export AreaInterchange
export CombinedCycleAssociation
export CombinedCycleBlock
export CombinedCycleFractional
export ComplexNumber1
export ComplexNumber2
export ComplexNumber3
export ComplexNumber4
export ConstantReserve
export ConstantReserveGroup
export ConstantReserveNonSpinning
export DCBus
export DiscreteControlledACBranch
export EmissionsData
export EnergyReservoirStorage
export ExponentialLoad
export FACTSControlDevice
export FixedAdmittance
export FixedForcedOutage
export FromTo1
export FromToToFrom1
export GenericArcImpedance
export GeometricDistributionForcedOutage
export HybridSystem
export HydroDispatch
export HydroPowerPlant
export HydroPumpTurbine
export HydroReservoir
export HydroTurbine
export ImpedanceCorrectionData
export InOut1
export InterconnectingConverter
export InterruptiblePowerLoad
export InterruptibleStandardLoad
export Line
export LoadZone
export MonitoredLine
export MotorLoad
export PlannedOutage
export PlantAssociation
export PowerLoad
export RenewableDispatch
export RenewableNonDispatch
export RenewablePowerPlant
export ShiftablePowerLoad
export Source
export StandardLoad
export SwitchedAdmittance
export SynchronousCondenser
export TModelHVDCLine
export ThermalMultiStart
export ThermalPowerPlant
export ThermalStandard
export ThreeWindingTransformer
export TransformerCircuit
export TransmissionInterface
export TwoTerminalGenericHVDCLine
export TwoTerminalLCCLine
export TwoTerminalLoss1
export TwoTerminalVSCLine
export TwoWindingTransformer
export VariableReserve
export VariableReserveNonSpinning

for n in names(PowerCoreOpenAPIModels); n === :PowerCoreOpenAPIModels && continue; @eval export $n; end

end
