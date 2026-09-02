@doc "    InterconnectingConverterLossFunction\n\nLinear or quadratic loss function with respect to the converter current."
Base.@kwdef struct InterconnectingConverterLossFunction
    curve_type::String
    function_data::InterconnectingConverterLossFunctionFunctionData
    input_at_zero::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{InterconnectingConverterLossFunction}, value) = _decode(InterconnectingConverterLossFunction, value, true)
function _decode(::Type{InterconnectingConverterLossFunction}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InterconnectingConverter/properties/loss_function"), _openapi_raw, "decoding InterconnectingConverterLossFunction"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "InterconnectingConverterLossFunction")
    _openapi_field_curve_type = _decode(String, _required(_openapi_object, "curve_type", "InterconnectingConverterLossFunction"), _openapi_validate)
    _openapi_field_function_data = _decode(InterconnectingConverterLossFunctionFunctionData, _required(_openapi_object, "function_data", "InterconnectingConverterLossFunction"), _openapi_validate)
    _openapi_field_input_at_zero = haskey(_openapi_object, "input_at_zero") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["input_at_zero"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("curve_type","function_data","input_at_zero") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return InterconnectingConverterLossFunction(; curve_type = _openapi_field_curve_type, function_data = _openapi_field_function_data, input_at_zero = _openapi_field_input_at_zero, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::InterconnectingConverterLossFunction)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.curve_type isa Absent || (_openapi_output["curve_type"] = _encode(_openapi_value.curve_type))
    _openapi_value.function_data isa Absent || (_openapi_output["function_data"] = _encode(_openapi_value.function_data))
    _openapi_value.input_at_zero isa Absent || (_openapi_output["input_at_zero"] = _encode(_openapi_value.input_at_zero))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InterconnectingConverter/properties/loss_function"), _openapi_output, "encoding InterconnectingConverterLossFunction"; direction = :neutral)
end

function _form_fields(_openapi_value::InterconnectingConverterLossFunction)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.curve_type isa Absent || push!(_openapi_output, "curve_type" => _openapi_value.curve_type)
    _openapi_value.function_data isa Absent || push!(_openapi_output, "function_data" => _openapi_value.function_data)
    _openapi_value.input_at_zero isa Absent || push!(_openapi_output, "input_at_zero" => _openapi_value.input_at_zero)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
