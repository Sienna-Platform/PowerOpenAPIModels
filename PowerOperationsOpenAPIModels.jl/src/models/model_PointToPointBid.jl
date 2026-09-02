@doc "    PointToPointBid\n\nA priced point-to-point spread bid (e.g. an up-to-congestion or PTP obligation bid): a willingness-to-pay curve on the price spread between two locations. Clears as a withdrawal at the source terminal and an injection at the sink terminal.\n\n- `available`: Indicator of whether the bid is available for market clearing (`true`) or not (`false`).\n- `from_id`: ID of the source terminal (withdrawal side), resolved through the entity registry: a topology record or a trading hub.\n- `id`: Unique integer identifier for this component.\n- `linked_crr`: Identifier of a linked congestion-right instrument, when the market couples the bid to one.\n- `max_active_power`: MW envelope for the bid. Units: MW.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `price_limits`: Tariff bid-price bounds on the spread. Units: USD/MWh.\n- `spread_bid`: Willingness-to-pay curve on the to-minus-from price spread, as an offer-curve operating cost (incremental side only).\n- `to_id`: ID of the sink terminal (injection side), resolved through the entity registry: a topology record or a trading hub; must differ from `from_id`."
Base.@kwdef struct PointToPointBid
    available::Bool
    from_id::Int64
    id::Int64
    linked_crr::Union{Absent,Union{Nothing,String}} = ABSENT
    max_active_power::Float64
    name::String
    price_limits::PointToPointBidPriceLimits
    spread_bid::PointToPointBidSpreadBid
    to_id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{PointToPointBid}, value) = _decode(PointToPointBid, value, true)
function _decode(::Type{PointToPointBid}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/PointToPointBid"), _openapi_raw, "decoding PointToPointBid"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "PointToPointBid")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "PointToPointBid"), _openapi_validate)
    _openapi_field_from_id = _decode(Int64, _required(_openapi_object, "from_id", "PointToPointBid"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "PointToPointBid"), _openapi_validate)
    _openapi_field_linked_crr = haskey(_openapi_object, "linked_crr") ? _decode(Union{Absent,Union{Nothing,String}}, _openapi_object["linked_crr"], _openapi_validate) : ABSENT
    _openapi_field_max_active_power = _decode(Float64, _required(_openapi_object, "max_active_power", "PointToPointBid"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "PointToPointBid"), _openapi_validate)
    _openapi_field_price_limits = _decode(PointToPointBidPriceLimits, _required(_openapi_object, "price_limits", "PointToPointBid"), _openapi_validate)
    _openapi_field_spread_bid = _decode(PointToPointBidSpreadBid, _required(_openapi_object, "spread_bid", "PointToPointBid"), _openapi_validate)
    _openapi_field_to_id = _decode(Int64, _required(_openapi_object, "to_id", "PointToPointBid"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","from_id","id","linked_crr","max_active_power","name","price_limits","spread_bid","to_id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return PointToPointBid(; available = _openapi_field_available, from_id = _openapi_field_from_id, id = _openapi_field_id, linked_crr = _openapi_field_linked_crr, max_active_power = _openapi_field_max_active_power, name = _openapi_field_name, price_limits = _openapi_field_price_limits, spread_bid = _openapi_field_spread_bid, to_id = _openapi_field_to_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::PointToPointBid)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.from_id isa Absent || (_openapi_output["from_id"] = _encode(_openapi_value.from_id))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.linked_crr isa Absent || (_openapi_output["linked_crr"] = _encode(_openapi_value.linked_crr))
    _openapi_value.max_active_power isa Absent || (_openapi_output["max_active_power"] = _encode(_openapi_value.max_active_power))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.price_limits isa Absent || (_openapi_output["price_limits"] = _encode(_openapi_value.price_limits))
    _openapi_value.spread_bid isa Absent || (_openapi_output["spread_bid"] = _encode(_openapi_value.spread_bid))
    _openapi_value.to_id isa Absent || (_openapi_output["to_id"] = _encode(_openapi_value.to_id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/PointToPointBid"), _openapi_output, "encoding PointToPointBid"; direction = :neutral)
end

function _form_fields(_openapi_value::PointToPointBid)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.from_id isa Absent || push!(_openapi_output, "from_id" => _openapi_value.from_id)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.linked_crr isa Absent || push!(_openapi_output, "linked_crr" => _openapi_value.linked_crr)
    _openapi_value.max_active_power isa Absent || push!(_openapi_output, "max_active_power" => _openapi_value.max_active_power)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.price_limits isa Absent || push!(_openapi_output, "price_limits" => _openapi_value.price_limits)
    _openapi_value.spread_bid isa Absent || push!(_openapi_output, "spread_bid" => _openapi_value.spread_bid)
    _openapi_value.to_id isa Absent || push!(_openapi_output, "to_id" => _openapi_value.to_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
