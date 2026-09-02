@doc "    XYCoords\n\nA single point, given as its `x` and `y` coordinates."
Base.@kwdef struct XYCoords
    x::Float64
    y::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{XYCoords}, value) = _decode(XYCoords, value, true)
function _decode(::Type{XYCoords}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/XY_Coords"), _openapi_raw, "decoding XYCoords"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "XYCoords")
    _openapi_field_x = _decode(Float64, _required(_openapi_object, "x", "XYCoords"), _openapi_validate)
    _openapi_field_y = _decode(Float64, _required(_openapi_object, "y", "XYCoords"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("x","y") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return XYCoords(; x = _openapi_field_x, y = _openapi_field_y, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::XYCoords)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.x isa Absent || (_openapi_output["x"] = _encode(_openapi_value.x))
    _openapi_value.y isa Absent || (_openapi_output["y"] = _encode(_openapi_value.y))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/XY_Coords"), _openapi_output, "encoding XYCoords"; direction = :neutral)
end

function _form_fields(_openapi_value::XYCoords)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.x isa Absent || push!(_openapi_output, "x" => _openapi_value.x)
    _openapi_value.y isa Absent || push!(_openapi_output, "y" => _openapi_value.y)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
