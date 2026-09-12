module PowerOpenAPIModels
using Reexport
using OpenAPI, JSON
@reexport using InfrastructureCoreOpenAPIModels
@reexport using InfrastructureTimeSeriesOpenAPIModels
@reexport using PowerCoreOpenAPIModels
@reexport using PowerOperationsOpenAPIModels
@reexport using PowerInvestmentsOpenAPIModels
@reexport using PowerDynamicsOpenAPIModels

# SystemDocument and PortfolioDocument both need every domain in scope at once (components
# across Operations, Investments, Dynamics, plus TimeSeries associations), which is why they
# live here rather than in dependency-free InfrastructureCore. Each file defines its own struct
# and the type-specific operations whose field sets diverge; document_utils.jl holds the
# plumbing they share. See each file's own header for the full story.
include("system_document.jl")
include("portfolio_document.jl")
include("document_utils.jl")

end
