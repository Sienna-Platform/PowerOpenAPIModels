module PowerOpenAPIModels
using Reexport
using OpenAPI, JSON
@reexport using InfrastructureCoreOpenAPIModels
@reexport using InfrastructureTimeSeriesOpenAPIModels
@reexport using PowerCoreOpenAPIModels
@reexport using PowerOperationsOpenAPIModels
@reexport using PowerInvestmentsOpenAPIModels
@reexport using PowerDynamicsOpenAPIModels

# The schema release this package was built from, copied from the repo-root `.schema-version`
# by `make schema-version` (the root file is outside the registered subpackage).
const SCHEMA_VERSION_FILE = joinpath(dirname(@__DIR__), "schema-version")
include_dependency(SCHEMA_VERSION_FILE)
const READER_VERSION = String(chopprefix(strip(read(SCHEMA_VERSION_FILE, String)), "v"))
const BUNDLES_DIR = joinpath(dirname(@__DIR__), "bundles")

# SystemDocument and PortfolioDocument both need every domain in scope at once (components
# across Operations, Investments, Dynamics, plus TimeSeries associations), which is why they
# live here rather than in dependency-free InfrastructureCore. Each file defines its own struct
# and the type-specific operations whose field sets diverge; document_utils.jl holds the
# plumbing they share. See each file's own header for the full story.
include("system_document.jl")
include("portfolio_document.jl")
include("document_utils.jl")

end
