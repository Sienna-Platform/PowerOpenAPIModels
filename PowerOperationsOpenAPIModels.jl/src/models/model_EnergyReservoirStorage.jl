"""
    EnergyReservoirStorage

An energy storage device, modeled as a generic energy reservoir.

This is suitable for modeling storage charging and discharging with average efficiency losses, ignoring the physical dynamics of the storage unit. A variety of energy storage types and chemistries can be modeled with this approach. For pumped hydro storage, alternatively see `HydroPumpTurbine` and `HydroReservoir`.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `bus`: ID of the bus that this component is connected to.
  - `prime_mover_type`: Prime mover technology according to EIA 923.
  - `storage_technology_type`: Storage Technology Complementary to EIA 923.
  - `storage_capacity`: Maximum storage capacity (can be in units of, e.g., MWh for batteries or liters for hydrogen). Divided by base_power this gives an approximate duration, assuming unity power factor: in hours under MWH, in minutes under MWMIN. Units: per energy_units — MWH: MWh, MWMIN: MWmin .
  - `energy_units`: Unit basis for `storage_capacity`. MWH is the default interchange form; MWMIN records the same energy on the minutes basis used by operational durations.
  - `storage_level_limits`: Minimum and maximum allowable storage levels [0, 1], which can be used to model derates or other restrictions, such as state-of-charge restrictions on battery cycling.
  - `initial_storage_capacity_level`: Initial storage capacity level as a ratio [0, 1.0] of `storage_capacity`. Units: 1.
  - `rating`: Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `active_power`: Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `input_active_power_limits`: Minimum and maximum limits on the input active power (i.e., charging). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `output_active_power_limits`: Minimum and maximum limits on the output active power (i.e., discharging). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `efficiency`: Average efficiency [0, 1] `in` (charging/filling) and `out` (discharging/consuming) of the storage system.
  - `reactive_power`: Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `base_power`: Base power of the unit for per unitization. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `operation_cost`: Operating cost of storage. or MarketBidCost
  - `conversion_factor`: Conversion factor of `storage_capacity` to MWh, if different than 1.0. For example, X MWh/liter hydrogen. Units: 1.
  - `storage_target`: Storage target at the end of simulation as ratio of storage capacity. Units: 1.
  - `cycle_limits`: Storage Maximum number of cycles per year. Units: 1.
  - `ramp_limits`: Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min .
  - `self_discharge`: Self-discharge (leakage loss) as a fraction of the stored energy lost per minute (pu/min of storage_capacity), modeled as E[t] = (1 - self_discharge * dt) * E[t-1]; dt must be on the same minutes basis. Units: 1/min.
  - `standing_loss`: Constant standing-loss power drawn by the storage system. Reduces the effective charging power (p_in - standing_loss) and increases the power drawn from the storage when discharging (p_out + standing_loss). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `dynamic_injector`: ID of the corresponding dynamic injection device, if any.
"""
Base.@kwdef struct EnergyReservoirStorage <: APIModel
    id::Int64
    name::String
    available::Bool
    bus::Int64
    prime_mover_type::PrimeMovers
    storage_technology_type::StorageTech
    storage_capacity::Float64
    energy_units::Union{Absent, EnergyUnitBasis, Nothing} = ABSENT
    storage_level_limits::MinMax
    initial_storage_capacity_level::Float64
    rating::Float64
    active_power::Float64
    input_active_power_limits::MinMax
    output_active_power_limits::MinMax
    efficiency::InOut
    reactive_power::Float64
    reactive_power_limits::Union{Absent, MinMax, Nothing} = ABSENT
    base_power::Float64
    power_units::UnitSystem
    operation_cost::EnergyReservoirStorageOperationCost
    conversion_factor::Union{Absent, Float64, Nothing} = ABSENT
    storage_target::Union{Absent, Float64, Nothing} = ABSENT
    cycle_limits::Union{Absent, Int64, Nothing} = ABSENT
    ramp_limits::Union{Absent, UpDown, Nothing} = ABSENT
    self_discharge::Union{Absent, Float64, Nothing} = ABSENT
    standing_loss::Union{Absent, Float64, Nothing} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{EnergyReservoirStorage}, value) =
    _decode(EnergyReservoirStorage, value, true)
