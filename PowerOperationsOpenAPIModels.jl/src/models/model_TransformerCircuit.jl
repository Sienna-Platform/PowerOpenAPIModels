@doc "    TransformerCircuit\n\nThe data defining one modeled arc of a transformer.\n\nA `TwoWindingTransformer` has one circuit; a `ThreeWindingTransformer` has three, each connecting a terminal bus to the star bus. Circuit `available` is the single source of truth for availability; the owning transformer derives its availability from its circuits. `r`/`x` are the circuit impedance (for a two-winding transformer, the series impedance; for a three-winding transformer, the star-leg equivalent), in pu (device base) on `base_power` referenced to `base_voltage_primary`. Tap-changer / phase-shifter control is described by the flat control fields: `control_objective = UNDEFINED` means the circuit has no control block. For a `TwoWindingTransformer`, the single circuit's `base_power` is the transformer's device base.\n\n- `active_power_flow`: Initial condition of active power flow through this circuit. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `alpha`: Initial condition of phase shift across this circuit. Units: rad.\n- `arc`: An `Arc` defining this circuit `from` a terminal bus `to` the transformer's other terminal or star bus.\n- `available`: Indicator of whether this circuit is connected and online.\n- `base_power`: Base power for per unitization of this circuit. Units: MVA.\n- `base_voltage_primary`: Primary (from) terminal-side base voltage; the reference voltage for this circuit's per-unit impedance. Units: kV.\n- `base_voltage_secondary`: Secondary (to) terminal-side base voltage. For a three-winding transformer this defaults to the primary base voltage at parse time. Units: kV.\n- `control_limits`: Control band (PSS/E RMA/RMI), per `control_objective`. Units: per control_objective — UNDEFINED: 1, VOLTAGE_DISABLED: 1, REACTIVE_POWER_FLOW_DISABLED: 1, ACTIVE_POWER_FLOW_DISABLED: rad, CONTROL_OF_DC_LINE_DISABLED: 1, ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED: rad, FIXED: 1, VOLTAGE: 1, REACTIVE_POWER_FLOW: 1, ACTIVE_POWER_FLOW: rad, CONTROL_OF_DC_LINE: 1, ASYMMETRIC_ACTIVE_POWER_FLOW: rad .\n- `control_objective`: Tap-changer / phase-shifter control objective (PSS/E COD). `UNDEFINED` means this circuit has no control block.\n- `controlled_quantity_limits`: Controlled-quantity band (PSS/E VMA/VMI), per `control_objective`. Units: per control_objective — UNDEFINED: pu, VOLTAGE_DISABLED: pu, REACTIVE_POWER_FLOW_DISABLED: MVAr, ACTIVE_POWER_FLOW_DISABLED: MW, CONTROL_OF_DC_LINE_DISABLED: MW, ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED: MW, FIXED: pu, VOLTAGE: pu, REACTIVE_POWER_FLOW: MVAr, ACTIVE_POWER_FLOW: MW, CONTROL_OF_DC_LINE: MW, ASYMMETRIC_ACTIVE_POWER_FLOW: MW .\n- `id`: Unique integer identifier for this component.\n- `number_of_tap_positions`: Number of tap positions (PSS/E NTP).\n- `parameter_units`: Unit basis for this circuit's impedance fields (r, x).\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `r`: Circuit resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `rating`: Thermal rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `rating_b`: Second current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `rating_c`: Third current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `reactive_power_flow`: Initial condition of reactive power flow through this circuit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `regulated_bus_number`: Controlled bus number (PSS/E CONT; sign = regulation side).\n- `tap`: Normalized tap changer position for voltage control, varying between 0 and 2, with 1 centered at the nominal voltage. Units: 1.\n- `x`: Circuit reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu ."
Base.@kwdef struct TransformerCircuit
    active_power_flow::Union{Absent,Float64,Nothing} = ABSENT
    alpha::Union{Absent,Float64,Nothing} = ABSENT
    arc::Int64
    available::Bool
    base_power::Union{Absent,Float64,Nothing} = ABSENT
    base_voltage_primary::Union{Absent,Float64,Nothing} = ABSENT
    base_voltage_secondary::Union{Absent,Float64,Nothing} = ABSENT
    control_limits::Union{Absent,Nothing,TransformerCircuitControlLimits} = ABSENT
    control_objective::Union{Absent,Nothing,TransformerCircuitControlObjective} = ABSENT
    controlled_quantity_limits::Union{Absent,Nothing,TransformerCircuitControlledQuantityLimits} = ABSENT
    id::Int64
    number_of_tap_positions::Union{Absent,Int64,Nothing} = ABSENT
    parameter_units::Union{Absent,Nothing,TransformerCircuitParameterUnits} = ABSENT
    power_units::TransformerCircuitPowerUnits
    r::Union{Absent,Float64,Nothing} = ABSENT
    rating::Union{Absent,Float64,Nothing} = ABSENT
    rating_b::Union{Absent,Float64,Nothing} = ABSENT
    rating_c::Union{Absent,Float64,Nothing} = ABSENT
    reactive_power_flow::Union{Absent,Float64,Nothing} = ABSENT
    regulated_bus_number::Union{Absent,Int64,Nothing} = ABSENT
    tap::Union{Absent,Float64,Nothing} = ABSENT
    x::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TransformerCircuit}, value) = _decode(TransformerCircuit, value, true)
