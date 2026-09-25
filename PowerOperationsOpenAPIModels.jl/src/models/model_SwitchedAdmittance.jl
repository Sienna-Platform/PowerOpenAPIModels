"""
    SwitchedAdmittance

A switched admittance, with discrete steps to adjust the admittance.

Most often used in power flow studies, iterating over the steps to see impacts of admittance on the results. Total admittance is `number_engaged` * `Y_increase`, unless `solved_admittance` is set, in which case that value is the effective admittance. There is no fixed base admittance: a PSS/E SWITCHED SHUNT record carries only BINIT and the per-block increments.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `bus`: ID of the bus that this component is connected to.
  - `admittance_units`: Unit basis for the shunt admittance fields. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage).
  - `number_engaged`: Vector with the number of steps currently engaged (switched in) for each adjustable shunt block. For example, `number_engaged[2]` is the number of steps in service at block 2, and cannot exceed `number_of_steps[2]`.
  - `number_of_steps`: Vector with number of steps for each adjustable shunt block. For example, `number_of_steps[2]` are the number of available steps for admittance increment at block 2.
  - `y_increase`: Vector with admittance increment step for each adjustable shunt block. For example, `Y_increase[2]` is the complex admittance increment for each step at block 2. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr .
  - `solved_admittance`: Solved-case switched shunt admittance (PSS/E BINIT); when present it is the shunt's effective admittance, used in place of `number_engaged` * `Y_increase`. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr .
  - `voltage_limits`: Regulated-voltage band (PSS/E VSWLO/VSWHI) at the regulated bus, per unit of its base voltage. `null` unless `control_mode` selects it. Units: pu.
  - `reactive_power_range_limits`: Regulated reactive-power band (PSS/E VSWLO/VSWHI) as a fraction of the regulated device's reactive power range, the plant, converter or FACTS shunt at the regulated bus; 0.2 to 0.8 means 20 to 80 percent of that device's Qmin-to-Qmax span. `null` unless `control_mode` selects it. Units: 1.
  - `control_mode`: Switched-shunt control mode (PSS/E MODSW). Voltage modes use `voltage_limits`, reactive modes use `reactive_power_range_limits`; `UNDEFINED` and `FIXED` use neither.
  - `regulated_bus_number`: Bus number whose voltage/quantity this shunt regulates; 0 means local bus (PSS/E SWREM/NREG). Units: 1.
  - `dynamic_injector`: ID of the corresponding dynamic injection model for admittance, if any.
"""
Base.@kwdef struct SwitchedAdmittance <: APIModel
    id::Int64
    name::String
    available::Bool
    bus::Int64
    admittance_units::Union{Absent, Nothing, ShuntAdmittanceUnitBasis} = ABSENT
    number_engaged::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    number_of_steps::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    y_increase::Union{Absent, Nothing, Vector{ComplexNumber}} = ABSENT
    solved_admittance::Union{Absent, Union{Float64, Nothing}} = ABSENT
    voltage_limits::Union{Absent, Nothing, MinMax} = ABSENT
    reactive_power_range_limits::Union{Absent, Nothing, MinMax} = ABSENT
    control_mode::Union{Absent, Nothing, SwitchedAdmittanceControlMode} = ABSENT
    regulated_bus_number::Union{Absent, Int64, Nothing} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SwitchedAdmittance}, value) = _decode(SwitchedAdmittance, value, true)
