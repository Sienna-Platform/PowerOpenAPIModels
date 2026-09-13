"""
    TradingHubAssociation

Links a trading hub to one associated entity. One record per (hub, member) pair. `entity_id` may name a bus (hub membership) or a market transaction settling at the hub, resolved through the entity registry, so no member-type discriminator is needed — the same shape as ServiceAssociation.

  - `trading_hub_id`: ID of the trading hub the association belongs to.
  - `entity_id`: ID of the associated entity: a bus or a market transaction.
"""
Base.@kwdef struct TradingHubAssociation <: APIModel
    trading_hub_id::Int64
    entity_id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TradingHubAssociation}, value) = _decode(TradingHubAssociation, value, true)
function _decode(::Type{TradingHubAssociation}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-b6633d19bfa180c620d4.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding TradingHubAssociation";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TradingHubAssociation")
    _openapi_field_trading_hub_id = _decode(
        Int64,
        _required(_openapi_object, "trading_hub_id", "TradingHubAssociation"),
        _openapi_validate,
    )
    _openapi_field_entity_id = _decode(
        Int64,
        _required(_openapi_object, "entity_id", "TradingHubAssociation"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("trading_hub_id", "entity_id") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return TradingHubAssociation(;
        trading_hub_id=_openapi_field_trading_hub_id,
        entity_id=_openapi_field_entity_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::TradingHubAssociation)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.trading_hub_id isa Absent ||
        (_openapi_output["trading_hub_id"] = _encode(_openapi_value.trading_hub_id))
    _openapi_value.entity_id isa Absent ||
        (_openapi_output["entity_id"] = _encode(_openapi_value.entity_id))
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
            resource="https://openapi.invalid/schema/external-b6633d19bfa180c620d4.json",
            pointer="",
        ),
        _openapi_output,
        "encoding TradingHubAssociation";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::TradingHubAssociation)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.trading_hub_id isa Absent ||
        push!(_openapi_output, "trading_hub_id" => _openapi_value.trading_hub_id)
    _openapi_value.entity_id isa Absent ||
        push!(_openapi_output, "entity_id" => _openapi_value.entity_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
