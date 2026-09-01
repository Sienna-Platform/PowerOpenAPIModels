# Generated from the declared model types. Do not edit.
#
# Runs in __init__ because the registry lives in another module: state
# mutated there during precompilation would not be saved.

function __init__()
    register_model_type!(ComplexNumber)
    register_model_type!(DataSource)
    register_model_type!(FromTo)
    register_model_type!(FromToToFrom)
    register_model_type!(FunctionData)
    register_model_type!(GeographicInfo)
    register_model_type!(InOut)
    register_model_type!(LinearFunctionData)
    register_model_type!(MinMax)
    register_model_type!(PiecewiseLinearData)
    register_model_type!(PiecewiseStepData)
    register_model_type!(QuadraticFunctionData)
    register_model_type!(SupplementalAttributeAssociation)
    register_model_type!(TimeSeriesLinearFunctionData)
    register_model_type!(TimeSeriesPiecewiseLinearData)
    register_model_type!(TimeSeriesPiecewiseStepData)
    register_model_type!(TimeSeriesQuadraticFunctionData)
    register_model_type!(UpDown)
    register_model_type!(XYCoords)
    return nothing
end
