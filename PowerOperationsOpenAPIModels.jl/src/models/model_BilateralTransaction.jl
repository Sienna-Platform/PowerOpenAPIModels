@doc "    BilateralTransaction\n\nA bilaterally negotiated trade reported into the settlement ledger. Settlement-only: it carries no power-balance impact and never clears against a market model. It exists for round-tripping submissions and offline settlement.\n\n- `active_power_association_id`: Store-minted id of the time series supplying the trade's delivered active-power schedule, or null when `max_active_power` alone describes the trade.\n- `buyer_id`: External participant identifier for the buying counterparty, as reported on the transaction. Not a component reference: buyers are not represented in the entity registry.\n- `confirmation`: Confirmation status the transaction settled under.\n- `from_id`: ID of the source location, resolved through the entity registry: a topology record or a trading hub.\n- `id`: Unique integer identifier for this component.\n- `market`: Market stage the transaction was reported against.\n- `max_active_power`: MW envelope of the transaction. Units: MW.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `product`: Traded product.\n- `seller_id`: External participant identifier for the selling counterparty, as reported on the transaction. Not a component reference: sellers are not represented in the entity registry.\n- `to_id`: ID of the sink location, resolved through the entity registry: a topology record or a trading hub. `null` for a single-location trade."
Base.@kwdef struct BilateralTransaction
    active_power_association_id::Union{Absent,Union{Int64,Nothing}} = ABSENT
    buyer_id::String
    confirmation::BilateralTransactionConfirmation
    from_id::Int64
    id::Int64
    market::BilateralTransactionMarket
    max_active_power::Float64
    name::String
    product::BilateralTransactionProduct
    seller_id::String
    to_id::Union{Absent,Union{Int64,Nothing}} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{BilateralTransaction}, value) = _decode(BilateralTransaction, value, true)
function _decode(::Type{BilateralTransaction}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/BilateralTransaction"), _openapi_raw, "decoding BilateralTransaction"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "BilateralTransaction")
    _openapi_field_active_power_association_id = haskey(_openapi_object, "active_power_association_id") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["active_power_association_id"], _openapi_validate) : ABSENT
    _openapi_field_buyer_id = _decode(String, _required(_openapi_object, "buyer_id", "BilateralTransaction"), _openapi_validate)
    _openapi_field_confirmation = _decode(BilateralTransactionConfirmation, _required(_openapi_object, "confirmation", "BilateralTransaction"), _openapi_validate)
    _openapi_field_from_id = _decode(Int64, _required(_openapi_object, "from_id", "BilateralTransaction"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "BilateralTransaction"), _openapi_validate)
    _openapi_field_market = _decode(BilateralTransactionMarket, _required(_openapi_object, "market", "BilateralTransaction"), _openapi_validate)
    _openapi_field_max_active_power = _decode(Float64, _required(_openapi_object, "max_active_power", "BilateralTransaction"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "BilateralTransaction"), _openapi_validate)
    _openapi_field_product = _decode(BilateralTransactionProduct, _required(_openapi_object, "product", "BilateralTransaction"), _openapi_validate)
    _openapi_field_seller_id = _decode(String, _required(_openapi_object, "seller_id", "BilateralTransaction"), _openapi_validate)
    _openapi_field_to_id = haskey(_openapi_object, "to_id") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["to_id"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power_association_id","buyer_id","confirmation","from_id","id","market","max_active_power","name","product","seller_id","to_id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return BilateralTransaction(; active_power_association_id = _openapi_field_active_power_association_id, buyer_id = _openapi_field_buyer_id, confirmation = _openapi_field_confirmation, from_id = _openapi_field_from_id, id = _openapi_field_id, market = _openapi_field_market, max_active_power = _openapi_field_max_active_power, name = _openapi_field_name, product = _openapi_field_product, seller_id = _openapi_field_seller_id, to_id = _openapi_field_to_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::BilateralTransaction)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power_association_id isa Absent || (_openapi_output["active_power_association_id"] = _encode(_openapi_value.active_power_association_id))
    _openapi_value.buyer_id isa Absent || (_openapi_output["buyer_id"] = _encode(_openapi_value.buyer_id))
    _openapi_value.confirmation isa Absent || (_openapi_output["confirmation"] = _encode(_openapi_value.confirmation))
    _openapi_value.from_id isa Absent || (_openapi_output["from_id"] = _encode(_openapi_value.from_id))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.market isa Absent || (_openapi_output["market"] = _encode(_openapi_value.market))
    _openapi_value.max_active_power isa Absent || (_openapi_output["max_active_power"] = _encode(_openapi_value.max_active_power))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.product isa Absent || (_openapi_output["product"] = _encode(_openapi_value.product))
    _openapi_value.seller_id isa Absent || (_openapi_output["seller_id"] = _encode(_openapi_value.seller_id))
    _openapi_value.to_id isa Absent || (_openapi_output["to_id"] = _encode(_openapi_value.to_id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/BilateralTransaction"), _openapi_output, "encoding BilateralTransaction"; direction = :neutral)
end

function _form_fields(_openapi_value::BilateralTransaction)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power_association_id isa Absent || push!(_openapi_output, "active_power_association_id" => _openapi_value.active_power_association_id)
    _openapi_value.buyer_id isa Absent || push!(_openapi_output, "buyer_id" => _openapi_value.buyer_id)
    _openapi_value.confirmation isa Absent || push!(_openapi_output, "confirmation" => _openapi_value.confirmation)
    _openapi_value.from_id isa Absent || push!(_openapi_output, "from_id" => _openapi_value.from_id)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.market isa Absent || push!(_openapi_output, "market" => _openapi_value.market)
    _openapi_value.max_active_power isa Absent || push!(_openapi_output, "max_active_power" => _openapi_value.max_active_power)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.product isa Absent || push!(_openapi_output, "product" => _openapi_value.product)
    _openapi_value.seller_id isa Absent || push!(_openapi_output, "seller_id" => _openapi_value.seller_id)
    _openapi_value.to_id isa Absent || push!(_openapi_output, "to_id" => _openapi_value.to_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
