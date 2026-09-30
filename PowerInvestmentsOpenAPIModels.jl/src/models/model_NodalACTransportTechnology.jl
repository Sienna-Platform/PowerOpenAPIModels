"""
    NodalACTransportTechnology

Nodal representation of candidate AC transmission lines between two regions. Alongside capacity limits and a capital cost curve it carries the electrical characteristics of the line — resistance, series reactance, and voltage rating — and is added in discrete units of `unit_size`.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `power_systems_type`: Corresponding type to be used in PCM modeling.
  - `start_node`: Start node for transport technology.
  - `end_node`: End node for transport technology.
  - `capacity_limits`: Allowable capacity for a transmission line. Units: MW.
  - `capital_costs`: Capital and interconnection cost of adding new capacity to the nodal transmission line (capital cost in USD/MW).
  - `resistance`: Technology resistance in Ohms. Units: ohm.
  - `voltage`: Voltage rating of transmission line. Units: kV.
  - `unit_size`: Used for integer investment decisions. Represents the rating capacity of individual new lines. Units: MW.
  - `reactance`: Series reactance for a line. Units: ohm.
  - `financial_data`: Struct containing relevant financial information for a technology.
"""
Base.@kwdef struct NodalACTransportTechnology <: APIModel
    id::Int64
    name::String
    available::Bool
    power_systems_type::String
    start_node::Int64
    end_node::Int64
    capacity_limits::Union{Absent, MinMax, Nothing} = ABSENT
    capital_costs::Union{Absent, CapitalCost, Nothing} = ABSENT
    resistance::Union{Absent, Float64, Nothing} = ABSENT
    voltage::Union{Absent, Float64, Nothing} = ABSENT
    unit_size::Union{Absent, Float64, Nothing} = ABSENT
    reactance::Union{Absent, Float64, Nothing} = ABSENT
    financial_data::TechnologyFinancialData
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{NodalACTransportTechnology}, value) =
    _decode(NodalACTransportTechnology, value, true)
function _decode(::Type{NodalACTransportTechnology}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-f28c3ef13319f51cdc41.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding NodalACTransportTechnology";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "NodalACTransportTechnology")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "NodalACTransportTechnology"),
        false,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "NodalACTransportTechnology"),
        false,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "NodalACTransportTechnology"),
        false,
    )
    _openapi_field_power_systems_type = _decode(
        String,
        _required(_openapi_object, "power_systems_type", "NodalACTransportTechnology"),
        false,
    )
    _openapi_field_start_node = _decode(
        Int64,
        _required(_openapi_object, "start_node", "NodalACTransportTechnology"),
        false,
    )
    _openapi_field_end_node = _decode(
        Int64,
        _required(_openapi_object, "end_node", "NodalACTransportTechnology"),
        false,
    )
    _openapi_field_capacity_limits =
        haskey(_openapi_object, "capacity_limits") ?
        _decode(Union{Absent, MinMax, Nothing}, _openapi_object["capacity_limits"], false) :
        ABSENT
    _openapi_field_capital_costs =
        haskey(_openapi_object, "capital_costs") ?
        _decode(
            Union{Absent, CapitalCost, Nothing},
            _openapi_object["capital_costs"],
            false,
        ) : ABSENT
    _openapi_field_resistance =
        haskey(_openapi_object, "resistance") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["resistance"], false) :
        ABSENT
    _openapi_field_voltage =
        haskey(_openapi_object, "voltage") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["voltage"], false) : ABSENT
    _openapi_field_unit_size =
        haskey(_openapi_object, "unit_size") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["unit_size"], false) :
        ABSENT
    _openapi_field_reactance =
        haskey(_openapi_object, "reactance") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["reactance"], false) :
        ABSENT
    _openapi_field_financial_data = _decode(
        TechnologyFinancialData,
        _required(_openapi_object, "financial_data", "NodalACTransportTechnology"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "power_systems_type",
            "start_node",
            "end_node",
            "capacity_limits",
            "capital_costs",
            "resistance",
            "voltage",
            "unit_size",
            "reactance",
            "financial_data",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return NodalACTransportTechnology(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        power_systems_type=_openapi_field_power_systems_type,
        start_node=_openapi_field_start_node,
        end_node=_openapi_field_end_node,
        capacity_limits=_openapi_field_capacity_limits,
        capital_costs=_openapi_field_capital_costs,
        resistance=_openapi_field_resistance,
        voltage=_openapi_field_voltage,
        unit_size=_openapi_field_unit_size,
        reactance=_openapi_field_reactance,
        financial_data=_openapi_field_financial_data,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::NodalACTransportTechnology)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.power_systems_type isa Absent || (
        _openapi_output["power_systems_type"] =
            _encode_unvalidated(_openapi_value.power_systems_type)
    )
    _openapi_value.start_node isa Absent ||
        (_openapi_output["start_node"] = _encode_unvalidated(_openapi_value.start_node))
    _openapi_value.end_node isa Absent ||
        (_openapi_output["end_node"] = _encode_unvalidated(_openapi_value.end_node))
    _openapi_value.capacity_limits isa Absent || (
        _openapi_output["capacity_limits"] =
            _encode_unvalidated(_openapi_value.capacity_limits)
    )
    _openapi_value.capital_costs isa Absent || (
        _openapi_output["capital_costs"] =
            _encode_unvalidated(_openapi_value.capital_costs)
    )
    _openapi_value.resistance isa Absent ||
        (_openapi_output["resistance"] = _encode_unvalidated(_openapi_value.resistance))
    _openapi_value.voltage isa Absent ||
        (_openapi_output["voltage"] = _encode_unvalidated(_openapi_value.voltage))
    _openapi_value.unit_size isa Absent ||
        (_openapi_output["unit_size"] = _encode_unvalidated(_openapi_value.unit_size))
    _openapi_value.reactance isa Absent ||
        (_openapi_output["reactance"] = _encode_unvalidated(_openapi_value.reactance))
    _openapi_value.financial_data isa Absent || (
        _openapi_output["financial_data"] =
            _encode_unvalidated(_openapi_value.financial_data)
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
_encode(_openapi_value::NodalACTransportTechnology) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-f28c3ef13319f51cdc41.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding NodalACTransportTechnology";
    direction=:neutral,
)

function _form_fields(_openapi_value::NodalACTransportTechnology)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.power_systems_type isa Absent ||
        push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.start_node isa Absent ||
        push!(_openapi_output, "start_node" => _openapi_value.start_node)
    _openapi_value.end_node isa Absent ||
        push!(_openapi_output, "end_node" => _openapi_value.end_node)
    _openapi_value.capacity_limits isa Absent ||
        push!(_openapi_output, "capacity_limits" => _openapi_value.capacity_limits)
    _openapi_value.capital_costs isa Absent ||
        push!(_openapi_output, "capital_costs" => _openapi_value.capital_costs)
    _openapi_value.resistance isa Absent ||
        push!(_openapi_output, "resistance" => _openapi_value.resistance)
    _openapi_value.voltage isa Absent ||
        push!(_openapi_output, "voltage" => _openapi_value.voltage)
    _openapi_value.unit_size isa Absent ||
        push!(_openapi_output, "unit_size" => _openapi_value.unit_size)
    _openapi_value.reactance isa Absent ||
        push!(_openapi_output, "reactance" => _openapi_value.reactance)
    _openapi_value.financial_data isa Absent ||
        push!(_openapi_output, "financial_data" => _openapi_value.financial_data)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
