module PowerInvestmentsOpenAPIModels

using OpenAPI, JSON3, HTTP
using PowerCoreOpenAPIModels

include("models/model_ACTransportTechnology.jl")
include("models/model_AggregateRetirementPotential.jl")
include("models/model_AggregateRetrofitPotential.jl")
include("models/model_AggregateTransportTechnology.jl")
include("models/model_CapacityReserveMargin.jl")
include("models/model_CarbonCaps.jl")
include("models/model_CarbonTax.jl")
include("models/model_ColocatedSupplyStorageTechnology.jl")
include("models/model_CurtailableDemandSideTechnology.jl")
include("models/model_DemandRequirement.jl")
include("models/model_DemandSideTechnology.jl")
include("models/model_EnergyShareRequirements.jl")
include("models/model_ExistingCapacity.jl")
include("models/model_FlexibleDemandTechnology.jl")
include("models/model_HVDCTransportTechnology.jl")
include("models/model_HourlyMatching.jl")
include("models/model_InvestmentScheduleResults.jl")
include("models/model_InvestmentScheduleResultsResultsInner.jl")
include("models/model_MaximumCapacityRequirements.jl")
include("models/model_MinimumCapacityRequirements.jl")
include("models/model_NodalACTransportTechnology.jl")
include("models/model_NodalHVDCTransportTechnology.jl")
include("models/model_Node.jl")
include("models/model_PortfolioFinancialData.jl")
include("models/model_RetirementPotential.jl")
include("models/model_RetrofitPotential.jl")
include("models/model_StorageTechnology.jl")
include("models/model_SupplyTechnology.jl")
include("models/model_SupplyTechnologyOperationCosts.jl")
include("models/model_TopologyMapping.jl")
include("models/model_Zone.jl")

export SupplyTechnologyOperationCosts

for n in names(PowerCoreOpenAPIModels); n === :PowerCoreOpenAPIModels && continue; @eval export $n; end

end
