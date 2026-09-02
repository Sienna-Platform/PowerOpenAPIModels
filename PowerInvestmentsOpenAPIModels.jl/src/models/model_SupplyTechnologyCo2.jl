@doc "    SupplyTechnologyCo2\n\nCarbon intensity of fuel. Units: t/MMBtu."
Base.@kwdef struct SupplyTechnologyCo2
    additional_properties::Dict{String,Float64} = Dict{String,Float64}()
end
_decode(::Type{SupplyTechnologyCo2}, value) = _decode(SupplyTechnologyCo2, value, true)
function _decode(::Type{SupplyTechnologyCo2}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/co2"), _openapi_raw, "decoding SupplyTechnologyCo2"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "SupplyTechnologyCo2")
    _openapi_additional_properties = Dict{String,Float64}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Float64, _openapi_item, _openapi_validate)
    end
    return SupplyTechnologyCo2(; additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::SupplyTechnologyCo2)
    _openapi_output = JSON.Object{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/co2"), _openapi_output, "encoding SupplyTechnologyCo2"; direction = :neutral)
end

function _form_fields(_openapi_value::SupplyTechnologyCo2)
    _openapi_output = Pair{String,Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
