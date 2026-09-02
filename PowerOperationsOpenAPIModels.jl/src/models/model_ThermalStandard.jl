@doc "    ThermalStandard\n\nA thermal generator, such as a fossil fuel and nuclear generator.\n\nThis is a standard representation with options to include a minimum up time, minimum down time, and ramp limits. For a more detailed representation of the start-up and shut-down processes, including hot starts, see `ThermalMultiStart`.\n\n- `active_power`: Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits`: Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: Base power of the unit for per unitization. Must be positive; a zero base would make per-unit conversion undefined. Units: MVA.\n- `bus`: ID of the bus that this component is connected to.\n- `commitment_mode`: Commitment mode of the unit.\n- `dynamic_injector`: ID of the corresponding dynamic injection device, if any.\n- `fuel`: Prime mover fuel according to EIA 923.\n- `id`: Unique integer identifier for this component.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `operation_cost`: Operating cost of generation, or a MarketBidCost.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `prime_mover_type`: Prime mover technology according to EIA 923.\n- `ramp_limits`: Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min .\n- `rating`: Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `reactive_power`: Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `status`: Operating state of the unit at the start of a simulation.\n- `time_at_status`: Time the generator has been in its current status. Units: min.\n- `time_limits`: Minimum up and minimum down time limits. Units: min."
Base.@kwdef struct ThermalStandard
    active_power::Float64
    active_power_limits::ThermalStandardActivePowerLimits
    available::Bool
    base_power::Float64
    bus::Int64
    commitment_mode::Union{Absent,Nothing,ThermalStandardCommitmentMode} = ABSENT
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    fuel::Union{Absent,Nothing,ThermalStandardFuel} = ABSENT
    id::Int64
    name::String
    operation_cost::ThermalStandardOperationCost
    power_units::ThermalStandardPowerUnits
    prime_mover_type::Union{Absent,Nothing,ThermalStandardPrimeMoverType} = ABSENT
    ramp_limits::Union{Absent,Nothing,ThermalStandardRampLimits} = ABSENT
    rating::Float64
    reactive_power::Float64
    reactive_power_limits::Union{Absent,Nothing,ThermalStandardReactivePowerLimits} = ABSENT
    status::ThermalStandardStatus
    time_at_status::Union{Absent,Float64,Nothing} = ABSENT
    time_limits::Union{Absent,Nothing,ThermalStandardTimeLimits} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ThermalStandard}, value) = _decode(ThermalStandard, value, true)
