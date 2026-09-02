@doc "    TransmissionInterfaceDirectionMapping\n\nDictionary of the line `name`s in the interface and their direction of flow (1 or -1) relative to the flow of the interface."
Base.@kwdef struct TransmissionInterfaceDirectionMapping
    additional_properties::Dict{String,Int64} = Dict{String,Int64}()
end
_decode(::Type{TransmissionInterfaceDirectionMapping}, value) = _decode(TransmissionInterfaceDirectionMapping, value, true)
function _decode(::Type{TransmissionInterfaceDirectionMapping}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TransmissionInterface/properties/direction_mapping"), _openapi_raw, "decoding TransmissionInterfaceDirectionMapping"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TransmissionInterfaceDirectionMapping")
    _openapi_additional_properties = Dict{String,Int64}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Int64, _openapi_item, _openapi_validate)
    end
    return TransmissionInterfaceDirectionMapping(; additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TransmissionInterfaceDirectionMapping)
    _openapi_output = JSON.Object{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TransmissionInterface/properties/direction_mapping"), _openapi_output, "encoding TransmissionInterfaceDirectionMapping"; direction = :neutral)
end

function _form_fields(_openapi_value::TransmissionInterfaceDirectionMapping)
    _openapi_output = Pair{String,Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
