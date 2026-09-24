"""
    InterruptibleStandardLoad

An interruptible, voltage-dependent ZIP load whose demand can be curtailed through demand response programs, subject to an interruption cost.

Like `StandardLoad`, it breaks the ZIP into three pieces: Z (constant impedance), I (constant current), and P (constant power), according to `P = P_P * V^0 + P_I * V^1 + P_Z * V^2` for active power and `Q = Q_P * V^0 + Q_I * V^1 + Q_Z * V^2` for reactive power. (Voltage V is in per unit.) Unlike `StandardLoad`, it carries an `operation_cost` for interrupting the load.

For a non-interruptible ZIP load, see `StandardLoad`. For an interruptible constant-power load, see `InterruptiblePowerLoad`.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `InterruptibleStandardLoad`) must have unique names, but components of different types (e.g., `InterruptibleStandardLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `bus`: ID of the bus that this component is connected to.
  - `base_power`: Base power of the load for per unitization. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `operation_cost`: Operational cost of interrupting load. or MarketBidCost
  - `conformity`: Indicates whether the specified load is conforming or non-conforming.
  - `constant_active_power`: Constant active power demand (P_P). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `constant_reactive_power`: Constant reactive power demand (Q_P). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `impedance_active_power`: Active power coefficient for constant impedance load (P_Z). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `impedance_reactive_power`: Reactive power coefficient for constant impedance load (Q_Z). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `current_active_power`: Active power coefficient for constant current load (P_I). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `current_reactive_power`: Reactive power coefficient for constant current load (Q_I). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `max_constant_active_power`: Maximum active power drawn by constant power load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `max_constant_reactive_power`: Maximum reactive power drawn by constant power load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `max_impedance_active_power`: Maximum active power drawn by constant impedance load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `max_impedance_reactive_power`: Maximum reactive power drawn by constant impedance load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `max_current_active_power`: Maximum active power drawn by constant current load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `max_current_reactive_power`: Maximum reactive power drawn by constant current load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `dynamic_injector`: ID of the corresponding dynamic injection device, if any.
"""
Base.@kwdef struct InterruptibleStandardLoad <: APIModel
    id::Int64
    name::String
    available::Bool
    bus::Int64
    base_power::Float64
    power_units::UnitSystem
    operation_cost::InterruptibleStandardLoadOperationCost
    conformity::Union{Absent, LoadConformity, Nothing} = ABSENT
    constant_active_power::Union{Absent, Float64, Nothing} = ABSENT
    constant_reactive_power::Union{Absent, Float64, Nothing} = ABSENT
    impedance_active_power::Union{Absent, Float64, Nothing} = ABSENT
    impedance_reactive_power::Union{Absent, Float64, Nothing} = ABSENT
    current_active_power::Union{Absent, Float64, Nothing} = ABSENT
    current_reactive_power::Union{Absent, Float64, Nothing} = ABSENT
    max_constant_active_power::Union{Absent, Float64, Nothing} = ABSENT
    max_constant_reactive_power::Union{Absent, Float64, Nothing} = ABSENT
    max_impedance_active_power::Union{Absent, Float64, Nothing} = ABSENT
    max_impedance_reactive_power::Union{Absent, Float64, Nothing} = ABSENT
    max_current_active_power::Union{Absent, Float64, Nothing} = ABSENT
    max_current_reactive_power::Union{Absent, Float64, Nothing} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{InterruptibleStandardLoad}, value) =
    _decode(InterruptibleStandardLoad, value, true)