function _decode(::Type{EnergyReservoirStorage}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a9b38ed187600ed9866c.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding EnergyReservoirStorage";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "EnergyReservoirStorage")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_bus = _decode(
        Int64,
        _required(_openapi_object, "bus", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_prime_mover_type = _decode(
        PrimeMovers,
        _required(_openapi_object, "prime_mover_type", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_storage_technology_type = _decode(
        StorageTech,
        _required(_openapi_object, "storage_technology_type", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_storage_capacity = _decode(
        Float64,
        _required(_openapi_object, "storage_capacity", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_energy_units =
        haskey(_openapi_object, "energy_units") ?
        _decode(
            Union{Absent, EnergyUnitBasis, Nothing},
            _openapi_object["energy_units"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_storage_level_limits = _decode(
        MinMax,
        _required(_openapi_object, "storage_level_limits", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_initial_storage_capacity_level = _decode(
        Float64,
        _required(
            _openapi_object,
            "initial_storage_capacity_level",
            "EnergyReservoirStorage",
        ),
        _openapi_validate,
    )
    _openapi_field_rating = _decode(
        Float64,
        _required(_openapi_object, "rating", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_active_power = _decode(
        Float64,
        _required(_openapi_object, "active_power", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_input_active_power_limits = _decode(
        MinMax,
        _required(_openapi_object, "input_active_power_limits", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_output_active_power_limits = _decode(
        MinMax,
        _required(_openapi_object, "output_active_power_limits", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_efficiency = _decode(
        InOut,
        _required(_openapi_object, "efficiency", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "reactive_power", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_reactive_power_limits =
        haskey(_openapi_object, "reactive_power_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["reactive_power_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_operation_cost = _decode(
        EnergyReservoirStorageOperationCost,
        _required(_openapi_object, "operation_cost", "EnergyReservoirStorage"),
        _openapi_validate,
    )
    _openapi_field_conversion_factor =
        haskey(_openapi_object, "conversion_factor") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["conversion_factor"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_storage_target =
        haskey(_openapi_object, "storage_target") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["storage_target"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_cycle_limits =
        haskey(_openapi_object, "cycle_limits") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["cycle_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_ramp_limits =
        haskey(_openapi_object, "ramp_limits") ?
        _decode(
            Union{Absent, UpDown, Nothing},
            _openapi_object["ramp_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_self_discharge =
        haskey(_openapi_object, "self_discharge") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["self_discharge"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_standing_loss =
        haskey(_openapi_object, "standing_loss") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["standing_loss"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_dynamic_injector =
        haskey(_openapi_object, "dynamic_injector") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["dynamic_injector"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "bus",
            "prime_mover_type",
            "storage_technology_type",
            "storage_capacity",
            "energy_units",
            "storage_level_limits",
            "initial_storage_capacity_level",
            "rating",
            "active_power",
            "input_active_power_limits",
            "output_active_power_limits",
            "efficiency",
            "reactive_power",
            "reactive_power_limits",
            "base_power",
            "power_units",
            "operation_cost",
            "conversion_factor",
            "storage_target",
            "cycle_limits",
            "ramp_limits",
            "self_discharge",
            "standing_loss",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return EnergyReservoirStorage(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        bus=_openapi_field_bus,
        prime_mover_type=_openapi_field_prime_mover_type,
        storage_technology_type=_openapi_field_storage_technology_type,
        storage_capacity=_openapi_field_storage_capacity,
        energy_units=_openapi_field_energy_units,
        storage_level_limits=_openapi_field_storage_level_limits,
        initial_storage_capacity_level=_openapi_field_initial_storage_capacity_level,
        rating=_openapi_field_rating,
        active_power=_openapi_field_active_power,
        input_active_power_limits=_openapi_field_input_active_power_limits,
        output_active_power_limits=_openapi_field_output_active_power_limits,
        efficiency=_openapi_field_efficiency,
        reactive_power=_openapi_field_reactive_power,
        reactive_power_limits=_openapi_field_reactive_power_limits,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        operation_cost=_openapi_field_operation_cost,
        conversion_factor=_openapi_field_conversion_factor,
        storage_target=_openapi_field_storage_target,
        cycle_limits=_openapi_field_cycle_limits,
        ramp_limits=_openapi_field_ramp_limits,
        self_discharge=_openapi_field_self_discharge,
        standing_loss=_openapi_field_standing_loss,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::EnergyReservoirStorage)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.prime_mover_type isa Absent ||
        (_openapi_output["prime_mover_type"] = _encode(_openapi_value.prime_mover_type))
    _openapi_value.storage_technology_type isa Absent || (
        _openapi_output["storage_technology_type"] =
            _encode(_openapi_value.storage_technology_type)
    )
    _openapi_value.storage_capacity isa Absent ||
        (_openapi_output["storage_capacity"] = _encode(_openapi_value.storage_capacity))
    _openapi_value.energy_units isa Absent ||
        (_openapi_output["energy_units"] = _encode(_openapi_value.energy_units))
    _openapi_value.storage_level_limits isa Absent || (
        _openapi_output["storage_level_limits"] =
            _encode(_openapi_value.storage_level_limits)
    )
    _openapi_value.initial_storage_capacity_level isa Absent || (
        _openapi_output["initial_storage_capacity_level"] =
            _encode(_openapi_value.initial_storage_capacity_level)
    )
    _openapi_value.rating isa Absent ||
        (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.active_power isa Absent ||
        (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.input_active_power_limits isa Absent || (
        _openapi_output["input_active_power_limits"] =
            _encode(_openapi_value.input_active_power_limits)
    )
    _openapi_value.output_active_power_limits isa Absent || (
        _openapi_output["output_active_power_limits"] =
            _encode(_openapi_value.output_active_power_limits)
    )
    _openapi_value.efficiency isa Absent ||
        (_openapi_output["efficiency"] = _encode(_openapi_value.efficiency))
    _openapi_value.reactive_power isa Absent ||
        (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    _openapi_value.reactive_power_limits isa Absent || (
        _openapi_output["reactive_power_limits"] =
            _encode(_openapi_value.reactive_power_limits)
    )
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.operation_cost isa Absent ||
        (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.conversion_factor isa Absent ||
        (_openapi_output["conversion_factor"] = _encode(_openapi_value.conversion_factor))
    _openapi_value.storage_target isa Absent ||
        (_openapi_output["storage_target"] = _encode(_openapi_value.storage_target))
    _openapi_value.cycle_limits isa Absent ||
        (_openapi_output["cycle_limits"] = _encode(_openapi_value.cycle_limits))
    _openapi_value.ramp_limits isa Absent ||
        (_openapi_output["ramp_limits"] = _encode(_openapi_value.ramp_limits))
    _openapi_value.self_discharge isa Absent ||
        (_openapi_output["self_discharge"] = _encode(_openapi_value.self_discharge))
    _openapi_value.standing_loss isa Absent ||
        (_openapi_output["standing_loss"] = _encode(_openapi_value.standing_loss))
    _openapi_value.dynamic_injector isa Absent ||
        (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
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
            resource="https://openapi.invalid/schema/external-a9b38ed187600ed9866c.json",
            pointer="",
        ),
        _openapi_output,
        "encoding EnergyReservoirStorage";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::EnergyReservoirStorage)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.prime_mover_type isa Absent ||
        push!(_openapi_output, "prime_mover_type" => _openapi_value.prime_mover_type)
    _openapi_value.storage_technology_type isa Absent || push!(
        _openapi_output,
        "storage_technology_type" => _openapi_value.storage_technology_type,
    )
    _openapi_value.storage_capacity isa Absent ||
        push!(_openapi_output, "storage_capacity" => _openapi_value.storage_capacity)
    _openapi_value.energy_units isa Absent ||
        push!(_openapi_output, "energy_units" => _openapi_value.energy_units)
    _openapi_value.storage_level_limits isa Absent || push!(
        _openapi_output,
        "storage_level_limits" => _openapi_value.storage_level_limits,
    )
    _openapi_value.initial_storage_capacity_level isa Absent || push!(
        _openapi_output,
        "initial_storage_capacity_level" =>
            _openapi_value.initial_storage_capacity_level,
    )
    _openapi_value.rating isa Absent ||
        push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.active_power isa Absent ||
        push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.input_active_power_limits isa Absent || push!(
        _openapi_output,
        "input_active_power_limits" => _openapi_value.input_active_power_limits,
    )
    _openapi_value.output_active_power_limits isa Absent || push!(
        _openapi_output,
        "output_active_power_limits" => _openapi_value.output_active_power_limits,
    )
    _openapi_value.efficiency isa Absent ||
        push!(_openapi_output, "efficiency" => _openapi_value.efficiency)
    _openapi_value.reactive_power isa Absent ||
        push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.reactive_power_limits isa Absent || push!(
        _openapi_output,
        "reactive_power_limits" => _openapi_value.reactive_power_limits,
    )
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.operation_cost isa Absent ||
        push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.conversion_factor isa Absent ||
        push!(_openapi_output, "conversion_factor" => _openapi_value.conversion_factor)
    _openapi_value.storage_target isa Absent ||
        push!(_openapi_output, "storage_target" => _openapi_value.storage_target)
    _openapi_value.cycle_limits isa Absent ||
        push!(_openapi_output, "cycle_limits" => _openapi_value.cycle_limits)
    _openapi_value.ramp_limits isa Absent ||
        push!(_openapi_output, "ramp_limits" => _openapi_value.ramp_limits)
    _openapi_value.self_discharge isa Absent ||
        push!(_openapi_output, "self_discharge" => _openapi_value.self_discharge)
    _openapi_value.standing_loss isa Absent ||
        push!(_openapi_output, "standing_loss" => _openapi_value.standing_loss)
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
