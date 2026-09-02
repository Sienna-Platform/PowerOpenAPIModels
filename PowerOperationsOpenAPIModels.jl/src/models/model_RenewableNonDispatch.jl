@doc "    RenewableNonDispatch\n\nA non-dispatchable (i.e., non-curtailable or must-take) renewable generator.\n\nIts output is equal to its `max_active_power` time series by default. Example use: an aggregation of behind-the-meter distributed energy resources like rooftop solar. For curtailable or downward dispatachable generation, see `RenewableDispatch`.\n\nRenewable generators do not have a `max_active_power` parameter, which is instead calculated when calling `get_max_active_power()`.\n\n- `active_power`: Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: Base power of the unit for per unitization. Units: MVA.\n- `bus`: ID of the bus that this component is connected to.\n- `dynamic_injector`: ID of the corresponding dynamic injection device, if any.\n- `id`: Unique integer identifier for this component.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `power_factor`: Power factor [0, 1] set-point, used in some production cost modeling and in load flow if the unit is connected to a `PQ` bus. Units: 1.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `prime_mover_type`: Prime mover technology according to EIA 923.\n- `rating`: Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `reactive_power`: Initial reactive power set point of the unit, used in some production cost modeling simulations. To set the reactive power in a load flow, use `power_factor`. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu ."
Base.@kwdef struct RenewableNonDispatch
    active_power::Float64
    available::Bool
    base_power::Float64
    bus::Int64
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    id::Int64
    name::String
    power_factor::Float64
    power_units::RenewableNonDispatchPowerUnits
    prime_mover_type::RenewableNonDispatchPrimeMoverType
    rating::Float64
    reactive_power::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{RenewableNonDispatch}, value) = _decode(RenewableNonDispatch, value, true)
function _decode(::Type{RenewableNonDispatch}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/RenewableNonDispatch"), _openapi_raw, "decoding RenewableNonDispatch"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "RenewableNonDispatch")
    _openapi_field_active_power = _decode(Float64, _required(_openapi_object, "active_power", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_power_factor = _decode(Float64, _required(_openapi_object, "power_factor", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_power_units = _decode(RenewableNonDispatchPowerUnits, _required(_openapi_object, "power_units", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_prime_mover_type = _decode(RenewableNonDispatchPrimeMoverType, _required(_openapi_object, "prime_mover_type", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_rating = _decode(Float64, _required(_openapi_object, "rating", "RenewableNonDispatch"), _openapi_validate)
    _openapi_field_reactive_power = _decode(Float64, _required(_openapi_object, "reactive_power", "RenewableNonDispatch"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power","available","base_power","bus","dynamic_injector","id","name","power_factor","power_units","prime_mover_type","rating","reactive_power") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return RenewableNonDispatch(; active_power = _openapi_field_active_power, available = _openapi_field_available, base_power = _openapi_field_base_power, bus = _openapi_field_bus, dynamic_injector = _openapi_field_dynamic_injector, id = _openapi_field_id, name = _openapi_field_name, power_factor = _openapi_field_power_factor, power_units = _openapi_field_power_units, prime_mover_type = _openapi_field_prime_mover_type, rating = _openapi_field_rating, reactive_power = _openapi_field_reactive_power, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::RenewableNonDispatch)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power isa Absent || (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_factor isa Absent || (_openapi_output["power_factor"] = _encode(_openapi_value.power_factor))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.prime_mover_type isa Absent || (_openapi_output["prime_mover_type"] = _encode(_openapi_value.prime_mover_type))
    _openapi_value.rating isa Absent || (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.reactive_power isa Absent || (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/RenewableNonDispatch"), _openapi_output, "encoding RenewableNonDispatch"; direction = :neutral)
end

function _form_fields(_openapi_value::RenewableNonDispatch)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power isa Absent || push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_factor isa Absent || push!(_openapi_output, "power_factor" => _openapi_value.power_factor)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.prime_mover_type isa Absent || push!(_openapi_output, "prime_mover_type" => _openapi_value.prime_mover_type)
    _openapi_value.rating isa Absent || push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.reactive_power isa Absent || push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
