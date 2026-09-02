@doc "    PiecewiseStepData\n\nData for a step function, constant on each segment, defined by the x coordinates of the segment endpoints and one y value per segment. The y values are per-segment rates, not absolute values; use `PiecewiseLinearData` when the data gives a value at each point. `x_coords` ascends and holds at least two entries, and `y_coords` holds exactly one fewer."
Base.@kwdef struct PiecewiseStepData
    function_type::String
    x_coords::Vector{Float64}
    y_coords::Vector{Float64}
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{PiecewiseStepData}, value) = _decode(PiecewiseStepData, value, true)
function _decode(::Type{PiecewiseStepData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/PiecewiseStepData"), _openapi_raw, "decoding PiecewiseStepData"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "PiecewiseStepData")
    _openapi_field_function_type = _decode(String, _required(_openapi_object, "function_type", "PiecewiseStepData"), _openapi_validate)
    _openapi_field_x_coords = _decode(Vector{Float64}, _required(_openapi_object, "x_coords", "PiecewiseStepData"), _openapi_validate)
    _openapi_field_y_coords = _decode(Vector{Float64}, _required(_openapi_object, "y_coords", "PiecewiseStepData"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("function_type","x_coords","y_coords") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return PiecewiseStepData(; function_type = _openapi_field_function_type, x_coords = _openapi_field_x_coords, y_coords = _openapi_field_y_coords, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::PiecewiseStepData)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.function_type isa Absent || (_openapi_output["function_type"] = _encode(_openapi_value.function_type))
    _openapi_value.x_coords isa Absent || (_openapi_output["x_coords"] = _encode(_openapi_value.x_coords))
    _openapi_value.y_coords isa Absent || (_openapi_output["y_coords"] = _encode(_openapi_value.y_coords))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/PiecewiseStepData"), _openapi_output, "encoding PiecewiseStepData"; direction = :neutral)
end

function _form_fields(_openapi_value::PiecewiseStepData)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.function_type isa Absent || push!(_openapi_output, "function_type" => _openapi_value.function_type)
    _openapi_value.x_coords isa Absent || push!(_openapi_output, "x_coords" => _openapi_value.x_coords)
    _openapi_value.y_coords isa Absent || push!(_openapi_output, "y_coords" => _openapi_value.y_coords)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
