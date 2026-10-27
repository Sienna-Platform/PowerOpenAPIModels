# Generated from every non-enum type this package emits. Do not edit.
#
# Runs in __init__ because the registry lives in another module: state
# mutated there during precompilation would not be saved.

function __init__()
    InfrastructureCoreOpenAPIModels.register_model_type!(AggregateTransportTechnology)
    InfrastructureCoreOpenAPIModels.register_model_type!(CapacityReserveMargin)
    InfrastructureCoreOpenAPIModels.register_model_type!(CarbonCaps)
    InfrastructureCoreOpenAPIModels.register_model_type!(CarbonTax)
    InfrastructureCoreOpenAPIModels.register_model_type!(ColocatedSupplyStorageTechnology)
    InfrastructureCoreOpenAPIModels.register_model_type!(
        ColocatedSupplyStorageTechnologyOperationCostsInverter,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(DemandRequirement)
    InfrastructureCoreOpenAPIModels.register_model_type!(
        DemandRequirementUnservedDemandCurve,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(DemandSideTechnology)
    InfrastructureCoreOpenAPIModels.register_model_type!(
        DemandSideTechnologyCurtailmentCost,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(DemandSideTechnologyPricePerUnit)
    InfrastructureCoreOpenAPIModels.register_model_type!(
        DemandSideTechnologyShiftVariableCost,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(EnergyShareRequirements)
    InfrastructureCoreOpenAPIModels.register_model_type!(ExistingDevices)
    InfrastructureCoreOpenAPIModels.register_model_type!(HourlyMatching)
    InfrastructureCoreOpenAPIModels.register_model_type!(MaximumCapacityRequirements)
    InfrastructureCoreOpenAPIModels.register_model_type!(MinimumCapacityRequirements)
    InfrastructureCoreOpenAPIModels.register_model_type!(NodalACTransportTechnology)
    InfrastructureCoreOpenAPIModels.register_model_type!(NodalHVDCTransportTechnology)
    InfrastructureCoreOpenAPIModels.register_model_type!(
        NodalHVDCTransportTechnologyLineLoss,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(PortfolioFinancialData)
    InfrastructureCoreOpenAPIModels.register_model_type!(RequirementAssociation)
    InfrastructureCoreOpenAPIModels.register_model_type!(RetirementPotential)
    InfrastructureCoreOpenAPIModels.register_model_type!(RetirementPotentialBuildYear)
    InfrastructureCoreOpenAPIModels.register_model_type!(
        RetirementPotentialPlannedRetirementYear,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(RetirementPotentialRetirementCost)
    InfrastructureCoreOpenAPIModels.register_model_type!(RetrofitPotential)
    InfrastructureCoreOpenAPIModels.register_model_type!(RetrofitPotentialRetrofitCost)
    InfrastructureCoreOpenAPIModels.register_model_type!(StorageTechnology)
    InfrastructureCoreOpenAPIModels.register_model_type!(
        StorageTechnologyCapacityLimitsCharge,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(
        StorageTechnologyCapacityLimitsDischarge,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(
        StorageTechnologyCapacityLimitsEnergy,
    )
    InfrastructureCoreOpenAPIModels.register_model_type!(SupplyTechnology)
    InfrastructureCoreOpenAPIModels.register_model_type!(SupplyTechnologyCapacityLimits)
    InfrastructureCoreOpenAPIModels.register_model_type!(SupplyTechnologyOperationCosts)
    InfrastructureCoreOpenAPIModels.register_model_type!(TechnologyFinancialData)
    return nothing
end
