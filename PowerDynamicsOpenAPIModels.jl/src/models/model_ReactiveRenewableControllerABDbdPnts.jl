@doc "    ReactiveRenewableControllerABDbdPnts\n\nVoltage or Q-power error dead band thresholds `(dbd1, dbd2)`."
Base.@kwdef struct ReactiveRenewableControllerABDbdPnts
    dbd1::Union{Absent,Float64,Nothing} = ABSENT
    dbd2::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ReactiveRenewableControllerABDbdPnts}, value) = _decode(ReactiveRenewableControllerABDbdPnts, value, true)
function _decode(::Type{ReactiveRenewableControllerABDbdPnts}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/ReactiveRenewableControllerAB/properties/dbd_pnts"), _openapi_raw, "decoding ReactiveRenewableControllerABDbdPnts"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ReactiveRenewableControllerABDbdPnts")
    _openapi_field_dbd1 = haskey(_openapi_object, "dbd1") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dbd1"], _openapi_validate) : ABSENT
    _openapi_field_dbd2 = haskey(_openapi_object, "dbd2") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dbd2"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("dbd1","dbd2") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ReactiveRenewableControllerABDbdPnts(; dbd1 = _openapi_field_dbd1, dbd2 = _openapi_field_dbd2, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ReactiveRenewableControllerABDbdPnts)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.dbd1 isa Absent || (_openapi_output["dbd1"] = _encode(_openapi_value.dbd1))
    _openapi_value.dbd2 isa Absent || (_openapi_output["dbd2"] = _encode(_openapi_value.dbd2))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/ReactiveRenewableControllerAB/properties/dbd_pnts"), _openapi_output, "encoding ReactiveRenewableControllerABDbdPnts"; direction = :neutral)
end

function _form_fields(_openapi_value::ReactiveRenewableControllerABDbdPnts)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.dbd1 isa Absent || push!(_openapi_output, "dbd1" => _openapi_value.dbd1)
    _openapi_value.dbd2 isa Absent || push!(_openapi_output, "dbd2" => _openapi_value.dbd2)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
