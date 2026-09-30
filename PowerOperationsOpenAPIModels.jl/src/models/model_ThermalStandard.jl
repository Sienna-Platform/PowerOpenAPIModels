"""
    ThermalStandard

A thermal generator, such as a fossil fuel and nuclear generator.

This is a standard representation with options to include a minimum up time, minimum down time, and ramp limits. For a more detailed representation of the start-up and shut-down processes, including hot starts, see `ThermalMultiStart`.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `status`: Operating state of the unit at the start of a simulation.
  - `commitment_mode`: Commitment mode of the unit.
  - `bus`: ID of the bus that this component is connected to.
  - `active_power`: Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power`: Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `rating`: Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `active_power_limits`: Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `ramp_limits`: Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min .
  - `operation_cost`: Operating cost of generation, or a MarketBidCost.
  - `base_power`: Base power of the unit for per unitization. Must be positive; a zero base would make per-unit conversion undefined. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `time_limits`: Minimum up and minimum down time limits. Units: min.
  - `prime_mover_type`: Prime mover technology according to EIA 923.
  - `fuel`: Prime mover fuel according to EIA 923.
  - `time_at_status`: Time the generator has been in its current status. Units: min.
  - `dynamic_injector`: ID of the corresponding dynamic injection device, if any.
"""
Base.@kwdef struct ThermalStandard <: APIModel
    id::Int64
    name::String
    available::Bool
    status::OperationalStates
    commitment_mode::Union{Absent, CommitmentModes, Nothing} = ABSENT
    bus::Int64
    active_power::Float64
    reactive_power::Float64
    rating::Float64
    active_power_limits::MinMax
    reactive_power_limits::Union{Absent, Nothing, MinMax} = ABSENT
    ramp_limits::Union{Absent, Nothing, UpDown} = ABSENT
    operation_cost::ThermalStandardOperationCost
    base_power::Float64
    power_units::UnitSystem
    time_limits::Union{Absent, Nothing, UpDown} = ABSENT
    prime_mover_type::Union{Absent, Nothing, PrimeMovers} = ABSENT
    fuel::Union{Absent, Nothing, ThermalFuels} = ABSENT
    time_at_status::Union{Absent, Float64, Nothing} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ThermalStandard}, value) = _decode(ThermalStandard, value, true)