function _decode(::Type{InterruptibleStandardLoad}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0ff4f7d7f450083ab683.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding InterruptibleStandardLoad";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "InterruptibleStandardLoad")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "InterruptibleStandardLoad"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "InterruptibleStandardLoad"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "InterruptibleStandardLoad"),
        _openapi_validate,
    )
    _openapi_field_bus = _decode(
        Int64,
        _required(_openapi_object, "bus", "InterruptibleStandardLoad"),
        _openapi_validate,
    )
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "InterruptibleStandardLoad"),
        _openapi_validate,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "InterruptibleStandardLoad"),
        _openapi_validate,
    )
    _openapi_field_operation_cost = _decode(
        InterruptibleStandardLoadOperationCost,
        _required(_openapi_object, "operation_cost", "InterruptibleStandardLoad"),
        _openapi_validate,
    )
    _openapi_field_conformity =
        haskey(_openapi_object, "conformity") ?
        _decode(
            Union{Absent, LoadConformity, Nothing},
            _openapi_object["conformity"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_constant_active_power =
        haskey(_openapi_object, "constant_active_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["constant_active_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_constant_reactive_power =
        haskey(_openapi_object, "constant_reactive_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["constant_reactive_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_impedance_active_power =
        haskey(_openapi_object, "impedance_active_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["impedance_active_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_impedance_reactive_power =
        haskey(_openapi_object, "impedance_reactive_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["impedance_reactive_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_current_active_power =
        haskey(_openapi_object, "current_active_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["current_active_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_current_reactive_power =
        haskey(_openapi_object, "current_reactive_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["current_reactive_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_constant_active_power =
        haskey(_openapi_object, "max_constant_active_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_constant_active_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_constant_reactive_power =
        haskey(_openapi_object, "max_constant_reactive_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_constant_reactive_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_impedance_active_power =
        haskey(_openapi_object, "max_impedance_active_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_impedance_active_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_impedance_reactive_power =
        haskey(_openapi_object, "max_impedance_reactive_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_impedance_reactive_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_current_active_power =
        haskey(_openapi_object, "max_current_active_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_current_active_power"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_current_reactive_power =
        haskey(_openapi_object, "max_current_reactive_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_current_reactive_power"],
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
            "base_power",
            "power_units",
            "operation_cost",
            "conformity",
            "constant_active_power",
            "constant_reactive_power",
            "impedance_active_power",
            "impedance_reactive_power",
            "current_active_power",
            "current_reactive_power",
            "max_constant_active_power",
            "max_constant_reactive_power",
            "max_impedance_active_power",
            "max_impedance_reactive_power",
            "max_current_active_power",
            "max_current_reactive_power",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return InterruptibleStandardLoad(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        bus=_openapi_field_bus,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        operation_cost=_openapi_field_operation_cost,
        conformity=_openapi_field_conformity,
        constant_active_power=_openapi_field_constant_active_power,
        constant_reactive_power=_openapi_field_constant_reactive_power,
        impedance_active_power=_openapi_field_impedance_active_power,
        impedance_reactive_power=_openapi_field_impedance_reactive_power,
        current_active_power=_openapi_field_current_active_power,
        current_reactive_power=_openapi_field_current_reactive_power,
        max_constant_active_power=_openapi_field_max_constant_active_power,
        max_constant_reactive_power=_openapi_field_max_constant_reactive_power,
        max_impedance_active_power=_openapi_field_max_impedance_active_power,
        max_impedance_reactive_power=_openapi_field_max_impedance_reactive_power,
        max_current_active_power=_openapi_field_max_current_active_power,
        max_current_reactive_power=_openapi_field_max_current_reactive_power,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::InterruptibleStandardLoad)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.operation_cost isa Absent ||
        (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.conformity isa Absent ||
        (_openapi_output["conformity"] = _encode(_openapi_value.conformity))
    _openapi_value.constant_active_power isa Absent || (
        _openapi_output["constant_active_power"] =
            _encode(_openapi_value.constant_active_power)
    )
    _openapi_value.constant_reactive_power isa Absent || (
        _openapi_output["constant_reactive_power"] =
            _encode(_openapi_value.constant_reactive_power)
    )
    _openapi_value.impedance_active_power isa Absent || (
        _openapi_output["impedance_active_power"] =
            _encode(_openapi_value.impedance_active_power)
    )
    _openapi_value.impedance_reactive_power isa Absent || (
        _openapi_output["impedance_reactive_power"] =
            _encode(_openapi_value.impedance_reactive_power)
    )
    _openapi_value.current_active_power isa Absent || (
        _openapi_output["current_active_power"] =
            _encode(_openapi_value.current_active_power)
    )
    _openapi_value.current_reactive_power isa Absent || (
        _openapi_output["current_reactive_power"] =
            _encode(_openapi_value.current_reactive_power)
    )
    _openapi_value.max_constant_active_power isa Absent || (
        _openapi_output["max_constant_active_power"] =
            _encode(_openapi_value.max_constant_active_power)
    )
    _openapi_value.max_constant_reactive_power isa Absent || (
        _openapi_output["max_constant_reactive_power"] =
            _encode(_openapi_value.max_constant_reactive_power)
    )
    _openapi_value.max_impedance_active_power isa Absent || (
        _openapi_output["max_impedance_active_power"] =
            _encode(_openapi_value.max_impedance_active_power)
    )
    _openapi_value.max_impedance_reactive_power isa Absent || (
        _openapi_output["max_impedance_reactive_power"] =
            _encode(_openapi_value.max_impedance_reactive_power)
    )
    _openapi_value.max_current_active_power isa Absent || (
        _openapi_output["max_current_active_power"] =
            _encode(_openapi_value.max_current_active_power)
    )
    _openapi_value.max_current_reactive_power isa Absent || (
        _openapi_output["max_current_reactive_power"] =
            _encode(_openapi_value.max_current_reactive_power)
    )
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
            resource="https://openapi.invalid/schema/external-0ff4f7d7f450083ab683.json",
            pointer="",
        ),
        _openapi_output,
        "encoding InterruptibleStandardLoad";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::InterruptibleStandardLoad)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.operation_cost isa Absent ||
        push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.conformity isa Absent ||
        push!(_openapi_output, "conformity" => _openapi_value.conformity)
    _openapi_value.constant_active_power isa Absent || push!(
        _openapi_output,
        "constant_active_power" => _openapi_value.constant_active_power,
    )
    _openapi_value.constant_reactive_power isa Absent || push!(
        _openapi_output,
        "constant_reactive_power" => _openapi_value.constant_reactive_power,
    )
    _openapi_value.impedance_active_power isa Absent || push!(
        _openapi_output,
        "impedance_active_power" => _openapi_value.impedance_active_power,
    )
    _openapi_value.impedance_reactive_power isa Absent || push!(
        _openapi_output,
        "impedance_reactive_power" => _openapi_value.impedance_reactive_power,
    )
    _openapi_value.current_active_power isa Absent || push!(
        _openapi_output,
        "current_active_power" => _openapi_value.current_active_power,
    )
    _openapi_value.current_reactive_power isa Absent || push!(
        _openapi_output,
        "current_reactive_power" => _openapi_value.current_reactive_power,
    )
    _openapi_value.max_constant_active_power isa Absent || push!(
        _openapi_output,
        "max_constant_active_power" => _openapi_value.max_constant_active_power,
    )
    _openapi_value.max_constant_reactive_power isa Absent || push!(
        _openapi_output,
        "max_constant_reactive_power" => _openapi_value.max_constant_reactive_power,
    )
    _openapi_value.max_impedance_active_power isa Absent || push!(
        _openapi_output,
        "max_impedance_active_power" => _openapi_value.max_impedance_active_power,
    )
    _openapi_value.max_impedance_reactive_power isa Absent || push!(
        _openapi_output,
        "max_impedance_reactive_power" => _openapi_value.max_impedance_reactive_power,
    )
    _openapi_value.max_current_active_power isa Absent || push!(
        _openapi_output,
        "max_current_active_power" => _openapi_value.max_current_active_power,
    )
    _openapi_value.max_current_reactive_power isa Absent || push!(
        _openapi_output,
        "max_current_reactive_power" => _openapi_value.max_current_reactive_power,
    )
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
