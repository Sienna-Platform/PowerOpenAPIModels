"""
    DemandSideTechnology

An end-use technology that consumes electricity and can be built, such as a hydrogen electrolyzer, direct air capture, or an industrial heat pump. Its consumption is a decision, valued by what it produces: `technology_efficiency` converts electricity into product and `price_per_unit` prices the product. It carries the capital and operating cost of new capacity together with its capacity limits, minimum consumption, and ramp limits.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `power_systems_type`: Corresponding type to be used in PCM modeling.
  - `region`: Location where the component applies. Can be a zone or node.
  - `capacity_limits`: Minimum and maximum allowable installed capacity for a technology. Units: MW.
  - `unit_size`: Used for discrete investment decisions. Size of each unit being built. Units: MW.
  - `capital_costs`: Capital and interconnection cost for investing in a technology (capital cost in USD/MW).
  - `operation_costs`: Fixed and variable O&M costs, the variable cost per MWh consumed. Units: USD/MWh.
  - `min_power`: Minimum consumption as a fraction of installed capacity. Units: 1.
  - `ramp_limits`: Maximum decrease and increase in consumption between operation periods. Units: MW/min.
  - `technology_efficiency`: Electricity consumed per unit of product. Ex: MWh per tonne of hydrogen for electrolyzers. Units: 1.
  - `price_per_unit`: Price or value per unit of product. Ex: USD per tonne of hydrogen for electrolyzers. Units: USD/t.
  - `lifetime`: Maximum number of years a technology can be active once installed. Units: yr.
  - `financial_data`: Struct containing relevant financial information for a technology.
"""
Base.@kwdef struct DemandSideTechnology <: APIModel
    id::Int64
    name::String
    available::Bool
    power_systems_type::String
    region::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    capacity_limits::Union{Absent, MinMax, Nothing} = ABSENT
    unit_size::Union{Absent, Float64, Nothing} = ABSENT
    capital_costs::Union{Absent, CapitalCost, Nothing} = ABSENT
    operation_costs::Union{Absent, LoadCost, Nothing} = ABSENT
    min_power::Union{Absent, Float64, Nothing} = ABSENT
    ramp_limits::Union{Absent, UpDown, Nothing} = ABSENT
    technology_efficiency::Union{Absent, Float64, Nothing} = ABSENT
    price_per_unit::Union{Absent, DemandSideTechnologyPricePerUnit, Nothing} = ABSENT
    lifetime::Union{Absent, Int64, Nothing} = ABSENT
    financial_data::TechnologyFinancialData
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DemandSideTechnology}, value) = _decode(DemandSideTechnology, value, true)
function _decode(::Type{DemandSideTechnology}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-51aedeaae1475aeec613.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding DemandSideTechnology";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DemandSideTechnology")
    _openapi_field_id = _decode_zoned(
        Int64,
        _required(_openapi_object, "id", "DemandSideTechnology"),
        false,
    )
    _openapi_field_name = _decode_zoned(
        String,
        _required(_openapi_object, "name", "DemandSideTechnology"),
        false,
    )
    _openapi_field_available = _decode_zoned(
        Bool,
        _required(_openapi_object, "available", "DemandSideTechnology"),
        false,
    )
    _openapi_field_power_systems_type = _decode_zoned(
        String,
        _required(_openapi_object, "power_systems_type", "DemandSideTechnology"),
        false,
    )
    _openapi_field_region =
        haskey(_openapi_object, "region") ?
        _decode_zoned(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["region"],
            false,
        ) : ABSENT
    _openapi_field_capacity_limits =
        haskey(_openapi_object, "capacity_limits") ?
        _decode_zoned(
            Union{Absent, MinMax, Nothing},
            _openapi_object["capacity_limits"],
            false,
        ) : ABSENT
    _openapi_field_unit_size =
        haskey(_openapi_object, "unit_size") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["unit_size"],
            false,
        ) : ABSENT
    _openapi_field_capital_costs =
        haskey(_openapi_object, "capital_costs") ?
        _decode_zoned(
            Union{Absent, CapitalCost, Nothing},
            _openapi_object["capital_costs"],
            false,
        ) : ABSENT
    _openapi_field_operation_costs =
        haskey(_openapi_object, "operation_costs") ?
        _decode_zoned(
            Union{Absent, LoadCost, Nothing},
            _openapi_object["operation_costs"],
            false,
        ) : ABSENT
    _openapi_field_min_power =
        haskey(_openapi_object, "min_power") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["min_power"],
            false,
        ) : ABSENT
    _openapi_field_ramp_limits =
        haskey(_openapi_object, "ramp_limits") ?
        _decode_zoned(
            Union{Absent, UpDown, Nothing},
            _openapi_object["ramp_limits"],
            false,
        ) : ABSENT
    _openapi_field_technology_efficiency =
        haskey(_openapi_object, "technology_efficiency") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["technology_efficiency"],
            false,
        ) : ABSENT
    _openapi_field_price_per_unit =
        haskey(_openapi_object, "price_per_unit") ?
        _decode_zoned(
            Union{Absent, DemandSideTechnologyPricePerUnit, Nothing},
            _openapi_object["price_per_unit"],
            false,
        ) : ABSENT
    _openapi_field_lifetime =
        haskey(_openapi_object, "lifetime") ?
        _decode_zoned(Union{Absent, Int64, Nothing}, _openapi_object["lifetime"], false) :
        ABSENT
    _openapi_field_financial_data = _decode_zoned(
        TechnologyFinancialData,
        _required(_openapi_object, "financial_data", "DemandSideTechnology"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "power_systems_type",
            "region",
            "capacity_limits",
            "unit_size",
            "capital_costs",
            "operation_costs",
            "min_power",
            "ramp_limits",
            "technology_efficiency",
            "price_per_unit",
            "lifetime",
            "financial_data",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return DemandSideTechnology(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        power_systems_type=_openapi_field_power_systems_type,
        region=_openapi_field_region,
        capacity_limits=_openapi_field_capacity_limits,
        unit_size=_openapi_field_unit_size,
        capital_costs=_openapi_field_capital_costs,
        operation_costs=_openapi_field_operation_costs,
        min_power=_openapi_field_min_power,
        ramp_limits=_openapi_field_ramp_limits,
        technology_efficiency=_openapi_field_technology_efficiency,
        price_per_unit=_openapi_field_price_per_unit,
        lifetime=_openapi_field_lifetime,
        financial_data=_openapi_field_financial_data,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::DemandSideTechnology)
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
    _openapi_value.region isa Absent ||
        (_openapi_output["region"] = _encode_unvalidated(_openapi_value.region))
    _openapi_value.capacity_limits isa Absent || (
        _openapi_output["capacity_limits"] =
            _encode_unvalidated(_openapi_value.capacity_limits)
    )
    _openapi_value.unit_size isa Absent ||
        (_openapi_output["unit_size"] = _encode_unvalidated(_openapi_value.unit_size))
    _openapi_value.capital_costs isa Absent || (
        _openapi_output["capital_costs"] =
            _encode_unvalidated(_openapi_value.capital_costs)
    )
    _openapi_value.operation_costs isa Absent || (
        _openapi_output["operation_costs"] =
            _encode_unvalidated(_openapi_value.operation_costs)
    )
    _openapi_value.min_power isa Absent ||
        (_openapi_output["min_power"] = _encode_unvalidated(_openapi_value.min_power))
    _openapi_value.ramp_limits isa Absent ||
        (_openapi_output["ramp_limits"] = _encode_unvalidated(_openapi_value.ramp_limits))
    _openapi_value.technology_efficiency isa Absent || (
        _openapi_output["technology_efficiency"] =
            _encode_unvalidated(_openapi_value.technology_efficiency)
    )
    _openapi_value.price_per_unit isa Absent || (
        _openapi_output["price_per_unit"] =
            _encode_unvalidated(_openapi_value.price_per_unit)
    )
    _openapi_value.lifetime isa Absent ||
        (_openapi_output["lifetime"] = _encode_unvalidated(_openapi_value.lifetime))
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
_encode(_openapi_value::DemandSideTechnology) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-51aedeaae1475aeec613.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding DemandSideTechnology";
    direction=:neutral,
)

function _form_fields(_openapi_value::DemandSideTechnology)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.power_systems_type isa Absent ||
        push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.region isa Absent ||
        push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.capacity_limits isa Absent ||
        push!(_openapi_output, "capacity_limits" => _openapi_value.capacity_limits)
    _openapi_value.unit_size isa Absent ||
        push!(_openapi_output, "unit_size" => _openapi_value.unit_size)
    _openapi_value.capital_costs isa Absent ||
        push!(_openapi_output, "capital_costs" => _openapi_value.capital_costs)
    _openapi_value.operation_costs isa Absent ||
        push!(_openapi_output, "operation_costs" => _openapi_value.operation_costs)
    _openapi_value.min_power isa Absent ||
        push!(_openapi_output, "min_power" => _openapi_value.min_power)
    _openapi_value.ramp_limits isa Absent ||
        push!(_openapi_output, "ramp_limits" => _openapi_value.ramp_limits)
    _openapi_value.technology_efficiency isa Absent || push!(
        _openapi_output,
        "technology_efficiency" => _openapi_value.technology_efficiency,
    )
    _openapi_value.price_per_unit isa Absent ||
        push!(_openapi_output, "price_per_unit" => _openapi_value.price_per_unit)
    _openapi_value.lifetime isa Absent ||
        push!(_openapi_output, "lifetime" => _openapi_value.lifetime)
    _openapi_value.financial_data isa Absent ||
        push!(_openapi_output, "financial_data" => _openapi_value.financial_data)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
