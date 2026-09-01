module PowerInvestmentsOpenAPIModels

using OpenAPI, JSON3, HTTP
using PowerCoreOpenAPIModels

include("models/model_AggregateRetirementPotential.jl")
include("models/model_AggregateRetrofitPotential.jl")
include("models/model_CapacityReserveMargin.jl")
include("models/model_CarbonCaps.jl")
include("models/model_CarbonTax.jl")
include("models/model_DemandRequirement.jl")
include("models/model_DemandSideTechnology.jl")
include("models/model_EnergyShareRequirements.jl")
include("models/model_ExistingDevices.jl")
include("models/model_HourlyMatching.jl")
include("models/model_MaximumCapacityRequirements.jl")
include("models/model_MinimumCapacityRequirements.jl")
include("models/model_Node.jl")
include("models/model_PortfolioFinancialData.jl")
include("models/model_RetirementPotential.jl")
include("models/model_RetrofitPotential.jl")
include("models/model_TechnologyFinancialData.jl")
include("models/model_AggregateTransportTechnology.jl")
include("models/model_ColocatedSupplyStorageTechnology.jl")
include("models/model_NodalACTransportTechnology.jl")
include("models/model_NodalHVDCTransportTechnology.jl")
include("models/model_StorageTechnology.jl")
include("models/model_SupplyTechnology.jl")
include("models/model_TopologyMapping.jl")
include("models/model_Zone.jl")
include("units.jl")
include("register.jl")

export AggregateRetirementPotential
export AggregateRetrofitPotential
export AggregateTransportTechnology
export CapacityReserveMargin
export CarbonCaps
export CarbonTax
export ColocatedSupplyStorageTechnology
export DemandRequirement
export DemandSideTechnology
export EnergyShareRequirements
export ExistingDevices
export HourlyMatching
export MaximumCapacityRequirements
export MinimumCapacityRequirements
export NodalACTransportTechnology
export NodalHVDCTransportTechnology
export Node
export PortfolioFinancialData
export RetirementPotential
export RetrofitPotential
export StorageTechnology
export SupplyTechnology
export TechnologyFinancialData
export TopologyMapping
export Zone

for n in names(PowerCoreOpenAPIModels); n === :PowerCoreOpenAPIModels && continue; @eval export $n; end

end