function _decode(::Type{ThermalStandard}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThermalStandard"), _openapi_raw, "decoding ThermalStandard"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ThermalStandard")
    _openapi_field_active_power = _decode(Float64, _required(_openapi_object, "active_power", "ThermalStandard"), _openapi_validate)
    _openapi_field_active_power_limits = _decode(ThermalStandardActivePowerLimits, _required(_openapi_object, "active_power_limits", "ThermalStandard"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "ThermalStandard"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "ThermalStandard"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "ThermalStandard"), _openapi_validate)
    _openapi_field_commitment_mode = haskey(_openapi_object, "commitment_mode") ? _decode(Union{Absent,Nothing,ThermalStandardCommitmentMode}, _openapi_object["commitment_mode"], _openapi_validate) : ABSENT
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_fuel = haskey(_openapi_object, "fuel") ? _decode(Union{Absent,Nothing,ThermalStandardFuel}, _openapi_object["fuel"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "ThermalStandard"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "ThermalStandard"), _openapi_validate)
    _openapi_field_operation_cost = _decode(ThermalStandardOperationCost, _required(_openapi_object, "operation_cost", "ThermalStandard"), _openapi_validate)
    _openapi_field_power_units = _decode(ThermalStandardPowerUnits, _required(_openapi_object, "power_units", "ThermalStandard"), _openapi_validate)
    _openapi_field_prime_mover_type = haskey(_openapi_object, "prime_mover_type") ? _decode(Union{Absent,Nothing,ThermalStandardPrimeMoverType}, _openapi_object["prime_mover_type"], _openapi_validate) : ABSENT
    _openapi_field_ramp_limits = haskey(_openapi_object, "ramp_limits") ? _decode(Union{Absent,Nothing,ThermalStandardRampLimits}, _openapi_object["ramp_limits"], _openapi_validate) : ABSENT
    _openapi_field_rating = _decode(Float64, _required(_openapi_object, "rating", "ThermalStandard"), _openapi_validate)
    _openapi_field_reactive_power = _decode(Float64, _required(_openapi_object, "reactive_power", "ThermalStandard"), _openapi_validate)
    _openapi_field_reactive_power_limits = haskey(_openapi_object, "reactive_power_limits") ? _decode(Union{Absent,Nothing,ThermalStandardReactivePowerLimits}, _openapi_object["reactive_power_limits"], _openapi_validate) : ABSENT
    _openapi_field_status = _decode(ThermalStandardStatus, _required(_openapi_object, "status", "ThermalStandard"), _openapi_validate)
    _openapi_field_time_at_status = haskey(_openapi_object, "time_at_status") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["time_at_status"], _openapi_validate) : ABSENT
    _openapi_field_time_limits = haskey(_openapi_object, "time_limits") ? _decode(Union{Absent,Nothing,ThermalStandardTimeLimits}, _openapi_object["time_limits"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power","active_power_limits","available","base_power","bus","commitment_mode","dynamic_injector","fuel","id","name","operation_cost","power_units","prime_mover_type","ramp_limits","rating","reactive_power","reactive_power_limits","status","time_at_status","time_limits") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ThermalStandard(; active_power = _openapi_field_active_power, active_power_limits = _openapi_field_active_power_limits, available = _openapi_field_available, base_power = _openapi_field_base_power, bus = _openapi_field_bus, commitment_mode = _openapi_field_commitment_mode, dynamic_injector = _openapi_field_dynamic_injector, fuel = _openapi_field_fuel, id = _openapi_field_id, name = _openapi_field_name, operation_cost = _openapi_field_operation_cost, power_units = _openapi_field_power_units, prime_mover_type = _openapi_field_prime_mover_type, ramp_limits = _openapi_field_ramp_limits, rating = _openapi_field_rating, reactive_power = _openapi_field_reactive_power, reactive_power_limits = _openapi_field_reactive_power_limits, status = _openapi_field_status, time_at_status = _openapi_field_time_at_status, time_limits = _openapi_field_time_limits, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ThermalStandard)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power isa Absent || (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.active_power_limits isa Absent || (_openapi_output["active_power_limits"] = _encode(_openapi_value.active_power_limits))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.commitment_mode isa Absent || (_openapi_output["commitment_mode"] = _encode(_openapi_value.commitment_mode))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.fuel isa Absent || (_openapi_output["fuel"] = _encode(_openapi_value.fuel))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.operation_cost isa Absent || (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.prime_mover_type isa Absent || (_openapi_output["prime_mover_type"] = _encode(_openapi_value.prime_mover_type))
    _openapi_value.ramp_limits isa Absent || (_openapi_output["ramp_limits"] = _encode(_openapi_value.ramp_limits))
    _openapi_value.rating isa Absent || (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.reactive_power isa Absent || (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    _openapi_value.reactive_power_limits isa Absent || (_openapi_output["reactive_power_limits"] = _encode(_openapi_value.reactive_power_limits))
    _openapi_value.status isa Absent || (_openapi_output["status"] = _encode(_openapi_value.status))
    _openapi_value.time_at_status isa Absent || (_openapi_output["time_at_status"] = _encode(_openapi_value.time_at_status))
    _openapi_value.time_limits isa Absent || (_openapi_output["time_limits"] = _encode(_openapi_value.time_limits))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThermalStandard"), _openapi_output, "encoding ThermalStandard"; direction = :neutral)
end

function _form_fields(_openapi_value::ThermalStandard)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power isa Absent || push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.active_power_limits isa Absent || push!(_openapi_output, "active_power_limits" => _openapi_value.active_power_limits)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.commitment_mode isa Absent || push!(_openapi_output, "commitment_mode" => _openapi_value.commitment_mode)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.fuel isa Absent || push!(_openapi_output, "fuel" => _openapi_value.fuel)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.operation_cost isa Absent || push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.prime_mover_type isa Absent || push!(_openapi_output, "prime_mover_type" => _openapi_value.prime_mover_type)
    _openapi_value.ramp_limits isa Absent || push!(_openapi_output, "ramp_limits" => _openapi_value.ramp_limits)
    _openapi_value.rating isa Absent || push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.reactive_power isa Absent || push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.reactive_power_limits isa Absent || push!(_openapi_output, "reactive_power_limits" => _openapi_value.reactive_power_limits)
    _openapi_value.status isa Absent || push!(_openapi_output, "status" => _openapi_value.status)
    _openapi_value.time_at_status isa Absent || push!(_openapi_output, "time_at_status" => _openapi_value.time_at_status)
    _openapi_value.time_limits isa Absent || push!(_openapi_output, "time_limits" => _openapi_value.time_limits)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