function _decode(::Type{TransformerCircuit}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TransformerCircuit"), _openapi_raw, "decoding TransformerCircuit"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TransformerCircuit")
    _openapi_field_active_power_flow = haskey(_openapi_object, "active_power_flow") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["active_power_flow"], _openapi_validate) : ABSENT
    _openapi_field_alpha = haskey(_openapi_object, "alpha") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["alpha"], _openapi_validate) : ABSENT
    _openapi_field_arc = _decode(Int64, _required(_openapi_object, "arc", "TransformerCircuit"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "TransformerCircuit"), _openapi_validate)
    _openapi_field_base_power = haskey(_openapi_object, "base_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_power"], _openapi_validate) : ABSENT
    _openapi_field_base_voltage_primary = haskey(_openapi_object, "base_voltage_primary") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_voltage_primary"], _openapi_validate) : ABSENT
    _openapi_field_base_voltage_secondary = haskey(_openapi_object, "base_voltage_secondary") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_voltage_secondary"], _openapi_validate) : ABSENT
    _openapi_field_control_limits = haskey(_openapi_object, "control_limits") ? _decode(Union{Absent,Nothing,TransformerCircuitControlLimits}, _openapi_object["control_limits"], _openapi_validate) : ABSENT
    _openapi_field_control_objective = haskey(_openapi_object, "control_objective") ? _decode(Union{Absent,Nothing,TransformerCircuitControlObjective}, _openapi_object["control_objective"], _openapi_validate) : ABSENT
    _openapi_field_controlled_quantity_limits = haskey(_openapi_object, "controlled_quantity_limits") ? _decode(Union{Absent,Nothing,TransformerCircuitControlledQuantityLimits}, _openapi_object["controlled_quantity_limits"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TransformerCircuit"), _openapi_validate)
    _openapi_field_number_of_tap_positions = haskey(_openapi_object, "number_of_tap_positions") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["number_of_tap_positions"], _openapi_validate) : ABSENT
    _openapi_field_parameter_units = haskey(_openapi_object, "parameter_units") ? _decode(Union{Absent,Nothing,TransformerCircuitParameterUnits}, _openapi_object["parameter_units"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(TransformerCircuitPowerUnits, _required(_openapi_object, "power_units", "TransformerCircuit"), _openapi_validate)
    _openapi_field_r = haskey(_openapi_object, "r") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["r"], _openapi_validate) : ABSENT
    _openapi_field_rating = haskey(_openapi_object, "rating") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rating"], _openapi_validate) : ABSENT
    _openapi_field_rating_b = haskey(_openapi_object, "rating_b") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rating_b"], _openapi_validate) : ABSENT
    _openapi_field_rating_c = haskey(_openapi_object, "rating_c") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rating_c"], _openapi_validate) : ABSENT
    _openapi_field_reactive_power_flow = haskey(_openapi_object, "reactive_power_flow") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["reactive_power_flow"], _openapi_validate) : ABSENT
    _openapi_field_regulated_bus_number = haskey(_openapi_object, "regulated_bus_number") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["regulated_bus_number"], _openapi_validate) : ABSENT
    _openapi_field_tap = haskey(_openapi_object, "tap") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["tap"], _openapi_validate) : ABSENT
    _openapi_field_x = haskey(_openapi_object, "x") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["x"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power_flow","alpha","arc","available","base_power","base_voltage_primary","base_voltage_secondary","control_limits","control_objective","controlled_quantity_limits","id","number_of_tap_positions","parameter_units","power_units","r","rating","rating_b","rating_c","reactive_power_flow","regulated_bus_number","tap","x") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TransformerCircuit(; active_power_flow = _openapi_field_active_power_flow, alpha = _openapi_field_alpha, arc = _openapi_field_arc, available = _openapi_field_available, base_power = _openapi_field_base_power, base_voltage_primary = _openapi_field_base_voltage_primary, base_voltage_secondary = _openapi_field_base_voltage_secondary, control_limits = _openapi_field_control_limits, control_objective = _openapi_field_control_objective, controlled_quantity_limits = _openapi_field_controlled_quantity_limits, id = _openapi_field_id, number_of_tap_positions = _openapi_field_number_of_tap_positions, parameter_units = _openapi_field_parameter_units, power_units = _openapi_field_power_units, r = _openapi_field_r, rating = _openapi_field_rating, rating_b = _openapi_field_rating_b, rating_c = _openapi_field_rating_c, reactive_power_flow = _openapi_field_reactive_power_flow, regulated_bus_number = _openapi_field_regulated_bus_number, tap = _openapi_field_tap, x = _openapi_field_x, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TransformerCircuit)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power_flow isa Absent || (_openapi_output["active_power_flow"] = _encode(_openapi_value.active_power_flow))
    _openapi_value.alpha isa Absent || (_openapi_output["alpha"] = _encode(_openapi_value.alpha))
    _openapi_value.arc isa Absent || (_openapi_output["arc"] = _encode(_openapi_value.arc))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.base_voltage_primary isa Absent || (_openapi_output["base_voltage_primary"] = _encode(_openapi_value.base_voltage_primary))
    _openapi_value.base_voltage_secondary isa Absent || (_openapi_output["base_voltage_secondary"] = _encode(_openapi_value.base_voltage_secondary))
    _openapi_value.control_limits isa Absent || (_openapi_output["control_limits"] = _encode(_openapi_value.control_limits))
    _openapi_value.control_objective isa Absent || (_openapi_output["control_objective"] = _encode(_openapi_value.control_objective))
    _openapi_value.controlled_quantity_limits isa Absent || (_openapi_output["controlled_quantity_limits"] = _encode(_openapi_value.controlled_quantity_limits))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.number_of_tap_positions isa Absent || (_openapi_output["number_of_tap_positions"] = _encode(_openapi_value.number_of_tap_positions))
    _openapi_value.parameter_units isa Absent || (_openapi_output["parameter_units"] = _encode(_openapi_value.parameter_units))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.r isa Absent || (_openapi_output["r"] = _encode(_openapi_value.r))
    _openapi_value.rating isa Absent || (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.rating_b isa Absent || (_openapi_output["rating_b"] = _encode(_openapi_value.rating_b))
    _openapi_value.rating_c isa Absent || (_openapi_output["rating_c"] = _encode(_openapi_value.rating_c))
    _openapi_value.reactive_power_flow isa Absent || (_openapi_output["reactive_power_flow"] = _encode(_openapi_value.reactive_power_flow))
    _openapi_value.regulated_bus_number isa Absent || (_openapi_output["regulated_bus_number"] = _encode(_openapi_value.regulated_bus_number))
    _openapi_value.tap isa Absent || (_openapi_output["tap"] = _encode(_openapi_value.tap))
    _openapi_value.x isa Absent || (_openapi_output["x"] = _encode(_openapi_value.x))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TransformerCircuit"), _openapi_output, "encoding TransformerCircuit"; direction = :neutral)
end

function _form_fields(_openapi_value::TransformerCircuit)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power_flow isa Absent || push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.alpha isa Absent || push!(_openapi_output, "alpha" => _openapi_value.alpha)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.base_voltage_primary isa Absent || push!(_openapi_output, "base_voltage_primary" => _openapi_value.base_voltage_primary)
    _openapi_value.base_voltage_secondary isa Absent || push!(_openapi_output, "base_voltage_secondary" => _openapi_value.base_voltage_secondary)
    _openapi_value.control_limits isa Absent || push!(_openapi_output, "control_limits" => _openapi_value.control_limits)
    _openapi_value.control_objective isa Absent || push!(_openapi_output, "control_objective" => _openapi_value.control_objective)
    _openapi_value.controlled_quantity_limits isa Absent || push!(_openapi_output, "controlled_quantity_limits" => _openapi_value.controlled_quantity_limits)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.number_of_tap_positions isa Absent || push!(_openapi_output, "number_of_tap_positions" => _openapi_value.number_of_tap_positions)
    _openapi_value.parameter_units isa Absent || push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.r isa Absent || push!(_openapi_output, "r" => _openapi_value.r)
    _openapi_value.rating isa Absent || push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.rating_b isa Absent || push!(_openapi_output, "rating_b" => _openapi_value.rating_b)
    _openapi_value.rating_c isa Absent || push!(_openapi_output, "rating_c" => _openapi_value.rating_c)
    _openapi_value.reactive_power_flow isa Absent || push!(_openapi_output, "reactive_power_flow" => _openapi_value.reactive_power_flow)
    _openapi_value.regulated_bus_number isa Absent || push!(_openapi_output, "regulated_bus_number" => _openapi_value.regulated_bus_number)
    _openapi_value.tap isa Absent || push!(_openapi_output, "tap" => _openapi_value.tap)
    _openapi_value.x isa Absent || push!(_openapi_output, "x" => _openapi_value.x)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