function _decode(::Type{SwitchedAdmittance}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-816d2962465333ec74c6.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SwitchedAdmittance";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SwitchedAdmittance")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "SwitchedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "SwitchedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "SwitchedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_bus = _decode(
        Int64,
        _required(_openapi_object, "bus", "SwitchedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_admittance_units =
        haskey(_openapi_object, "admittance_units") ?
        _decode(
            Union{Absent, Nothing, ShuntAdmittanceUnitBasis},
            _openapi_object["admittance_units"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_number_engaged =
        haskey(_openapi_object, "number_engaged") ?
        _decode(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["number_engaged"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_number_of_steps =
        haskey(_openapi_object, "number_of_steps") ?
        _decode(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["number_of_steps"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_y_increase =
        haskey(_openapi_object, "Y_increase") ?
        _decode(
            Union{Absent, Nothing, Vector{ComplexNumber}},
            _openapi_object["Y_increase"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_solved_admittance =
        haskey(_openapi_object, "solved_admittance") ?
        _decode(
            Union{Absent, Union{Float64, Nothing}},
            _openapi_object["solved_admittance"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_voltage_limits =
        haskey(_openapi_object, "voltage_limits") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["voltage_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_reactive_power_range_limits =
        haskey(_openapi_object, "reactive_power_range_limits") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["reactive_power_range_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_control_mode =
        haskey(_openapi_object, "control_mode") ?
        _decode(
            Union{Absent, Nothing, SwitchedAdmittanceControlMode},
            _openapi_object["control_mode"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_regulated_bus_number =
        haskey(_openapi_object, "regulated_bus_number") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["regulated_bus_number"],
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
            "admittance_units",
            "number_engaged",
            "number_of_steps",
            "Y_increase",
            "solved_admittance",
            "voltage_limits",
            "reactive_power_range_limits",
            "control_mode",
            "regulated_bus_number",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return SwitchedAdmittance(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        bus=_openapi_field_bus,
        admittance_units=_openapi_field_admittance_units,
        number_engaged=_openapi_field_number_engaged,
        number_of_steps=_openapi_field_number_of_steps,
        y_increase=_openapi_field_y_increase,
        solved_admittance=_openapi_field_solved_admittance,
        voltage_limits=_openapi_field_voltage_limits,
        reactive_power_range_limits=_openapi_field_reactive_power_range_limits,
        control_mode=_openapi_field_control_mode,
        regulated_bus_number=_openapi_field_regulated_bus_number,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::SwitchedAdmittance)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.admittance_units isa Absent ||
        (_openapi_output["admittance_units"] = _encode(_openapi_value.admittance_units))
    _openapi_value.number_engaged isa Absent ||
        (_openapi_output["number_engaged"] = _encode(_openapi_value.number_engaged))
    _openapi_value.number_of_steps isa Absent ||
        (_openapi_output["number_of_steps"] = _encode(_openapi_value.number_of_steps))
    _openapi_value.y_increase isa Absent ||
        (_openapi_output["Y_increase"] = _encode(_openapi_value.y_increase))
    _openapi_value.solved_admittance isa Absent ||
        (_openapi_output["solved_admittance"] = _encode(_openapi_value.solved_admittance))
    _openapi_value.voltage_limits isa Absent ||
        (_openapi_output["voltage_limits"] = _encode(_openapi_value.voltage_limits))
    _openapi_value.reactive_power_range_limits isa Absent || (
        _openapi_output["reactive_power_range_limits"] =
            _encode(_openapi_value.reactive_power_range_limits)
    )
    _openapi_value.control_mode isa Absent ||
        (_openapi_output["control_mode"] = _encode(_openapi_value.control_mode))
    _openapi_value.regulated_bus_number isa Absent || (
        _openapi_output["regulated_bus_number"] =
            _encode(_openapi_value.regulated_bus_number)
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
            resource="https://openapi.invalid/schema/external-816d2962465333ec74c6.json",
            pointer="",
        ),
        _openapi_output,
        "encoding SwitchedAdmittance";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::SwitchedAdmittance)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.admittance_units isa Absent ||
        push!(_openapi_output, "admittance_units" => _openapi_value.admittance_units)
    _openapi_value.number_engaged isa Absent ||
        push!(_openapi_output, "number_engaged" => _openapi_value.number_engaged)
    _openapi_value.number_of_steps isa Absent ||
        push!(_openapi_output, "number_of_steps" => _openapi_value.number_of_steps)
    _openapi_value.y_increase isa Absent ||
        push!(_openapi_output, "Y_increase" => _openapi_value.y_increase)
    _openapi_value.solved_admittance isa Absent ||
        push!(_openapi_output, "solved_admittance" => _openapi_value.solved_admittance)
    _openapi_value.voltage_limits isa Absent ||
        push!(_openapi_output, "voltage_limits" => _openapi_value.voltage_limits)
    _openapi_value.reactive_power_range_limits isa Absent || push!(
        _openapi_output,
        "reactive_power_range_limits" => _openapi_value.reactive_power_range_limits,
    )
    _openapi_value.control_mode isa Absent ||
        push!(_openapi_output, "control_mode" => _openapi_value.control_mode)
    _openapi_value.regulated_bus_number isa Absent || push!(
        _openapi_output,
        "regulated_bus_number" => _openapi_value.regulated_bus_number,
    )
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
