"""
    VirtualParticipant

A virtual (convergence) market participant. Supply offers map to the operating cost's incremental offer curves; demand bids map to decremental offer curves. Settles either at a settlement point or at associated trading hubs — the two are mutually exclusive; hub membership is carried as TradingHubAssociation rows rather than a list on this record, matching the trading hub's own membership convention.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the participant is available for market clearing (`true`) or not (`false`).
  - `settlement_point_id`: ID of the location this participant settles at — a bus, area, or load zone. `null` when the participant settles at trading hubs instead.
  - `max_supply`: Maximum envelope for the incremental (supply) side. Units: MW.
  - `max_demand`: Maximum envelope for the decremental (demand) side. Units: MW.
  - `operation_cost`: Bid curves as an offer-curve operating cost.
"""
Base.@kwdef struct VirtualParticipant <: APIModel
    id::Int64
    name::String
    available::Bool
    settlement_point_id::Union{Absent, Union{Int64, Nothing}} = ABSENT
    max_supply::Float64
    max_demand::Float64
    operation_cost::VirtualParticipantOperationCost
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VirtualParticipant}, value) = _decode(VirtualParticipant, value, true)
function _decode(::Type{VirtualParticipant}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-93547ad8c2b21cc361f5.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding VirtualParticipant";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VirtualParticipant")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "VirtualParticipant"), false)
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "VirtualParticipant"), false)
    _openapi_field_available =
        _decode(Bool, _required(_openapi_object, "available", "VirtualParticipant"), false)
    _openapi_field_settlement_point_id =
        haskey(_openapi_object, "settlement_point_id") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["settlement_point_id"],
            false,
        ) : ABSENT
    _openapi_field_max_supply = _decode(
        Float64,
        _required(_openapi_object, "max_supply", "VirtualParticipant"),
        false,
    )
    _openapi_field_max_demand = _decode(
        Float64,
        _required(_openapi_object, "max_demand", "VirtualParticipant"),
        false,
    )
    _openapi_field_operation_cost = _decode(
        VirtualParticipantOperationCost,
        _required(_openapi_object, "operation_cost", "VirtualParticipant"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "settlement_point_id",
            "max_supply",
            "max_demand",
            "operation_cost",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return VirtualParticipant(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        settlement_point_id=_openapi_field_settlement_point_id,
        max_supply=_openapi_field_max_supply,
        max_demand=_openapi_field_max_demand,
        operation_cost=_openapi_field_operation_cost,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::VirtualParticipant)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.settlement_point_id isa Absent || (
        _openapi_output["settlement_point_id"] =
            _encode_unvalidated(_openapi_value.settlement_point_id)
    )
    _openapi_value.max_supply isa Absent ||
        (_openapi_output["max_supply"] = _encode_unvalidated(_openapi_value.max_supply))
    _openapi_value.max_demand isa Absent ||
        (_openapi_output["max_demand"] = _encode_unvalidated(_openapi_value.max_demand))
    _openapi_value.operation_cost isa Absent || (
        _openapi_output["operation_cost"] =
            _encode_unvalidated(_openapi_value.operation_cost)
    )
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::VirtualParticipant) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-93547ad8c2b21cc361f5.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding VirtualParticipant";
    direction=:neutral,
)

function _form_fields(_openapi_value::VirtualParticipant)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.settlement_point_id isa Absent ||
        push!(_openapi_output, "settlement_point_id" => _openapi_value.settlement_point_id)
    _openapi_value.max_supply isa Absent ||
        push!(_openapi_output, "max_supply" => _openapi_value.max_supply)
    _openapi_value.max_demand isa Absent ||
        push!(_openapi_output, "max_demand" => _openapi_value.max_demand)
    _openapi_value.operation_cost isa Absent ||
        push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
