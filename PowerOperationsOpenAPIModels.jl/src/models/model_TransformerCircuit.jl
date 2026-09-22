"""
    TransformerCircuit

The data defining one modeled arc of a transformer.

A `TwoWindingTransformer` has one circuit; a `ThreeWindingTransformer` has three, each connecting a terminal bus to the star bus. Circuit `available` is the single source of truth for availability; the owning transformer derives its availability from its circuits. `r`/`x` are the circuit impedance (for a two-winding transformer, the series impedance; for a three-winding transformer, the star-leg equivalent), in pu (device base) on `base_power` referenced to `base_voltage_primary`. Tap-changer / phase-shifter control is described by the flat control fields: `control_objective = UNDEFINED` means the circuit has no control block. For a `TwoWindingTransformer`, the single circuit's `base_power` is the transformer's device base.

  - `id`: Unique integer identifier for this component.
  - `available`: Indicator of whether this circuit is connected and online.
  - `arc`: An `Arc` defining this circuit `from` a terminal bus `to` the transformer's other terminal or star bus.
  - `tap`: Normalized tap changer position for voltage control, varying between 0 and 2, with 1 centered at the nominal voltage. Units: 1.
  - `alpha`: Initial condition of phase shift across this circuit. Units: rad.
  - `parameter_units`: Unit basis for this circuit's impedance fields (r, x).
  - `r`: Circuit resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `x`: Circuit reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `control_objective`: Tap-changer / phase-shifter control objective (PSS/E COD). `UNDEFINED` means this circuit has no control block.
  - `regulated_bus_number`: Controlled bus number (PSS/E CONT; sign = regulation side).
  - `control_limits`: Control band (PSS/E RMA/RMI), per `control_objective`. Units: per control_objective — UNDEFINED: 1, VOLTAGE_DISABLED: 1, REACTIVE_POWER_FLOW_DISABLED: 1, ACTIVE_POWER_FLOW_DISABLED: rad, CONTROL_OF_DC_LINE_DISABLED: 1, ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED: rad, FIXED: 1, VOLTAGE: 1, REACTIVE_POWER_FLOW: 1, ACTIVE_POWER_FLOW: rad, CONTROL_OF_DC_LINE: 1, ASYMMETRIC_ACTIVE_POWER_FLOW: rad .
  - `controlled_quantity_limits`: Controlled-quantity band (PSS/E VMA/VMI), per `control_objective`. Units: per control_objective — UNDEFINED: pu, VOLTAGE_DISABLED: pu, REACTIVE_POWER_FLOW_DISABLED: MVAr, ACTIVE_POWER_FLOW_DISABLED: MW, CONTROL_OF_DC_LINE_DISABLED: MW, ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED: MW, FIXED: pu, VOLTAGE: pu, REACTIVE_POWER_FLOW: MVAr, ACTIVE_POWER_FLOW: MW, CONTROL_OF_DC_LINE: MW, ASYMMETRIC_ACTIVE_POWER_FLOW: MW .
  - `number_of_tap_positions`: Number of tap positions (PSS/E NTP).
  - `rating`: Thermal rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `rating_b`: Second current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `rating_c`: Third current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `active_power_flow`: Initial condition of active power flow through this circuit. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power_flow`: Initial condition of reactive power flow through this circuit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `base_power`: Base power for per unitization of this circuit. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `base_voltage_primary`: Primary (from) terminal-side base voltage; the reference voltage for this circuit's per-unit impedance. Units: kV.
  - `base_voltage_secondary`: Secondary (to) terminal-side base voltage. For a three-winding transformer this defaults to the primary base voltage at parse time. Units: kV.
"""
Base.@kwdef struct TransformerCircuit <: APIModel
    id::Int64
    available::Bool
    arc::Int64
    tap::Union{Absent, Float64, Nothing} = ABSENT
    alpha::Union{Absent, Float64, Nothing} = ABSENT
    parameter_units::Union{Absent, ImpedanceUnitBasis, Nothing} = ABSENT
    r::Union{Absent, Float64, Nothing} = ABSENT
    x::Union{Absent, Float64, Nothing} = ABSENT
    control_objective::Union{Absent, Nothing, TransformerControlObjective} = ABSENT
    regulated_bus_number::Union{Absent, Int64, Nothing} = ABSENT
    control_limits::Union{Absent, Nothing, MinMax} = ABSENT
    controlled_quantity_limits::Union{Absent, Nothing, MinMax} = ABSENT
    number_of_tap_positions::Union{Absent, Int64, Nothing} = ABSENT
    rating::Union{Absent, Float64, Nothing} = ABSENT
    rating_b::Union{Absent, Float64, Nothing} = ABSENT
    rating_c::Union{Absent, Float64, Nothing} = ABSENT
    active_power_flow::Union{Absent, Float64, Nothing} = ABSENT
    reactive_power_flow::Union{Absent, Float64, Nothing} = ABSENT
    base_power::Union{Absent, Float64, Nothing} = ABSENT
    power_units::UnitSystem
    base_voltage_primary::Union{Absent, Float64, Nothing} = ABSENT
    base_voltage_secondary::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TransformerCircuit}, value) = _decode(TransformerCircuit, value, true)
