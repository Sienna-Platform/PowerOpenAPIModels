"""
    ProjectedDemand

A projected demand in a region: an exogenous load profile that must be served, with optional voluntary curtailment and time shifting. A demand with existing loads in the base system takes its peak from them and grows from the base year; a new demand starts in its construction year at `peak_demand_mw`. Conforming demands grow by `growth_rate`. Curtailment up to `max_demand_curtailment` is priced by `curtailment_cost`, and the rest of the demand by `value_of_lost_load`.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `power_systems_type`: Corresponding type to be used in PCM modeling.
  - `region`: Location where the component applies. Can be a zone or node.
  - `peak_demand_mw`: Peak demand. Demands with existing loads in the base system derive their peak demand from those loads, not from this value. Units: MW.
  - `construction_year`: The year in which a new demand starts. Should only be used for new demands.
  - `growth_rate`: The annual growth rate of the demand, used to scale present-day loads into future projections. Only used for conforming demands. Units: 1.
  - `conformity`: Whether the demand is conforming (grows by `growth_rate`) or non-conforming (does not grow). Must be set for new demands.
  - `max_demand_curtailment`: Maximum fraction of demand that can be curtailed voluntarily. Units: 1.
  - `curtailment_cost`: Cost of voluntary curtailment. A linear curve is a single price for all curtailable demand; a piecewise incremental curve gives tiers whose x coordinates are fractions of demand, from 0 to `max_demand_curtailment`, and whose slopes are prices. Units: USD/MWh.
  - `value_of_lost_load`: Cost of involuntary shedding of the demand that cannot be curtailed. Units: USD/MWh.
  - `flexible_fraction`: Fraction of demand that can be shifted in time. Units: 1.
  - `max_demand_delay`: Maximum time that flexible demand can be delayed. Units: min.
  - `max_demand_advance`: Maximum time that flexible demand can be served in advance. Units: min.
  - `shift_efficiency`: Fraction of shifted energy that is kept. Represents energy losses due to time shifting. Units: 1.
  - `shift_cost`: Cost of shifting demand, per MWh shifted. Units: USD/MWh.
"""
Base.@kwdef struct ProjectedDemand <: APIModel
    id::Int64
    name::String
    available::Union{Absent, Bool, Nothing} = ABSENT
    power_systems_type::String
    region::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    peak_demand_mw::Union{Absent, Float64, Nothing} = ABSENT
    construction_year::Union{Absent, Int64, Nothing} = ABSENT
    growth_rate::Union{Absent, Float64, Nothing} = ABSENT
    conformity::Union{Absent, Nothing, String} = ABSENT
    max_demand_curtailment::Union{Absent, Float64, Nothing} = ABSENT
    curtailment_cost::Union{Absent, Nothing, ProjectedDemandCurtailmentCost} = ABSENT
    value_of_lost_load::Union{Absent, Float64, Nothing} = ABSENT
    flexible_fraction::Union{Absent, Float64, Nothing} = ABSENT
    max_demand_delay::Union{Absent, Float64, Nothing} = ABSENT
    max_demand_advance::Union{Absent, Float64, Nothing} = ABSENT
    shift_efficiency::Union{Absent, Float64, Nothing} = ABSENT
    shift_cost::Union{Absent, Nothing, ProjectedDemandShiftCost} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ProjectedDemand}, value) = _decode(ProjectedDemand, value, true)
