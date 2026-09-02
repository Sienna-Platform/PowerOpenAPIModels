@doc "    DataSourceExtra\n\nAdditional string-valued provenance metadata."
Base.@kwdef struct DataSourceExtra
    additional_properties::Dict{String,String} = Dict{String,String}()
end
_decode(::Type{DataSourceExtra}, value) = _decode(DataSourceExtra, value, true)
function _decode(::Type{DataSourceExtra}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/DataSource/properties/extra"), _openapi_raw, "decoding DataSourceExtra"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "DataSourceExtra")
    _openapi_additional_properties = Dict{String,String}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(String, _openapi_item, _openapi_validate)
    end
    return DataSourceExtra(; additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::DataSourceExtra)
    _openapi_output = JSON.Object{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/DataSource/properties/extra"), _openapi_output, "encoding DataSourceExtra"; direction = :neutral)
end

function _form_fields(_openapi_value::DataSourceExtra)
    _openapi_output = Pair{String,Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