function _decode(::Type{TransformerCircuit}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ef22c9427a47f63bd233.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding TransformerCircuit";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TransformerCircuit")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "TransformerCircuit"), false)
    _openapi_field_available =
        _decode(Bool, _required(_openapi_object, "available", "TransformerCircuit"), false)
    _openapi_field_arc =
        _decode(Int64, _required(_openapi_object, "arc", "TransformerCircuit"), false)
    _openapi_field_tap =
        haskey(_openapi_object, "tap") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["tap"], false) : ABSENT
    _openapi_field_alpha =
        haskey(_openapi_object, "alpha") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["alpha"], false) : ABSENT
    _openapi_field_parameter_units =
        haskey(_openapi_object, "parameter_units") ?
        _decode(
            Union{Absent, ImpedanceUnitBasis, Nothing},
            _openapi_object["parameter_units"],
            false,
        ) : ABSENT
    _openapi_field_r =
        haskey(_openapi_object, "r") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["r"], false) : ABSENT
    _openapi_field_x =
        haskey(_openapi_object, "x") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["x"], false) : ABSENT
    _openapi_field_control_objective =
        haskey(_openapi_object, "control_objective") ?
        _decode(
            Union{Absent, Nothing, TransformerControlObjective},
            _openapi_object["control_objective"],
            false,
        ) : ABSENT
    _openapi_field_regulated_bus_number =
        haskey(_openapi_object, "regulated_bus_number") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["regulated_bus_number"],
            false,
        ) : ABSENT
    _openapi_field_control_limits =
        haskey(_openapi_object, "control_limits") ?
        _decode(Union{Absent, Nothing, MinMax}, _openapi_object["control_limits"], false) :
        ABSENT
    _openapi_field_controlled_quantity_limits =
        haskey(_openapi_object, "controlled_quantity_limits") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["controlled_quantity_limits"],
            false,
        ) : ABSENT
    _openapi_field_number_of_tap_positions =
        haskey(_openapi_object, "number_of_tap_positions") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["number_of_tap_positions"],
            false,
        ) : ABSENT
    _openapi_field_rating =
        haskey(_openapi_object, "rating") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["rating"], false) : ABSENT
    _openapi_field_rating_b =
        haskey(_openapi_object, "rating_b") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["rating_b"], false) :
        ABSENT
    _openapi_field_rating_c =
        haskey(_openapi_object, "rating_c") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["rating_c"], false) :
        ABSENT
    _openapi_field_active_power_flow =
        haskey(_openapi_object, "active_power_flow") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["active_power_flow"],
            false,
        ) : ABSENT
    _openapi_field_reactive_power_flow =
        haskey(_openapi_object, "reactive_power_flow") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["reactive_power_flow"],
            false,
        ) : ABSENT
    _openapi_field_base_power =
        haskey(_openapi_object, "base_power") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["base_power"], false) :
        ABSENT
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "TransformerCircuit"),
        false,
    )
    _openapi_field_base_voltage_primary =
        haskey(_openapi_object, "base_voltage_primary") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["base_voltage_primary"],
            false,
        ) : ABSENT
    _openapi_field_base_voltage_secondary =
        haskey(_openapi_object, "base_voltage_secondary") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["base_voltage_secondary"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "available",
            "arc",
            "tap",
            "alpha",
            "parameter_units",
            "r",
            "x",
            "control_objective",
            "regulated_bus_number",
            "control_limits",
            "controlled_quantity_limits",
            "number_of_tap_positions",
            "rating",
            "rating_b",
            "rating_c",
            "active_power_flow",
            "reactive_power_flow",
            "base_power",
            "power_units",
            "base_voltage_primary",
            "base_voltage_secondary",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return TransformerCircuit(;
        id=_openapi_field_id,
        available=_openapi_field_available,
        arc=_openapi_field_arc,
        tap=_openapi_field_tap,
        alpha=_openapi_field_alpha,
        parameter_units=_openapi_field_parameter_units,
        r=_openapi_field_r,
        x=_openapi_field_x,
        control_objective=_openapi_field_control_objective,
        regulated_bus_number=_openapi_field_regulated_bus_number,
        control_limits=_openapi_field_control_limits,
        controlled_quantity_limits=_openapi_field_controlled_quantity_limits,
        number_of_tap_positions=_openapi_field_number_of_tap_positions,
        rating=_openapi_field_rating,
        rating_b=_openapi_field_rating_b,
        rating_c=_openapi_field_rating_c,
        active_power_flow=_openapi_field_active_power_flow,
        reactive_power_flow=_openapi_field_reactive_power_flow,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        base_voltage_primary=_openapi_field_base_voltage_primary,
        base_voltage_secondary=_openapi_field_base_voltage_secondary,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::TransformerCircuit)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.arc isa Absent ||
        (_openapi_output["arc"] = _encode_unvalidated(_openapi_value.arc))
    _openapi_value.tap isa Absent ||
        (_openapi_output["tap"] = _encode_unvalidated(_openapi_value.tap))
    _openapi_value.alpha isa Absent ||
        (_openapi_output["alpha"] = _encode_unvalidated(_openapi_value.alpha))
    _openapi_value.parameter_units isa Absent || (
        _openapi_output["parameter_units"] =
            _encode_unvalidated(_openapi_value.parameter_units)
    )
    _openapi_value.r isa Absent ||
        (_openapi_output["r"] = _encode_unvalidated(_openapi_value.r))
    _openapi_value.x isa Absent ||
        (_openapi_output["x"] = _encode_unvalidated(_openapi_value.x))
    _openapi_value.control_objective isa Absent || (
        _openapi_output["control_objective"] =
            _encode_unvalidated(_openapi_value.control_objective)
    )
    _openapi_value.regulated_bus_number isa Absent || (
        _openapi_output["regulated_bus_number"] =
            _encode_unvalidated(_openapi_value.regulated_bus_number)
    )
    _openapi_value.control_limits isa Absent || (
        _openapi_output["control_limits"] =
            _encode_unvalidated(_openapi_value.control_limits)
    )
    _openapi_value.controlled_quantity_limits isa Absent || (
        _openapi_output["controlled_quantity_limits"] =
            _encode_unvalidated(_openapi_value.controlled_quantity_limits)
    )
    _openapi_value.number_of_tap_positions isa Absent || (
        _openapi_output["number_of_tap_positions"] =
            _encode_unvalidated(_openapi_value.number_of_tap_positions)
    )
    _openapi_value.rating isa Absent ||
        (_openapi_output["rating"] = _encode_unvalidated(_openapi_value.rating))
    _openapi_value.rating_b isa Absent ||
        (_openapi_output["rating_b"] = _encode_unvalidated(_openapi_value.rating_b))
    _openapi_value.rating_c isa Absent ||
        (_openapi_output["rating_c"] = _encode_unvalidated(_openapi_value.rating_c))
    _openapi_value.active_power_flow isa Absent || (
        _openapi_output["active_power_flow"] =
            _encode_unvalidated(_openapi_value.active_power_flow)
    )
    _openapi_value.reactive_power_flow isa Absent || (
        _openapi_output["reactive_power_flow"] =
            _encode_unvalidated(_openapi_value.reactive_power_flow)
    )
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode_unvalidated(_openapi_value.power_units))
    _openapi_value.base_voltage_primary isa Absent || (
        _openapi_output["base_voltage_primary"] =
            _encode_unvalidated(_openapi_value.base_voltage_primary)
    )
    _openapi_value.base_voltage_secondary isa Absent || (
        _openapi_output["base_voltage_secondary"] =
            _encode_unvalidated(_openapi_value.base_voltage_secondary)
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
_encode(_openapi_value::TransformerCircuit) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ef22c9427a47f63bd233.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding TransformerCircuit";
    direction=:neutral,
)

