"""
    DemandSideTechnology

Demand-side technology such as an electric vehicle fleet or a hydrogen electrolyzer. Its flexibility is described by how far demand may be delayed or advanced, how much of it may be curtailed, and the cost and energy losses of doing either.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `region`: Location where the component applies. Can be a zone or node.
  - `power_systems_type`: Corresponding type to be used in PCM modeling.
  - `technology_efficiency`: MWh of electricity per unit of output. Ex: MWh per ton of hydrogen for electrolyzers. Units: 1.
  - `price_per_unit`: Price or value per unit of output. Ex: USD per ton of hydrogen for electrolyzers. Units: USD/t.
  - `min_power`: Minimum operation of demandside unit as a fraction of peak demand. Units: 1.
  - `peak_demand_mw`: Peak demand value in MW. Units: MW.
  - `max_demand_delay`: Maximum number of minutes that demand can be deferred or delayed (minutes). Units: min.
  - `max_demand_advance`: Maximum number of minutes that demand can be scheduled in advance of the original schedule (minutes). Units: min.
  - `demand_energy_efficiency`: Energy efficiency associated with time shifting demand. Represents energy losses due to time shifting. Units: 1.
  - `shift_variable_cost`: Variable operation and maintenance costs associated with flexible demand deferral/advancement. Units: USD/MWh.
  - `curtailment_cost`: Energy cost of curtailed demand, USD per MWh. Units: USD/MWh.
  - `max_demand_curtailment`: Maximum fraction of demand that can be curtailed. Units: 1.
"""
Base.@kwdef struct DemandSideTechnology <: APIModel
    id::Int64
    name::String
    available::Bool
    region::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    power_systems_type::String
    technology_efficiency::Union{Absent, Float64, Nothing} = ABSENT
    price_per_unit::Union{Absent, DemandSideTechnologyPricePerUnit, Nothing} = ABSENT
    min_power::Union{Absent, Float64, Nothing} = ABSENT
    peak_demand_mw::Union{Absent, Float64, Nothing} = ABSENT
    max_demand_delay::Union{Absent, Float64, Nothing} = ABSENT
    max_demand_advance::Union{Absent, Float64, Nothing} = ABSENT
    demand_energy_efficiency::Union{Absent, Float64, Nothing} = ABSENT
    shift_variable_cost::Union{Absent, DemandSideTechnologyShiftVariableCost, Nothing} =
        ABSENT
    curtailment_cost::Union{Absent, DemandSideTechnologyCurtailmentCost, Nothing} = ABSENT
    max_demand_curtailment::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DemandSideTechnology}, value) = _decode(DemandSideTechnology, value, true)
