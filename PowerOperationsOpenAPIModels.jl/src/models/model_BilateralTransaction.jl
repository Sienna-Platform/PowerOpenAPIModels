"""
    BilateralTransaction

A bilaterally negotiated trade reported into the settlement ledger. Settlement-only: it carries no power-balance impact and never clears against a market model. It exists for round-tripping submissions and offline settlement.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `seller_id`: External participant identifier for the selling counterparty, as reported on the transaction. Not a component reference: sellers are not represented in the entity registry.
  - `buyer_id`: External participant identifier for the buying counterparty, as reported on the transaction. Not a component reference: buyers are not represented in the entity registry.
  - `from_id`: ID of the source location, resolved through the entity registry: a topology record or a trading hub.
  - `to_id`: ID of the sink location, resolved through the entity registry: a topology record or a trading hub. `null` for a single-location trade.
  - `product`: Traded product.
  - `market`: Market stage the transaction was reported against.
  - `confirmation`: Confirmation status the transaction settled under.
  - `max_active_power`: MW envelope of the transaction. Units: MW.
  - `active_power_association_id`: Store-minted id of the time series supplying the trade's delivered active-power schedule, or null when `max_active_power` alone describes the trade.
"""
Base.@kwdef struct BilateralTransaction <: APIModel
    id::Int64
    name::String
    seller_id::String
    buyer_id::String
    from_id::Int64
    to_id::Union{Absent, Union{Int64, Nothing}} = ABSENT
    product::BilateralProduct
    market::MarketStage
    confirmation::BilateralConfirmation
    max_active_power::Float64
    active_power_association_id::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{BilateralTransaction}, value) = _decode(BilateralTransaction, value, true)
function _decode(::Type{BilateralTransaction}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-605214735ccfd84328e6.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding BilateralTransaction";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "BilateralTransaction")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_seller_id = _decode(
        String,
        _required(_openapi_object, "seller_id", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_buyer_id = _decode(
        String,
        _required(_openapi_object, "buyer_id", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_from_id = _decode(
        Int64,
        _required(_openapi_object, "from_id", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_to_id =
        haskey(_openapi_object, "to_id") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["to_id"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_product = _decode(
        BilateralProduct,
        _required(_openapi_object, "product", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_market = _decode(
        MarketStage,
        _required(_openapi_object, "market", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_confirmation = _decode(
        BilateralConfirmation,
        _required(_openapi_object, "confirmation", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_max_active_power = _decode(
        Float64,
        _required(_openapi_object, "max_active_power", "BilateralTransaction"),
        _openapi_validate,
    )
    _openapi_field_active_power_association_id =
        haskey(_openapi_object, "active_power_association_id") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["active_power_association_id"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "seller_id",
            "buyer_id",
            "from_id",
            "to_id",
            "product",
            "market",
            "confirmation",
            "max_active_power",
            "active_power_association_id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return BilateralTransaction(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        seller_id=_openapi_field_seller_id,
        buyer_id=_openapi_field_buyer_id,
        from_id=_openapi_field_from_id,
        to_id=_openapi_field_to_id,
        product=_openapi_field_product,
        market=_openapi_field_market,
        confirmation=_openapi_field_confirmation,
        max_active_power=_openapi_field_max_active_power,
        active_power_association_id=_openapi_field_active_power_association_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::BilateralTransaction)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.seller_id isa Absent ||
        (_openapi_output["seller_id"] = _encode(_openapi_value.seller_id))
    _openapi_value.buyer_id isa Absent ||
        (_openapi_output["buyer_id"] = _encode(_openapi_value.buyer_id))
    _openapi_value.from_id isa Absent ||
        (_openapi_output["from_id"] = _encode(_openapi_value.from_id))
    _openapi_value.to_id isa Absent ||
        (_openapi_output["to_id"] = _encode(_openapi_value.to_id))
    _openapi_value.product isa Absent ||
        (_openapi_output["product"] = _encode(_openapi_value.product))
    _openapi_value.market isa Absent ||
        (_openapi_output["market"] = _encode(_openapi_value.market))
    _openapi_value.confirmation isa Absent ||
        (_openapi_output["confirmation"] = _encode(_openapi_value.confirmation))
    _openapi_value.max_active_power isa Absent ||
        (_openapi_output["max_active_power"] = _encode(_openapi_value.max_active_power))
    _openapi_value.active_power_association_id isa Absent || (
        _openapi_output["active_power_association_id"] =
            _encode(_openapi_value.active_power_association_id)
    )
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
            resource="https://openapi.invalid/schema/external-605214735ccfd84328e6.json",
            pointer="",
        ),
        _openapi_output,
        "encoding BilateralTransaction";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::BilateralTransaction)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.seller_id isa Absent ||
        push!(_openapi_output, "seller_id" => _openapi_value.seller_id)
    _openapi_value.buyer_id isa Absent ||
        push!(_openapi_output, "buyer_id" => _openapi_value.buyer_id)
    _openapi_value.from_id isa Absent ||
        push!(_openapi_output, "from_id" => _openapi_value.from_id)
    _openapi_value.to_id isa Absent ||
        push!(_openapi_output, "to_id" => _openapi_value.to_id)
    _openapi_value.product isa Absent ||
        push!(_openapi_output, "product" => _openapi_value.product)
    _openapi_value.market isa Absent ||
        push!(_openapi_output, "market" => _openapi_value.market)
    _openapi_value.confirmation isa Absent ||
        push!(_openapi_output, "confirmation" => _openapi_value.confirmation)
    _openapi_value.max_active_power isa Absent ||
        push!(_openapi_output, "max_active_power" => _openapi_value.max_active_power)
    _openapi_value.active_power_association_id isa Absent || push!(
        _openapi_output,
        "active_power_association_id" => _openapi_value.active_power_association_id,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
