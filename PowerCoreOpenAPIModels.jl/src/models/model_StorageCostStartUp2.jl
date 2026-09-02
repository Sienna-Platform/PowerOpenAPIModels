Base.@kwdef struct StorageCostStartUp2
    charge::Union{Absent,Float64,Nothing} = ABSENT
    discharge::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{StorageCostStartUp2}, value) = _decode(StorageCostStartUp2, value, true)
function _decode(::Type{StorageCostStartUp2}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StorageCost/properties/start_up/oneOf/1"), _openapi_raw, "decoding StorageCostStartUp2"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "StorageCostStartUp2")
    _openapi_field_charge = haskey(_openapi_object, "charge") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["charge"], _openapi_validate) : ABSENT
    _openapi_field_discharge = haskey(_openapi_object, "discharge") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["discharge"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("charge","discharge") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return StorageCostStartUp2(; charge = _openapi_field_charge, discharge = _openapi_field_discharge, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::StorageCostStartUp2)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.charge isa Absent || (_openapi_output["charge"] = _encode(_openapi_value.charge))
    _openapi_value.discharge isa Absent || (_openapi_output["discharge"] = _encode(_openapi_value.discharge))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StorageCost/properties/start_up/oneOf/1"), _openapi_output, "encoding StorageCostStartUp2"; direction = :neutral)
end

function _form_fields(_openapi_value::StorageCostStartUp2)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.charge isa Absent || push!(_openapi_output, "charge" => _openapi_value.charge)
    _openapi_value.discharge isa Absent || push!(_openapi_output, "discharge" => _openapi_value.discharge)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