function _decode(::Type{ProjectedDemand}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-f9ab7078fc2ea0e1c154.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ProjectedDemand";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ProjectedDemand")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "ProjectedDemand"), false)
    _openapi_field_name =
        _decode_zoned(String, _required(_openapi_object, "name", "ProjectedDemand"), false)
    _openapi_field_available =
        haskey(_openapi_object, "available") ?
        _decode_zoned(Union{Absent, Bool, Nothing}, _openapi_object["available"], false) :
        ABSENT
    _openapi_field_power_systems_type = _decode_zoned(
        String,
        _required(_openapi_object, "power_systems_type", "ProjectedDemand"),
        false,
    )
    _openapi_field_region =
        haskey(_openapi_object, "region") ?
        _decode_zoned(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["region"],
            false,
        ) : ABSENT
    _openapi_field_peak_demand_mw =
        haskey(_openapi_object, "peak_demand_mw") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["peak_demand_mw"],
            false,
        ) : ABSENT
    _openapi_field_construction_year =
        haskey(_openapi_object, "construction_year") ?
        _decode_zoned(
            Union{Absent, Int64, Nothing},
            _openapi_object["construction_year"],
            false,
        ) : ABSENT
    _openapi_field_growth_rate =
        haskey(_openapi_object, "growth_rate") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["growth_rate"],
            false,
        ) : ABSENT
    _openapi_field_conformity =
        haskey(_openapi_object, "conformity") ?
        _decode_zoned(
            Union{Absent, Nothing, String},
            _openapi_object["conformity"],
            false,
        ) : ABSENT
    _openapi_field_max_demand_curtailment =
        haskey(_openapi_object, "max_demand_curtailment") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_demand_curtailment"],
            false,
        ) : ABSENT
    _openapi_field_curtailment_cost =
        haskey(_openapi_object, "curtailment_cost") ?
        _decode_zoned(
            Union{Absent, Nothing, ProjectedDemandCurtailmentCost},
            _openapi_object["curtailment_cost"],
            false,
        ) : ABSENT
    _openapi_field_value_of_lost_load =
        haskey(_openapi_object, "value_of_lost_load") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["value_of_lost_load"],
            false,
        ) : ABSENT
    _openapi_field_flexible_fraction =
        haskey(_openapi_object, "flexible_fraction") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["flexible_fraction"],
            false,
        ) : ABSENT
    _openapi_field_max_demand_delay =
        haskey(_openapi_object, "max_demand_delay") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_demand_delay"],
            false,
        ) : ABSENT
    _openapi_field_max_demand_advance =
        haskey(_openapi_object, "max_demand_advance") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_demand_advance"],
            false,
        ) : ABSENT
    _openapi_field_shift_efficiency =
        haskey(_openapi_object, "shift_efficiency") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["shift_efficiency"],
            false,
        ) : ABSENT
    _openapi_field_shift_cost =
        haskey(_openapi_object, "shift_cost") ?
        _decode_zoned(
            Union{Absent, Nothing, ProjectedDemandShiftCost},
            _openapi_object["shift_cost"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "power_systems_type",
            "region",
            "peak_demand_mw",
            "construction_year",
            "growth_rate",
            "conformity",
            "max_demand_curtailment",
            "curtailment_cost",
            "value_of_lost_load",
            "flexible_fraction",
            "max_demand_delay",
            "max_demand_advance",
            "shift_efficiency",
            "shift_cost",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return ProjectedDemand(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        power_systems_type=_openapi_field_power_systems_type,
        region=_openapi_field_region,
        peak_demand_mw=_openapi_field_peak_demand_mw,
        construction_year=_openapi_field_construction_year,
        growth_rate=_openapi_field_growth_rate,
        conformity=_openapi_field_conformity,
        max_demand_curtailment=_openapi_field_max_demand_curtailment,
        curtailment_cost=_openapi_field_curtailment_cost,
        value_of_lost_load=_openapi_field_value_of_lost_load,
        flexible_fraction=_openapi_field_flexible_fraction,
        max_demand_delay=_openapi_field_max_demand_delay,
        max_demand_advance=_openapi_field_max_demand_advance,
        shift_efficiency=_openapi_field_shift_efficiency,
        shift_cost=_openapi_field_shift_cost,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ProjectedDemand)
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
    _openapi_value.peak_demand_mw isa Absent || (
        _openapi_output["peak_demand_mw"] =
            _encode_unvalidated(_openapi_value.peak_demand_mw)
    )
    _openapi_value.construction_year isa Absent || (
        _openapi_output["construction_year"] =
            _encode_unvalidated(_openapi_value.construction_year)
    )
    _openapi_value.growth_rate isa Absent ||
        (_openapi_output["growth_rate"] = _encode_unvalidated(_openapi_value.growth_rate))
    _openapi_value.conformity isa Absent ||
        (_openapi_output["conformity"] = _encode_unvalidated(_openapi_value.conformity))
    _openapi_value.max_demand_curtailment isa Absent || (
        _openapi_output["max_demand_curtailment"] =
            _encode_unvalidated(_openapi_value.max_demand_curtailment)
    )
    _openapi_value.curtailment_cost isa Absent || (
        _openapi_output["curtailment_cost"] =
            _encode_unvalidated(_openapi_value.curtailment_cost)
    )
    _openapi_value.value_of_lost_load isa Absent || (
        _openapi_output["value_of_lost_load"] =
            _encode_unvalidated(_openapi_value.value_of_lost_load)
    )
    _openapi_value.flexible_fraction isa Absent || (
        _openapi_output["flexible_fraction"] =
            _encode_unvalidated(_openapi_value.flexible_fraction)
    )
    _openapi_value.max_demand_delay isa Absent || (
        _openapi_output["max_demand_delay"] =
            _encode_unvalidated(_openapi_value.max_demand_delay)
    )
    _openapi_value.max_demand_advance isa Absent || (
        _openapi_output["max_demand_advance"] =
            _encode_unvalidated(_openapi_value.max_demand_advance)
    )
    _openapi_value.shift_efficiency isa Absent || (
        _openapi_output["shift_efficiency"] =
            _encode_unvalidated(_openapi_value.shift_efficiency)
    )
    _openapi_value.shift_cost isa Absent ||
        (_openapi_output["shift_cost"] = _encode_unvalidated(_openapi_value.shift_cost))
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
_encode(_openapi_value::ProjectedDemand) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-f9ab7078fc2ea0e1c154.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ProjectedDemand";
    direction=:neutral,
)

function _form_fields(_openapi_value::ProjectedDemand)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.power_systems_type isa Absent ||
        push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.region isa Absent ||
        push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.peak_demand_mw isa Absent ||
        push!(_openapi_output, "peak_demand_mw" => _openapi_value.peak_demand_mw)
    _openapi_value.construction_year isa Absent ||
        push!(_openapi_output, "construction_year" => _openapi_value.construction_year)
    _openapi_value.growth_rate isa Absent ||
        push!(_openapi_output, "growth_rate" => _openapi_value.growth_rate)
    _openapi_value.conformity isa Absent ||
        push!(_openapi_output, "conformity" => _openapi_value.conformity)
    _openapi_value.max_demand_curtailment isa Absent || push!(
        _openapi_output,
        "max_demand_curtailment" => _openapi_value.max_demand_curtailment,
    )
    _openapi_value.curtailment_cost isa Absent ||
        push!(_openapi_output, "curtailment_cost" => _openapi_value.curtailment_cost)
    _openapi_value.value_of_lost_load isa Absent ||
        push!(_openapi_output, "value_of_lost_load" => _openapi_value.value_of_lost_load)
    _openapi_value.flexible_fraction isa Absent ||
        push!(_openapi_output, "flexible_fraction" => _openapi_value.flexible_fraction)
    _openapi_value.max_demand_delay isa Absent ||
        push!(_openapi_output, "max_demand_delay" => _openapi_value.max_demand_delay)
    _openapi_value.max_demand_advance isa Absent ||
        push!(_openapi_output, "max_demand_advance" => _openapi_value.max_demand_advance)
    _openapi_value.shift_efficiency isa Absent ||
        push!(_openapi_output, "shift_efficiency" => _openapi_value.shift_efficiency)
    _openapi_value.shift_cost isa Absent ||
        push!(_openapi_output, "shift_cost" => _openapi_value.shift_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
