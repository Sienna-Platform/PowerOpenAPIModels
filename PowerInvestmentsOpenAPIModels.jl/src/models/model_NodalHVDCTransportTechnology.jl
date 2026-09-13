"""
    NodalHVDCTransportTechnology

A nodal representation of candidate HVDC transmission lines between two regions, added in discrete units of `unit_size` and characterized by capacity limits, a capital cost curve, and a loss model expressed as a fraction of installed nameplate capacity.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `power_systems_type`: Corresponding type to be used in PCM modeling.
  - `start_node`: Start node for transport technology.
  - `end_node`: End node for transport technology.
  - `capacity_limits`: Allowable capacity for a transmission line. Units: MW.
  - `capital_costs`: Capital and interconnection cost of adding new capacity to the nodal transmission line (capital cost in USD/MW).
  - `line_loss`: Loss model coefficients. Accepts a linear model with a constant loss and a proportional loss rate, or a Piecewise loss with N segments for different proportional losses. All terms are defined as fraction of installed nameplate capacity. Units: 1.
  - `unit_size`: Used for integer investment decisions. Represents the rating capacity of individual new lines. Units: MW.
  - `financial_data`: Struct containing relevant financial information for a technology.
"""
Base.@kwdef struct NodalHVDCTransportTechnology <: APIModel
    id::Int64
    name::String
    available::Bool
    power_systems_type::String
    start_node::Int64
    end_node::Int64
    capacity_limits::Union{Absent, MinMax, Nothing} = ABSENT
    capital_costs::Union{Absent, CapitalCost, Nothing} = ABSENT
    line_loss::Union{Absent, NodalHVDCTransportTechnologyLineLoss, Nothing} = ABSENT
    unit_size::Union{Absent, Float64, Nothing} = ABSENT
    financial_data::TechnologyFinancialData
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{NodalHVDCTransportTechnology}, value) =
    _decode(NodalHVDCTransportTechnology, value, true)
function _decode(
    ::Type{NodalHVDCTransportTechnology},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-d257bbdda9d1dc230759.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding NodalHVDCTransportTechnology";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "NodalHVDCTransportTechnology")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "NodalHVDCTransportTechnology"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "NodalHVDCTransportTechnology"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "NodalHVDCTransportTechnology"),
        _openapi_validate,
    )
    _openapi_field_power_systems_type = _decode(
        String,
        _required(_openapi_object, "power_systems_type", "NodalHVDCTransportTechnology"),
        _openapi_validate,
    )
    _openapi_field_start_node = _decode(
        Int64,
        _required(_openapi_object, "start_node", "NodalHVDCTransportTechnology"),
        _openapi_validate,
    )
    _openapi_field_end_node = _decode(
        Int64,
        _required(_openapi_object, "end_node", "NodalHVDCTransportTechnology"),
        _openapi_validate,
    )
    _openapi_field_capacity_limits =
        haskey(_openapi_object, "capacity_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["capacity_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_capital_costs =
        haskey(_openapi_object, "capital_costs") ?
        _decode(
            Union{Absent, CapitalCost, Nothing},
            _openapi_object["capital_costs"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_line_loss =
        haskey(_openapi_object, "line_loss") ?
        _decode(
            Union{Absent, NodalHVDCTransportTechnologyLineLoss, Nothing},
            _openapi_object["line_loss"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_unit_size =
        haskey(_openapi_object, "unit_size") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["unit_size"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_financial_data = _decode(
        TechnologyFinancialData,
        _required(_openapi_object, "financial_data", "NodalHVDCTransportTechnology"),
        _openapi_validate,
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
            "line_loss",
            "unit_size",
            "financial_data",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return NodalHVDCTransportTechnology(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        power_systems_type=_openapi_field_power_systems_type,
        start_node=_openapi_field_start_node,
        end_node=_openapi_field_end_node,
        capacity_limits=_openapi_field_capacity_limits,
        capital_costs=_openapi_field_capital_costs,
        line_loss=_openapi_field_line_loss,
        unit_size=_openapi_field_unit_size,
        financial_data=_openapi_field_financial_data,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::NodalHVDCTransportTechnology)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.power_systems_type isa Absent ||
        (_openapi_output["power_systems_type"] = _encode(_openapi_value.power_systems_type))
    _openapi_value.start_node isa Absent ||
        (_openapi_output["start_node"] = _encode(_openapi_value.start_node))
    _openapi_value.end_node isa Absent ||
        (_openapi_output["end_node"] = _encode(_openapi_value.end_node))
    _openapi_value.capacity_limits isa Absent ||
        (_openapi_output["capacity_limits"] = _encode(_openapi_value.capacity_limits))
    _openapi_value.capital_costs isa Absent ||
        (_openapi_output["capital_costs"] = _encode(_openapi_value.capital_costs))
    _openapi_value.line_loss isa Absent ||
        (_openapi_output["line_loss"] = _encode(_openapi_value.line_loss))
    _openapi_value.unit_size isa Absent ||
        (_openapi_output["unit_size"] = _encode(_openapi_value.unit_size))
    _openapi_value.financial_data isa Absent ||
        (_openapi_output["financial_data"] = _encode(_openapi_value.financial_data))
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
            resource="https://openapi.invalid/schema/external-d257bbdda9d1dc230759.json",
            pointer="",
        ),
        _openapi_output,
        "encoding NodalHVDCTransportTechnology";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::NodalHVDCTransportTechnology)
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
    _openapi_value.line_loss isa Absent ||
        push!(_openapi_output, "line_loss" => _openapi_value.line_loss)
    _openapi_value.unit_size isa Absent ||
        push!(_openapi_output, "unit_size" => _openapi_value.unit_size)
    _openapi_value.financial_data isa Absent ||
        push!(_openapi_output, "financial_data" => _openapi_value.financial_data)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
