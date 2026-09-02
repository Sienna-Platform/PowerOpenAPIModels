@doc "    VirtualParticipant\n\nA virtual (convergence) market participant. Supply offers map to the operating cost's incremental offer curves; demand bids map to decremental offer curves. Settles either at a settlement point or at associated trading hubs — the two are mutually exclusive; hub membership is carried as TradingHubAssociation rows rather than a list on this record, matching the trading hub's own membership convention.\n\n- `available`: Indicator of whether the participant is available for market clearing (`true`) or not (`false`).\n- `id`: Unique integer identifier for this component.\n- `max_demand`: Maximum envelope for the decremental (demand) side. Units: MW.\n- `max_supply`: Maximum envelope for the incremental (supply) side. Units: MW.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `operation_cost`: Bid curves as an offer-curve operating cost.\n- `settlement_point_id`: ID of the location this participant settles at — a bus, area, or load zone. `null` when the participant settles at trading hubs instead."
Base.@kwdef struct VirtualParticipant
    available::Bool
    id::Int64
    max_demand::Float64
    max_supply::Float64
    name::String
    operation_cost::VirtualParticipantOperationCost
    settlement_point_id::Union{Absent,Union{Int64,Nothing}} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{VirtualParticipant}, value) = _decode(VirtualParticipant, value, true)
function _decode(::Type{VirtualParticipant}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/VirtualParticipant"), _openapi_raw, "decoding VirtualParticipant"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "VirtualParticipant")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "VirtualParticipant"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "VirtualParticipant"), _openapi_validate)
    _openapi_field_max_demand = _decode(Float64, _required(_openapi_object, "max_demand", "VirtualParticipant"), _openapi_validate)
    _openapi_field_max_supply = _decode(Float64, _required(_openapi_object, "max_supply", "VirtualParticipant"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "VirtualParticipant"), _openapi_validate)
    _openapi_field_operation_cost = _decode(VirtualParticipantOperationCost, _required(_openapi_object, "operation_cost", "VirtualParticipant"), _openapi_validate)
    _openapi_field_settlement_point_id = haskey(_openapi_object, "settlement_point_id") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["settlement_point_id"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","id","max_demand","max_supply","name","operation_cost","settlement_point_id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return VirtualParticipant(; available = _openapi_field_available, id = _openapi_field_id, max_demand = _openapi_field_max_demand, max_supply = _openapi_field_max_supply, name = _openapi_field_name, operation_cost = _openapi_field_operation_cost, settlement_point_id = _openapi_field_settlement_point_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::VirtualParticipant)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.max_demand isa Absent || (_openapi_output["max_demand"] = _encode(_openapi_value.max_demand))
    _openapi_value.max_supply isa Absent || (_openapi_output["max_supply"] = _encode(_openapi_value.max_supply))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.operation_cost isa Absent || (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.settlement_point_id isa Absent || (_openapi_output["settlement_point_id"] = _encode(_openapi_value.settlement_point_id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/VirtualParticipant"), _openapi_output, "encoding VirtualParticipant"; direction = :neutral)
end

function _form_fields(_openapi_value::VirtualParticipant)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.max_demand isa Absent || push!(_openapi_output, "max_demand" => _openapi_value.max_demand)
    _openapi_value.max_supply isa Absent || push!(_openapi_output, "max_supply" => _openapi_value.max_supply)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.operation_cost isa Absent || push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.settlement_point_id isa Absent || push!(_openapi_output, "settlement_point_id" => _openapi_value.settlement_point_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
