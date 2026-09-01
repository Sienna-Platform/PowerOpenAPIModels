module InfrastructureCoreOpenAPIModels

using OpenAPI, JSON3, HTTP, JSON, TimeZones

include("models/model_ComplexNumber.jl")
include("models/model_DataSource.jl")
include("models/model_FromTo.jl")
include("models/model_FromToToFrom.jl")
include("models/model_FunctionData.jl")
include("models/model_GeographicInfo.jl")
include("models/model_InOut.jl")
include("models/model_LinearFunctionData.jl")
include("models/model_MinMax.jl")
include("models/model_PiecewiseStepData.jl")
include("models/model_QuadraticFunctionData.jl")
include("models/model_SupplementalAttributeAssociation.jl")
include("models/model_TimeSeriesLinearFunctionData.jl")
include("models/model_TimeSeriesPiecewiseLinearData.jl")
include("models/model_TimeSeriesPiecewiseStepData.jl")
include("models/model_TimeSeriesQuadraticFunctionData.jl")
include("models/model_UnitSystem.jl")
include("models/model_UpDown.jl")
include("models/model_XYCoords.jl")
include("models/model_PiecewiseLinearData.jl")
include("units.jl")
include("document.jl")
include("register.jl")

export ComplexNumber
export DataSource
export FromTo
export FromToToFrom
export FunctionData
export GeographicInfo
export InOut
export LinearFunctionData
export MinMax
export PiecewiseLinearData
export PiecewiseStepData
export QuadraticFunctionData
export SupplementalAttributeAssociation
export TimeSeriesLinearFunctionData
export TimeSeriesPiecewiseLinearData
export TimeSeriesPiecewiseStepData
export TimeSeriesQuadraticFunctionData
export UpDown
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
