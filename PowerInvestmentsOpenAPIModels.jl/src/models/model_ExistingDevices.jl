@doc "    ExistingDevices\n\nSupplemental attribute mapping a technology in the portfolio to the existing system — for example, the list of existing generators that correspond to one supply technology.\n\n- `existing_devices`: List of individual existing devices to map to a specific technology in the portfolio.\n- `id`: ID for individual component."
Base.@kwdef struct ExistingDevices
    existing_devices::Union{Absent,Nothing,Vector{String}} = ABSENT
    id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ExistingDevices}, value) = _decode(ExistingDevices, value, true)
function _decode(::Type{ExistingDevices}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/ExistingDevices"), _openapi_raw, "decoding ExistingDevices"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ExistingDevices")
    _openapi_field_existing_devices = haskey(_openapi_object, "existing_devices") ? _decode(Union{Absent,Nothing,Vector{String}}, _openapi_object["existing_devices"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "ExistingDevices"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("existing_devices","id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ExistingDevices(; existing_devices = _openapi_field_existing_devices, id = _openapi_field_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ExistingDevices)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.existing_devices isa Absent || (_openapi_output["existing_devices"] = _encode(_openapi_value.existing_devices))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/ExistingDevices"), _openapi_output, "encoding ExistingDevices"; direction = :neutral)
end

function _form_fields(_openapi_value::ExistingDevices)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.existing_devices isa Absent || push!(_openapi_output, "existing_devices" => _openapi_value.existing_devices)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
