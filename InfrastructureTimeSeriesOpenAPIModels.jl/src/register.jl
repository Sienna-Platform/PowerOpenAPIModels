# Generated from the frozen pre-1.0 registered-name set. Do not edit.
#
# Runs in __init__ because the registry lives in another module: state
# mutated there during precompilation would not be saved.

function __init__()
    InfrastructureCoreOpenAPIModels.register_model_type!(Deterministic)
    InfrastructureCoreOpenAPIModels.register_model_type!(DeterministicSingleTimeSeries)
    InfrastructureCoreOpenAPIModels.register_model_type!(NonSequentialTimeSeries)
    InfrastructureCoreOpenAPIModels.register_model_type!(Probabilistic)
    InfrastructureCoreOpenAPIModels.register_model_type!(Scenarios)
    InfrastructureCoreOpenAPIModels.register_model_type!(SingleTimeSeries)
    InfrastructureCoreOpenAPIModels.register_model_type!(TimeSeriesAssociation)
    InfrastructureCoreOpenAPIModels.register_model_type!(TimeSeriesFeatureValue)
    return nothing
end
