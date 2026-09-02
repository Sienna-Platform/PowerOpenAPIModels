@doc "    FixedAdmittanceY\n\nFixed admittance. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr ."
Base.@kwdef struct FixedAdmittanceY
    imag::Union{Absent,Float64,Nothing} = ABSENT
    real::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{FixedAdmittanceY}, value) = _decode(FixedAdmittanceY, value, true)
function _decode(::Type{FixedAdmittanceY}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/FixedAdmittance/properties/Y"), _openapi_raw, "decoding FixedAdmittanceY"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "FixedAdmittanceY")
    _openapi_field_imag = haskey(_openapi_object, "imag") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["imag"], _openapi_validate) : ABSENT
    _openapi_field_real = haskey(_openapi_object, "real") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["real"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("imag","real") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return FixedAdmittanceY(; imag = _openapi_field_imag, real = _openapi_field_real, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::FixedAdmittanceY)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.imag isa Absent || (_openapi_output["imag"] = _encode(_openapi_value.imag))
    _openapi_value.real isa Absent || (_openapi_output["real"] = _encode(_openapi_value.real))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/FixedAdmittance/properties/Y"), _openapi_output, "encoding FixedAdmittanceY"; direction = :neutral)
end

function _form_fields(_openapi_value::FixedAdmittanceY)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.imag isa Absent || push!(_openapi_output, "imag" => _openapi_value.imag)
    _openapi_value.real isa Absent || push!(_openapi_output, "real" => _openapi_value.real)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
