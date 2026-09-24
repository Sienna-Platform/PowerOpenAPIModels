"""
    VoltageControlAssociation

Links a voltage control group (a VoltageDroopControl or a ReactivePowerSharing attribute) to one member device and records the member's relative reactive power weight. One row per (control, member). `entity_id` names a device that regulates voltage to a setpoint; `terminal` picks the converter for a two-terminal member (a TwoTerminalVSCLine) and is null for every other member. A device, or a two-terminal line's converter, belongs to at most one group of either kind. PSS/E RMPCT imports as weight = RMPCT / 100, so the PSS/E default of 100 is the default weight of 1.0.

  - `control_id`: ID of the VoltageDroopControl or ReactivePowerSharing attribute the member belongs to.
  - `entity_id`: ID of the member device.
  - `weight`: Positive relative weight of this member. Its share of the reactive power required at the regulated bus is weight divided by the sum of the weights of the members in service. Units: 1.
  - `terminal`: Converter of a two-terminal member this row refers to; required for a TwoTerminalVSCLine member and null for every other member.
"""
Base.@kwdef struct VoltageControlAssociation <: APIModel
    control_id::Int64
    entity_id::Int64
    weight::Union{Absent, Float64, Nothing} = ABSENT
    terminal::Union{Absent, Union{Nothing, VoltageControlTerminal}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VoltageControlAssociation}, value) =
    _decode(VoltageControlAssociation, value, true)
function _decode(::Type{VoltageControlAssociation}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ca369a49c8664f8455fc.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding VoltageControlAssociation";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VoltageControlAssociation")
    _openapi_field_control_id = _decode(
        Int64,
        _required(_openapi_object, "control_id", "VoltageControlAssociation"),
        _openapi_validate,
    )
    _openapi_field_entity_id = _decode(
        Int64,
        _required(_openapi_object, "entity_id", "VoltageControlAssociation"),
        _openapi_validate,
    )
    _openapi_field_weight =
        haskey(_openapi_object, "weight") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["weight"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_terminal =
        haskey(_openapi_object, "terminal") ?
        _decode(
            Union{Absent, Union{Nothing, VoltageControlTerminal}},
            _openapi_object["terminal"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("control_id", "entity_id", "weight", "terminal") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return VoltageControlAssociation(;
        control_id=_openapi_field_control_id,
        entity_id=_openapi_field_entity_id,
        weight=_openapi_field_weight,
        terminal=_openapi_field_terminal,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::VoltageControlAssociation)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.control_id isa Absent ||
        (_openapi_output["control_id"] = _encode(_openapi_value.control_id))
    _openapi_value.entity_id isa Absent ||
        (_openapi_output["entity_id"] = _encode(_openapi_value.entity_id))
    _openapi_value.weight isa Absent ||
        (_openapi_output["weight"] = _encode(_openapi_value.weight))
    _openapi_value.terminal isa Absent ||
        (_openapi_output["terminal"] = _encode(_openapi_value.terminal))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ca369a49c8664f8455fc.json",
            pointer="",
        ),
        _openapi_output,
        "encoding VoltageControlAssociation";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::VoltageControlAssociation)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.control_id isa Absent ||
        push!(_openapi_output, "control_id" => _openapi_value.control_id)
    _openapi_value.entity_id isa Absent ||
        push!(_openapi_output, "entity_id" => _openapi_value.entity_id)
    _openapi_value.weight isa Absent ||
        push!(_openapi_output, "weight" => _openapi_value.weight)
    _openapi_value.terminal isa Absent ||
        push!(_openapi_output, "terminal" => _openapi_value.terminal)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
