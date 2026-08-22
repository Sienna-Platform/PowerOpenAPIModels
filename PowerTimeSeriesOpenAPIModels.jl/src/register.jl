# Generated from the declared model types. Do not edit.
#
# Runs in __init__ because the registry lives in another module: state
# mutated there during precompilation would not be saved.

function __init__()
    PowerCoreOpenAPIModels.register_model_type!(Deterministic)
    PowerCoreOpenAPIModels.register_model_type!(DeterministicSingleTimeSeries)
    PowerCoreOpenAPIModels.register_model_type!(NonSequentialTimeSeries)
    PowerCoreOpenAPIModels.register_model_type!(Probabilistic)
    PowerCoreOpenAPIModels.register_model_type!(Scenarios)
    PowerCoreOpenAPIModels.register_model_type!(SingleTimeSeries)
    PowerCoreOpenAPIModels.register_model_type!(TimeSeriesAssociation)
    PowerCoreOpenAPIModels.register_model_type!(TimeSeriesFeatureValue)
    return nothing
end
