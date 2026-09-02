@doc "    StartUpStages\n\nA triple of values, one for each stage of a thermal unit's start-up: `hot`, `warm`, and `cold`."
Base.@kwdef struct StartUpStages
    cold::Float64
    hot::Float64
    startup_stages_type::Union{Absent,Nothing,String} = ABSENT
    warm::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{StartUpStages}, value) = _decode(StartUpStages, value, true)
function _decode(::Type{StartUpStages}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StartUpStages"), _openapi_raw, "decoding StartUpStages"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "StartUpStages")
    _openapi_field_cold = _decode(Float64, _required(_openapi_object, "cold", "StartUpStages"), _openapi_validate)
    _openapi_field_hot = _decode(Float64, _required(_openapi_object, "hot", "StartUpStages"), _openapi_validate)
    _openapi_field_startup_stages_type = haskey(_openapi_object, "startup_stages_type") ? _decode(Union{Absent,Nothing,String}, _openapi_object["startup_stages_type"], _openapi_validate) : ABSENT
    _openapi_field_warm = _decode(Float64, _required(_openapi_object, "warm", "StartUpStages"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("cold","hot","startup_stages_type","warm") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return StartUpStages(; cold = _openapi_field_cold, hot = _openapi_field_hot, startup_stages_type = _openapi_field_startup_stages_type, warm = _openapi_field_warm, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::StartUpStages)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.cold isa Absent || (_openapi_output["cold"] = _encode(_openapi_value.cold))
    _openapi_value.hot isa Absent || (_openapi_output["hot"] = _encode(_openapi_value.hot))
    _openapi_value.startup_stages_type isa Absent || (_openapi_output["startup_stages_type"] = _encode(_openapi_value.startup_stages_type))
    _openapi_value.warm isa Absent || (_openapi_output["warm"] = _encode(_openapi_value.warm))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StartUpStages"), _openapi_output, "encoding StartUpStages"; direction = :neutral)
end

function _form_fields(_openapi_value::StartUpStages)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.cold isa Absent || push!(_openapi_output, "cold" => _openapi_value.cold)
    _openapi_value.hot isa Absent || push!(_openapi_output, "hot" => _openapi_value.hot)
    _openapi_value.startup_stages_type isa Absent || push!(_openapi_output, "startup_stages_type" => _openapi_value.startup_stages_type)
    _openapi_value.warm isa Absent || push!(_openapi_output, "warm" => _openapi_value.warm)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