function _form_fields(_openapi_value::TransformerCircuit)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.tap isa Absent || push!(_openapi_output, "tap" => _openapi_value.tap)
    _openapi_value.alpha isa Absent ||
        push!(_openapi_output, "alpha" => _openapi_value.alpha)
    _openapi_value.parameter_units isa Absent ||
        push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.r isa Absent || push!(_openapi_output, "r" => _openapi_value.r)
    _openapi_value.x isa Absent || push!(_openapi_output, "x" => _openapi_value.x)
    _openapi_value.control_objective isa Absent ||
        push!(_openapi_output, "control_objective" => _openapi_value.control_objective)
    _openapi_value.regulated_bus_number isa Absent || push!(
        _openapi_output,
        "regulated_bus_number" => _openapi_value.regulated_bus_number,
    )
    _openapi_value.control_limits isa Absent ||
        push!(_openapi_output, "control_limits" => _openapi_value.control_limits)
    _openapi_value.controlled_quantity_limits isa Absent || push!(
        _openapi_output,
        "controlled_quantity_limits" => _openapi_value.controlled_quantity_limits,
    )
    _openapi_value.number_of_tap_positions isa Absent || push!(
        _openapi_output,
        "number_of_tap_positions" => _openapi_value.number_of_tap_positions,
    )
    _openapi_value.rating isa Absent ||
        push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.rating_b isa Absent ||
        push!(_openapi_output, "rating_b" => _openapi_value.rating_b)
    _openapi_value.rating_c isa Absent ||
        push!(_openapi_output, "rating_c" => _openapi_value.rating_c)
    _openapi_value.active_power_flow isa Absent ||
        push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.reactive_power_flow isa Absent ||
        push!(_openapi_output, "reactive_power_flow" => _openapi_value.reactive_power_flow)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.base_voltage_primary isa Absent || push!(
        _openapi_output,
        "base_voltage_primary" => _openapi_value.base_voltage_primary,
    )
    _openapi_value.base_voltage_secondary isa Absent || push!(
        _openapi_output,
        "base_voltage_secondary" => _openapi_value.base_voltage_secondary,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
