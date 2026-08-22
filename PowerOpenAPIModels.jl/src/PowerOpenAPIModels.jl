module PowerOpenAPIModels
using Reexport
using OpenAPI, JSON
@reexport using PowerCoreOpenAPIModels
@reexport using PowerOperationsOpenAPIModels
@reexport using PowerInvestmentsOpenAPIModels
@reexport using PowerDynamicsOpenAPIModels
@reexport using PowerTimeSeriesOpenAPIModels

# SystemDocument needs every domain in scope at once (components across Operations,
# Investments, Dynamics, plus TimeSeries associations), which is why it lives here rather
# than in dependency-free Core. See document.jl's own header for the full story.
include("document.jl")

end