function _decode(::Type{ThermalStandard}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-06e8554569aace394570.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ThermalStandard";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ThermalStandard")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ThermalStandard"), false)
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "ThermalStandard"), false)
    _openapi_field_available =
        _decode(Bool, _required(_openapi_object, "available", "ThermalStandard"), false)
    _openapi_field_status = _decode(
        OperationalStates,
        _required(_openapi_object, "status", "ThermalStandard"),
        false,
    )
    _openapi_field_commitment_mode =
        haskey(_openapi_object, "commitment_mode") ?
        _decode(
            Union{Absent, CommitmentModes, Nothing},
            _openapi_object["commitment_mode"],
            false,
        ) : ABSENT
    _openapi_field_bus =
        _decode(Int64, _required(_openapi_object, "bus", "ThermalStandard"), false)
    _openapi_field_active_power = _decode(
        Float64,
        _required(_openapi_object, "active_power", "ThermalStandard"),
        false,
    )
    _openapi_field_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "reactive_power", "ThermalStandard"),
        false,
    )
    _openapi_field_rating =
        _decode(Float64, _required(_openapi_object, "rating", "ThermalStandard"), false)
    _openapi_field_active_power_limits = _decode(
        MinMax,
        _required(_openapi_object, "active_power_limits", "ThermalStandard"),
        false,
    )
    _openapi_field_reactive_power_limits =
        haskey(_openapi_object, "reactive_power_limits") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["reactive_power_limits"],
            false,
        ) : ABSENT
    _openapi_field_ramp_limits =
        haskey(_openapi_object, "ramp_limits") ?
        _decode(Union{Absent, Nothing, UpDown}, _openapi_object["ramp_limits"], false) :
        ABSENT
    _openapi_field_operation_cost = _decode(
        ThermalStandardOperationCost,
        _required(_openapi_object, "operation_cost", "ThermalStandard"),
        false,
    )
    _openapi_field_base_power =
        _decode(Float64, _required(_openapi_object, "base_power", "ThermalStandard"), false)
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "ThermalStandard"),
        false,
    )
    _openapi_field_time_limits =
        haskey(_openapi_object, "time_limits") ?
        _decode(Union{Absent, Nothing, UpDown}, _openapi_object["time_limits"], false) :
        ABSENT
    _openapi_field_prime_mover_type =
        haskey(_openapi_object, "prime_mover_type") ?
        _decode(
            Union{Absent, Nothing, PrimeMovers},
            _openapi_object["prime_mover_type"],
            false,
        ) : ABSENT
    _openapi_field_fuel =
        haskey(_openapi_object, "fuel") ?
        _decode(Union{Absent, Nothing, ThermalFuels}, _openapi_object["fuel"], false) :
        ABSENT
    _openapi_field_time_at_status =
        haskey(_openapi_object, "time_at_status") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["time_at_status"], false) :
        ABSENT
    _openapi_field_dynamic_injector =
        haskey(_openapi_object, "dynamic_injector") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["dynamic_injector"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "status",
            "commitment_mode",
            "bus",
            "active_power",
            "reactive_power",
            "rating",
            "active_power_limits",
            "reactive_power_limits",
            "ramp_limits",
            "operation_cost",
            "base_power",
            "power_units",
            "time_limits",
            "prime_mover_type",
            "fuel",
            "time_at_status",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return ThermalStandard(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        status=_openapi_field_status,
        commitment_mode=_openapi_field_commitment_mode,
        bus=_openapi_field_bus,
        active_power=_openapi_field_active_power,
        reactive_power=_openapi_field_reactive_power,
        rating=_openapi_field_rating,
        active_power_limits=_openapi_field_active_power_limits,
        reactive_power_limits=_openapi_field_reactive_power_limits,
        ramp_limits=_openapi_field_ramp_limits,
        operation_cost=_openapi_field_operation_cost,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        time_limits=_openapi_field_time_limits,
        prime_mover_type=_openapi_field_prime_mover_type,
        fuel=_openapi_field_fuel,
        time_at_status=_openapi_field_time_at_status,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ThermalStandard)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.status isa Absent ||
        (_openapi_output["status"] = _encode_unvalidated(_openapi_value.status))
    _openapi_value.commitment_mode isa Absent || (
        _openapi_output["commitment_mode"] =
            _encode_unvalidated(_openapi_value.commitment_mode)
    )
    _openapi_value.bus isa Absent ||
        (_openapi_output["bus"] = _encode_unvalidated(_openapi_value.bus))
    _openapi_value.active_power isa Absent ||
        (_openapi_output["active_power"] = _encode_unvalidated(_openapi_value.active_power))
    _openapi_value.reactive_power isa Absent || (
        _openapi_output["reactive_power"] =
            _encode_unvalidated(_openapi_value.reactive_power)
    )
    _openapi_value.rating isa Absent ||
        (_openapi_output["rating"] = _encode_unvalidated(_openapi_value.rating))
    _openapi_value.active_power_limits isa Absent || (
        _openapi_output["active_power_limits"] =
            _encode_unvalidated(_openapi_value.active_power_limits)
    )
    _openapi_value.reactive_power_limits isa Absent || (
        _openapi_output["reactive_power_limits"] =
            _encode_unvalidated(_openapi_value.reactive_power_limits)
    )
    _openapi_value.ramp_limits isa Absent ||
        (_openapi_output["ramp_limits"] = _encode_unvalidated(_openapi_value.ramp_limits))
    _openapi_value.operation_cost isa Absent || (
        _openapi_output["operation_cost"] =
            _encode_unvalidated(_openapi_value.operation_cost)
    )
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode_unvalidated(_openapi_value.power_units))
    _openapi_value.time_limits isa Absent ||
        (_openapi_output["time_limits"] = _encode_unvalidated(_openapi_value.time_limits))
    _openapi_value.prime_mover_type isa Absent || (
        _openapi_output["prime_mover_type"] =
            _encode_unvalidated(_openapi_value.prime_mover_type)
    )
    _openapi_value.fuel isa Absent ||
        (_openapi_output["fuel"] = _encode_unvalidated(_openapi_value.fuel))
    _openapi_value.time_at_status isa Absent || (
        _openapi_output["time_at_status"] =
            _encode_unvalidated(_openapi_value.time_at_status)
    )
    _openapi_value.dynamic_injector isa Absent || (
        _openapi_output["dynamic_injector"] =
            _encode_unvalidated(_openapi_value.dynamic_injector)
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
_encode(_openapi_value::ThermalStandard) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-06e8554569aace394570.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ThermalStandard";
    direction=:neutral,
)

function _form_fields(_openapi_value::ThermalStandard)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.status isa Absent ||
        push!(_openapi_output, "status" => _openapi_value.status)
    _openapi_value.commitment_mode isa Absent ||
        push!(_openapi_output, "commitment_mode" => _openapi_value.commitment_mode)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.active_power isa Absent ||
        push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.reactive_power isa Absent ||
        push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.rating isa Absent ||
        push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.active_power_limits isa Absent ||
        push!(_openapi_output, "active_power_limits" => _openapi_value.active_power_limits)
    _openapi_value.reactive_power_limits isa Absent || push!(
        _openapi_output,
        "reactive_power_limits" => _openapi_value.reactive_power_limits,
    )
    _openapi_value.ramp_limits isa Absent ||
        push!(_openapi_output, "ramp_limits" => _openapi_value.ramp_limits)
    _openapi_value.operation_cost isa Absent ||
        push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.time_limits isa Absent ||
        push!(_openapi_output, "time_limits" => _openapi_value.time_limits)
    _openapi_value.prime_mover_type isa Absent ||
        push!(_openapi_output, "prime_mover_type" => _openapi_value.prime_mover_type)
    _openapi_value.fuel isa Absent || push!(_openapi_output, "fuel" => _openapi_value.fuel)
    _openapi_value.time_at_status isa Absent ||
        push!(_openapi_output, "time_at_status" => _openapi_value.time_at_status)
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
