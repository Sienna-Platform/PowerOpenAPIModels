module InfrastructureTimeSeriesOpenAPIModels

using OpenAPI, JSON3, HTTP, TimeZones
using InfrastructureCoreOpenAPIModels

include("models/model_OwnerCategory.jl")
include("models/model_TimeSeriesAssociation.jl")
include("models/model_TimeSeriesFeatureValue.jl")
include("models/model_Deterministic.jl")
include("models/model_DeterministicSingleTimeSeries.jl")
include("models/model_NonSequentialTimeSeries.jl")
include("models/model_Probabilistic.jl")
include("models/model_Scenarios.jl")
include("models/model_SingleTimeSeries.jl")
include("units.jl")
include("register.jl")

export Deterministic
export DeterministicSingleTimeSeries
export NonSequentialTimeSeries
export Probabilistic
export Scenarios
export SingleTimeSeries
export TimeSeriesAssociation
export TimeSeriesFeatureValue

for n in names(InfrastructureCoreOpenAPIModels); n === :InfrastructureCoreOpenAPIModels && continue; @eval export $n; end

end
