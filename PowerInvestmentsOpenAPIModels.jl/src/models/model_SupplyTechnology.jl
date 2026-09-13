"""
    SupplyTechnology

Candidate generation technology for a region, representing either a thermal or a renewable generation technology. It carries the capital and operating cost of new capacity together with the operating characteristics the added units take on — capacity limits, ramp and time limits, outage derating, fuel, and start-up fuel use.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `power_systems_type`: Corresponding type to be used in PCM modeling.
  - `region`: Location where the component applies. Can be a zone or node.
  - `prime_mover_type`: Prime mover for generator.
  - `fuel`: Fuel type according to IEA.
  - `cofire_start_limits`: Minimum and maximum blending level of each fuel during start-up process for multi-fuel generator. Units: 1.
  - `cofire_level_limits`: Minimum and maximum blending level of each fuel during normal generation process for multi-fuel generator. Units: 1.
  - `capital_costs`: Capital and interconnection cost for investing in a technology (capital cost in USD/MW).
  - `operation_costs`: Fixed and variable O&M costs for a technology. Units: USD/MWh.
  - `unit_size`: Used for discrete investment decisions. Size of each unit being built. Units: MW.
  - `capacity_limits`: Minimum and maximum allowable installed capacity for a technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MW.
  - `outage_factor`: Planned and forced outage factors for a technology, each a fraction of total availability (the fraction of hours in a year the technology is unavailable).
  - `min_generation_fraction`: Minimum generation as a fraction of total capacity. Units: 1.
  - `ramp_limits`: Maximum decrease and increase in output between operation periods. Units: MW/min.
  - `time_limits`: Minimum amount of time a resource has to stay in the committed or shutdown state (minutes). Units: min.
  - `start_fuel_mmbtu_per_mw`: Startup fuel use per MW of nameplate capacity of each generator. Units: MMBtu/MW.
  - `lifetime`: Maximum number of years a technology can be active once installed. Units: yr.
  - `financial_data`: Struct containing relevant financial information for a technology.
"""
Base.@kwdef struct SupplyTechnology <: APIModel
    id::Int64
    name::String
    available::Union{Absent, Bool, Nothing} = ABSENT
    power_systems_type::String
    region::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    prime_mover_type::Union{Absent, Nothing, PrimeMovers} = ABSENT
    fuel::Union{Absent, Nothing, Vector{ThermalFuels}} = ABSENT
    cofire_start_limits::Union{Absent, Nothing, MinMaxByKey} = ABSENT
    cofire_level_limits::Union{Absent, Nothing, MinMaxByKey} = ABSENT
    capital_costs::Union{Absent, CapitalCost, Nothing} = ABSENT
    operation_costs::Union{Absent, Nothing, SupplyTechnologyOperationCosts} = ABSENT
    unit_size::Union{Absent, Float64, Nothing} = ABSENT
    capacity_limits::Union{Absent, Nothing, SupplyTechnologyCapacityLimits} = ABSENT
    outage_factor::Union{Absent, Nothing, OutageFactors} = ABSENT
    min_generation_fraction::Union{Absent, Float64, Nothing} = ABSENT
    ramp_limits::Union{Absent, Nothing, UpDown} = ABSENT
    time_limits::Union{Absent, Nothing, UpDown} = ABSENT
    start_fuel_mmbtu_per_mw::Union{Absent, Float64, Nothing} = ABSENT
    lifetime::Union{Absent, Int64, Nothing} = ABSENT
    financial_data::TechnologyFinancialData
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SupplyTechnology}, value) = _decode(SupplyTechnology, value, true)
function _decode(::Type{SupplyTechnology}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-5ad640cfbd2532df977a.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SupplyTechnology";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SupplyTechnology")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "SupplyTechnology"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "SupplyTechnology"),
        _openapi_validate,
    )
    _openapi_field_available =
        haskey(_openapi_object, "available") ?
        _decode(
            Union{Absent, Bool, Nothing},
            _openapi_object["available"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_power_systems_type = _decode(
        String,
        _required(_openapi_object, "power_systems_type", "SupplyTechnology"),
        _openapi_validate,
    )
    _openapi_field_region =
        haskey(_openapi_object, "region") ?
        _decode(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["region"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_prime_mover_type =
        haskey(_openapi_object, "prime_mover_type") ?
        _decode(
            Union{Absent, Nothing, PrimeMovers},
            _openapi_object["prime_mover_type"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_fuel =
        haskey(_openapi_object, "fuel") ?
        _decode(
            Union{Absent, Nothing, Vector{ThermalFuels}},
            _openapi_object["fuel"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_cofire_start_limits =
        haskey(_openapi_object, "cofire_start_limits") ?
        _decode(
            Union{Absent, Nothing, MinMaxByKey},
            _openapi_object["cofire_start_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_cofire_level_limits =
        haskey(_openapi_object, "cofire_level_limits") ?
        _decode(
            Union{Absent, Nothing, MinMaxByKey},
            _openapi_object["cofire_level_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_capital_costs =
        haskey(_openapi_object, "capital_costs") ?
        _decode(
            Union{Absent, CapitalCost, Nothing},
            _openapi_object["capital_costs"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_operation_costs =
        haskey(_openapi_object, "operation_costs") ?
        _decode(
            Union{Absent, Nothing, SupplyTechnologyOperationCosts},
            _openapi_object["operation_costs"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_unit_size =
        haskey(_openapi_object, "unit_size") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["unit_size"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_capacity_limits =
        haskey(_openapi_object, "capacity_limits") ?
        _decode(
            Union{Absent, Nothing, SupplyTechnologyCapacityLimits},
            _openapi_object["capacity_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_outage_factor =
        haskey(_openapi_object, "outage_factor") ?
        _decode(
            Union{Absent, Nothing, OutageFactors},
            _openapi_object["outage_factor"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_min_generation_fraction =
        haskey(_openapi_object, "min_generation_fraction") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["min_generation_fraction"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_ramp_limits =
        haskey(_openapi_object, "ramp_limits") ?
        _decode(
            Union{Absent, Nothing, UpDown},
            _openapi_object["ramp_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_time_limits =
        haskey(_openapi_object, "time_limits") ?
        _decode(
            Union{Absent, Nothing, UpDown},
            _openapi_object["time_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_start_fuel_mmbtu_per_mw =
        haskey(_openapi_object, "start_fuel_mmbtu_per_mw") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["start_fuel_mmbtu_per_mw"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_lifetime =
        haskey(_openapi_object, "lifetime") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["lifetime"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_financial_data = _decode(
        TechnologyFinancialData,
        _required(_openapi_object, "financial_data", "SupplyTechnology"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "power_systems_type",
            "region",
            "prime_mover_type",
            "fuel",
            "cofire_start_limits",
            "cofire_level_limits",
            "capital_costs",
            "operation_costs",
            "unit_size",
            "capacity_limits",
            "outage_factor",
            "min_generation_fraction",
            "ramp_limits",
            "time_limits",
            "start_fuel_mmbtu_per_mw",
            "lifetime",
            "financial_data",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return SupplyTechnology(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        power_systems_type=_openapi_field_power_systems_type,
        region=_openapi_field_region,
        prime_mover_type=_openapi_field_prime_mover_type,
        fuel=_openapi_field_fuel,
        cofire_start_limits=_openapi_field_cofire_start_limits,
        cofire_level_limits=_openapi_field_cofire_level_limits,
        capital_costs=_openapi_field_capital_costs,
        operation_costs=_openapi_field_operation_costs,
        unit_size=_openapi_field_unit_size,
        capacity_limits=_openapi_field_capacity_limits,
        outage_factor=_openapi_field_outage_factor,
        min_generation_fraction=_openapi_field_min_generation_fraction,
        ramp_limits=_openapi_field_ramp_limits,
        time_limits=_openapi_field_time_limits,
        start_fuel_mmbtu_per_mw=_openapi_field_start_fuel_mmbtu_per_mw,
        lifetime=_openapi_field_lifetime,
        financial_data=_openapi_field_financial_data,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::SupplyTechnology)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.power_systems_type isa Absent ||
        (_openapi_output["power_systems_type"] = _encode(_openapi_value.power_systems_type))
    _openapi_value.region isa Absent ||
        (_openapi_output["region"] = _encode(_openapi_value.region))
    _openapi_value.prime_mover_type isa Absent ||
        (_openapi_output["prime_mover_type"] = _encode(_openapi_value.prime_mover_type))
    _openapi_value.fuel isa Absent ||
        (_openapi_output["fuel"] = _encode(_openapi_value.fuel))
    _openapi_value.cofire_start_limits isa Absent || (
        _openapi_output["cofire_start_limits"] =
            _encode(_openapi_value.cofire_start_limits)
    )
    _openapi_value.cofire_level_limits isa Absent || (
        _openapi_output["cofire_level_limits"] =
            _encode(_openapi_value.cofire_level_limits)
    )
    _openapi_value.capital_costs isa Absent ||
        (_openapi_output["capital_costs"] = _encode(_openapi_value.capital_costs))
    _openapi_value.operation_costs isa Absent ||
        (_openapi_output["operation_costs"] = _encode(_openapi_value.operation_costs))
    _openapi_value.unit_size isa Absent ||
        (_openapi_output["unit_size"] = _encode(_openapi_value.unit_size))
    _openapi_value.capacity_limits isa Absent ||
        (_openapi_output["capacity_limits"] = _encode(_openapi_value.capacity_limits))
    _openapi_value.outage_factor isa Absent ||
        (_openapi_output["outage_factor"] = _encode(_openapi_value.outage_factor))
    _openapi_value.min_generation_fraction isa Absent || (
        _openapi_output["min_generation_fraction"] =
            _encode(_openapi_value.min_generation_fraction)
    )
    _openapi_value.ramp_limits isa Absent ||
        (_openapi_output["ramp_limits"] = _encode(_openapi_value.ramp_limits))
    _openapi_value.time_limits isa Absent ||
        (_openapi_output["time_limits"] = _encode(_openapi_value.time_limits))
    _openapi_value.start_fuel_mmbtu_per_mw isa Absent || (
        _openapi_output["start_fuel_mmbtu_per_mw"] =
            _encode(_openapi_value.start_fuel_mmbtu_per_mw)
    )
    _openapi_value.lifetime isa Absent ||
        (_openapi_output["lifetime"] = _encode(_openapi_value.lifetime))
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
            resource="https://openapi.invalid/schema/external-5ad640cfbd2532df977a.json",
            pointer="",
        ),
        _openapi_output,
        "encoding SupplyTechnology";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::SupplyTechnology)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.power_systems_type isa Absent ||
        push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.region isa Absent ||
        push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.prime_mover_type isa Absent ||
        push!(_openapi_output, "prime_mover_type" => _openapi_value.prime_mover_type)
    _openapi_value.fuel isa Absent || push!(_openapi_output, "fuel" => _openapi_value.fuel)
    _openapi_value.cofire_start_limits isa Absent ||
        push!(_openapi_output, "cofire_start_limits" => _openapi_value.cofire_start_limits)
    _openapi_value.cofire_level_limits isa Absent ||
        push!(_openapi_output, "cofire_level_limits" => _openapi_value.cofire_level_limits)
    _openapi_value.capital_costs isa Absent ||
        push!(_openapi_output, "capital_costs" => _openapi_value.capital_costs)
    _openapi_value.operation_costs isa Absent ||
        push!(_openapi_output, "operation_costs" => _openapi_value.operation_costs)
    _openapi_value.unit_size isa Absent ||
        push!(_openapi_output, "unit_size" => _openapi_value.unit_size)
    _openapi_value.capacity_limits isa Absent ||
        push!(_openapi_output, "capacity_limits" => _openapi_value.capacity_limits)
    _openapi_value.outage_factor isa Absent ||
        push!(_openapi_output, "outage_factor" => _openapi_value.outage_factor)
    _openapi_value.min_generation_fraction isa Absent || push!(
        _openapi_output,
        "min_generation_fraction" => _openapi_value.min_generation_fraction,
    )
    _openapi_value.ramp_limits isa Absent ||
        push!(_openapi_output, "ramp_limits" => _openapi_value.ramp_limits)
    _openapi_value.time_limits isa Absent ||
        push!(_openapi_output, "time_limits" => _openapi_value.time_limits)
    _openapi_value.start_fuel_mmbtu_per_mw isa Absent || push!(
        _openapi_output,
        "start_fuel_mmbtu_per_mw" => _openapi_value.start_fuel_mmbtu_per_mw,
    )
    _openapi_value.lifetime isa Absent ||
        push!(_openapi_output, "lifetime" => _openapi_value.lifetime)
    _openapi_value.financial_data isa Absent ||
        push!(_openapi_output, "financial_data" => _openapi_value.financial_data)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