function _decode(::Type{DemandSideTechnology}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-604d83c79216e8337181.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding DemandSideTechnology";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DemandSideTechnology")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "DemandSideTechnology"), false)
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "DemandSideTechnology"), false)
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "DemandSideTechnology"),
        false,
    )
    _openapi_field_region =
        haskey(_openapi_object, "region") ?
        _decode(Union{Absent, Nothing, Vector{Int64}}, _openapi_object["region"], false) :
        ABSENT
    _openapi_field_power_systems_type = _decode(
        String,
        _required(_openapi_object, "power_systems_type", "DemandSideTechnology"),
        false,
    )
    _openapi_field_technology_efficiency =
        haskey(_openapi_object, "technology_efficiency") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["technology_efficiency"],
            false,
        ) : ABSENT
    _openapi_field_price_per_unit =
        haskey(_openapi_object, "price_per_unit") ?
        _decode(
            Union{Absent, DemandSideTechnologyPricePerUnit, Nothing},
            _openapi_object["price_per_unit"],
            false,
        ) : ABSENT
    _openapi_field_min_power =
        haskey(_openapi_object, "min_power") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["min_power"], false) :
        ABSENT
    _openapi_field_peak_demand_mw =
        haskey(_openapi_object, "peak_demand_mw") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["peak_demand_mw"], false) :
        ABSENT
    _openapi_field_max_demand_delay =
        haskey(_openapi_object, "max_demand_delay") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_demand_delay"],
            false,
        ) : ABSENT
    _openapi_field_max_demand_advance =
        haskey(_openapi_object, "max_demand_advance") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_demand_advance"],
            false,
        ) : ABSENT
    _openapi_field_demand_energy_efficiency =
        haskey(_openapi_object, "demand_energy_efficiency") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["demand_energy_efficiency"],
            false,
        ) : ABSENT
    _openapi_field_shift_variable_cost =
        haskey(_openapi_object, "shift_variable_cost") ?
        _decode(
            Union{Absent, DemandSideTechnologyShiftVariableCost, Nothing},
            _openapi_object["shift_variable_cost"],
            false,
        ) : ABSENT
    _openapi_field_curtailment_cost =
        haskey(_openapi_object, "curtailment_cost") ?
        _decode(
            Union{Absent, DemandSideTechnologyCurtailmentCost, Nothing},
            _openapi_object["curtailment_cost"],
            false,
        ) : ABSENT
    _openapi_field_max_demand_curtailment =
        haskey(_openapi_object, "max_demand_curtailment") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_demand_curtailment"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "region",
            "power_systems_type",
            "technology_efficiency",
            "price_per_unit",
            "min_power",
            "peak_demand_mw",
            "max_demand_delay",
            "max_demand_advance",
            "demand_energy_efficiency",
            "shift_variable_cost",
            "curtailment_cost",
            "max_demand_curtailment",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return DemandSideTechnology(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        region=_openapi_field_region,
        power_systems_type=_openapi_field_power_systems_type,
        technology_efficiency=_openapi_field_technology_efficiency,
        price_per_unit=_openapi_field_price_per_unit,
        min_power=_openapi_field_min_power,
        peak_demand_mw=_openapi_field_peak_demand_mw,
        max_demand_delay=_openapi_field_max_demand_delay,
        max_demand_advance=_openapi_field_max_demand_advance,
        demand_energy_efficiency=_openapi_field_demand_energy_efficiency,
        shift_variable_cost=_openapi_field_shift_variable_cost,
        curtailment_cost=_openapi_field_curtailment_cost,
        max_demand_curtailment=_openapi_field_max_demand_curtailment,
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
    _openapi_value.region isa Absent ||
        (_openapi_output["region"] = _encode_unvalidated(_openapi_value.region))
    _openapi_value.power_systems_type isa Absent || (
        _openapi_output["power_systems_type"] =
            _encode_unvalidated(_openapi_value.power_systems_type)
    )
    _openapi_value.technology_efficiency isa Absent || (
        _openapi_output["technology_efficiency"] =
            _encode_unvalidated(_openapi_value.technology_efficiency)
    )
    _openapi_value.price_per_unit isa Absent || (
        _openapi_output["price_per_unit"] =
            _encode_unvalidated(_openapi_value.price_per_unit)
    )
    _openapi_value.min_power isa Absent ||
        (_openapi_output["min_power"] = _encode_unvalidated(_openapi_value.min_power))
    _openapi_value.peak_demand_mw isa Absent || (
        _openapi_output["peak_demand_mw"] =
            _encode_unvalidated(_openapi_value.peak_demand_mw)
    )
    _openapi_value.max_demand_delay isa Absent || (
        _openapi_output["max_demand_delay"] =
            _encode_unvalidated(_openapi_value.max_demand_delay)
    )
    _openapi_value.max_demand_advance isa Absent || (
        _openapi_output["max_demand_advance"] =
            _encode_unvalidated(_openapi_value.max_demand_advance)
    )
    _openapi_value.demand_energy_efficiency isa Absent || (
        _openapi_output["demand_energy_efficiency"] =
            _encode_unvalidated(_openapi_value.demand_energy_efficiency)
    )
    _openapi_value.shift_variable_cost isa Absent || (
        _openapi_output["shift_variable_cost"] =
            _encode_unvalidated(_openapi_value.shift_variable_cost)
    )
    _openapi_value.curtailment_cost isa Absent || (
        _openapi_output["curtailment_cost"] =
            _encode_unvalidated(_openapi_value.curtailment_cost)
    )
    _openapi_value.max_demand_curtailment isa Absent || (
        _openapi_output["max_demand_curtailment"] =
            _encode_unvalidated(_openapi_value.max_demand_curtailment)
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
        resource="https://openapi.invalid/schema/external-604d83c79216e8337181.json",
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
    _openapi_value.region isa Absent ||
        push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.power_systems_type isa Absent ||
        push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.technology_efficiency isa Absent || push!(
        _openapi_output,
        "technology_efficiency" => _openapi_value.technology_efficiency,
    )
    _openapi_value.price_per_unit isa Absent ||
        push!(_openapi_output, "price_per_unit" => _openapi_value.price_per_unit)
    _openapi_value.min_power isa Absent ||
        push!(_openapi_output, "min_power" => _openapi_value.min_power)
    _openapi_value.peak_demand_mw isa Absent ||
        push!(_openapi_output, "peak_demand_mw" => _openapi_value.peak_demand_mw)
    _openapi_value.max_demand_delay isa Absent ||
        push!(_openapi_output, "max_demand_delay" => _openapi_value.max_demand_delay)
    _openapi_value.max_demand_advance isa Absent ||
        push!(_openapi_output, "max_demand_advance" => _openapi_value.max_demand_advance)
    _openapi_value.demand_energy_efficiency isa Absent || push!(
        _openapi_output,
        "demand_energy_efficiency" => _openapi_value.demand_energy_efficiency,
    )
    _openapi_value.shift_variable_cost isa Absent ||
        push!(_openapi_output, "shift_variable_cost" => _openapi_value.shift_variable_cost)
    _openapi_value.curtailment_cost isa Absent ||
        push!(_openapi_output, "curtailment_cost" => _openapi_value.curtailment_cost)
    _openapi_value.max_demand_curtailment isa Absent || push!(
        _openapi_output,
        "max_demand_curtailment" => _openapi_value.max_demand_curtailment,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
