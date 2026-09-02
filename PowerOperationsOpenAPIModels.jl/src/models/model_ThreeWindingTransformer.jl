@doc "    ThreeWindingTransformer\n\nA three-winding transformer, modeled as an equivalent star: each referenced `TransformerCircuit` connects a terminal bus to the star (hidden) bus and carries that winding's series electrical data; availability is circuit-level. The pairwise measured impedances `r_12`/`x_12`, `r_23`/`x_23`, `r_31`/`x_31` (PSS/E CZ = 1, each in pu on the corresponding `base_power_12`/`base_power_23`/`base_power_31` and referenced to the first-index winding's base voltage) are optional and must be set together or all be absent; the star-leg impedances derived from them at parse time live on the circuits and are not synced back. Power-flow and Ybus assembly read the per-circuit star-leg impedances, not the pairwise fields. The model is described in Chapter 3.6 of J.D. Glover, M.S. Sarma and T. Overbye: Power Systems Analysis and Design.\n\n- `admittance_units`: Unit basis for the magnetizing_shunt admittance.\n- `base_power_12`: Base power for per unitization for primary-secondary windings. Units: MVA.\n- `base_power_23`: Base power for per unitization for secondary-tertiary windings. Units: MVA.\n- `base_power_31`: Base power for per unitization for tertiary-primary windings. Units: MVA.\n- `id`: Unique integer identifier for this component.\n- `magnetizing_shunt`: Magnetizing shunt admittance referenced to the primary circuit's base voltage. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr, COMPONENT_BASE: pu .\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `parameter_units`: Unit basis for the pairwise measured impedance fields (r_12, x_12, r_23, x_23, r_31, x_31). PSS/E supplies a single CZ flag for the whole three-winding transformer record, so one basis governs all three winding pairs.\n- `primary_circuit`: The primary `TransformerCircuit` connecting the primary bus to the star bus.\n- `r_12`: Measured resistance, referenced to the primary winding's base voltage, from primary to secondary windings (R1-2 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `r_23`: Measured resistance, referenced to the secondary winding's base voltage, from secondary to tertiary windings (R2-3 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `r_31`: Measured resistance, referenced to the tertiary winding's base voltage, from tertiary to primary windings (R3-1 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `secondary_circuit`: The secondary `TransformerCircuit` connecting the secondary bus to the star bus.\n- `shunt_location`: Placement of `magnetizing_shunt` in the equivalent star model.\n- `star_bus`: Star (hidden) Bus that this component (equivalent model) is connected to.\n- `tertiary_circuit`: The tertiary `TransformerCircuit` connecting the tertiary bus to the star bus.\n- `x_12`: Measured reactance, referenced to the primary winding's base voltage, from primary to secondary windings (X1-2 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `x_23`: Measured reactance, referenced to the secondary winding's base voltage, from secondary to tertiary windings (X2-3 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `x_31`: Measured reactance, referenced to the tertiary winding's base voltage, from tertiary to primary windings (X3-1 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu ."
Base.@kwdef struct ThreeWindingTransformer
    admittance_units::Union{Absent,Nothing,ThreeWindingTransformerAdmittanceUnits} = ABSENT
    base_power_12::Union{Absent,Float64,Nothing} = ABSENT
    base_power_23::Union{Absent,Float64,Nothing} = ABSENT
    base_power_31::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    magnetizing_shunt::Union{Absent,Nothing,ThreeWindingTransformerMagnetizingShunt} = ABSENT
    name::String
    parameter_units::Union{Absent,Nothing,ThreeWindingTransformerParameterUnits} = ABSENT
    primary_circuit::Int64
    r_12::Union{Absent,Float64,Nothing} = ABSENT
    r_23::Union{Absent,Float64,Nothing} = ABSENT
    r_31::Union{Absent,Float64,Nothing} = ABSENT
    secondary_circuit::Int64
    shunt_location::Union{Absent,Nothing,ThreeWindingTransformerShuntLocation2} = ABSENT
    star_bus::Int64
    tertiary_circuit::Int64
    x_12::Union{Absent,Float64,Nothing} = ABSENT
    x_23::Union{Absent,Float64,Nothing} = ABSENT
    x_31::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ThreeWindingTransformer}, value) = _decode(ThreeWindingTransformer, value, true)
function _decode(::Type{ThreeWindingTransformer}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThreeWindingTransformer"), _openapi_raw, "decoding ThreeWindingTransformer"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ThreeWindingTransformer")
    _openapi_field_admittance_units = haskey(_openapi_object, "admittance_units") ? _decode(Union{Absent,Nothing,ThreeWindingTransformerAdmittanceUnits}, _openapi_object["admittance_units"], _openapi_validate) : ABSENT
    _openapi_field_base_power_12 = haskey(_openapi_object, "base_power_12") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_power_12"], _openapi_validate) : ABSENT
    _openapi_field_base_power_23 = haskey(_openapi_object, "base_power_23") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_power_23"], _openapi_validate) : ABSENT
    _openapi_field_base_power_31 = haskey(_openapi_object, "base_power_31") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_power_31"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "ThreeWindingTransformer"), _openapi_validate)
    _openapi_field_magnetizing_shunt = haskey(_openapi_object, "magnetizing_shunt") ? _decode(Union{Absent,Nothing,ThreeWindingTransformerMagnetizingShunt}, _openapi_object["magnetizing_shunt"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "ThreeWindingTransformer"), _openapi_validate)
    _openapi_field_parameter_units = haskey(_openapi_object, "parameter_units") ? _decode(Union{Absent,Nothing,ThreeWindingTransformerParameterUnits}, _openapi_object["parameter_units"], _openapi_validate) : ABSENT
    _openapi_field_primary_circuit = _decode(Int64, _required(_openapi_object, "primary_circuit", "ThreeWindingTransformer"), _openapi_validate)
    _openapi_field_r_12 = haskey(_openapi_object, "r_12") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["r_12"], _openapi_validate) : ABSENT
    _openapi_field_r_23 = haskey(_openapi_object, "r_23") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["r_23"], _openapi_validate) : ABSENT
    _openapi_field_r_31 = haskey(_openapi_object, "r_31") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["r_31"], _openapi_validate) : ABSENT
    _openapi_field_secondary_circuit = _decode(Int64, _required(_openapi_object, "secondary_circuit", "ThreeWindingTransformer"), _openapi_validate)
    _openapi_field_shunt_location = haskey(_openapi_object, "shunt_location") ? _decode(Union{Absent,Nothing,ThreeWindingTransformerShuntLocation2}, _openapi_object["shunt_location"], _openapi_validate) : ABSENT
    _openapi_field_star_bus = _decode(Int64, _required(_openapi_object, "star_bus", "ThreeWindingTransformer"), _openapi_validate)
    _openapi_field_tertiary_circuit = _decode(Int64, _required(_openapi_object, "tertiary_circuit", "ThreeWindingTransformer"), _openapi_validate)
    _openapi_field_x_12 = haskey(_openapi_object, "x_12") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["x_12"], _openapi_validate) : ABSENT
    _openapi_field_x_23 = haskey(_openapi_object, "x_23") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["x_23"], _openapi_validate) : ABSENT
    _openapi_field_x_31 = haskey(_openapi_object, "x_31") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["x_31"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("admittance_units","base_power_12","base_power_23","base_power_31","id","magnetizing_shunt","name","parameter_units","primary_circuit","r_12","r_23","r_31","secondary_circuit","shunt_location","star_bus","tertiary_circuit","x_12","x_23","x_31") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ThreeWindingTransformer(; admittance_units = _openapi_field_admittance_units, base_power_12 = _openapi_field_base_power_12, base_power_23 = _openapi_field_base_power_23, base_power_31 = _openapi_field_base_power_31, id = _openapi_field_id, magnetizing_shunt = _openapi_field_magnetizing_shunt, name = _openapi_field_name, parameter_units = _openapi_field_parameter_units, primary_circuit = _openapi_field_primary_circuit, r_12 = _openapi_field_r_12, r_23 = _openapi_field_r_23, r_31 = _openapi_field_r_31, secondary_circuit = _openapi_field_secondary_circuit, shunt_location = _openapi_field_shunt_location, star_bus = _openapi_field_star_bus, tertiary_circuit = _openapi_field_tertiary_circuit, x_12 = _openapi_field_x_12, x_23 = _openapi_field_x_23, x_31 = _openapi_field_x_31, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ThreeWindingTransformer)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.admittance_units isa Absent || (_openapi_output["admittance_units"] = _encode(_openapi_value.admittance_units))
    _openapi_value.base_power_12 isa Absent || (_openapi_output["base_power_12"] = _encode(_openapi_value.base_power_12))
    _openapi_value.base_power_23 isa Absent || (_openapi_output["base_power_23"] = _encode(_openapi_value.base_power_23))
    _openapi_value.base_power_31 isa Absent || (_openapi_output["base_power_31"] = _encode(_openapi_value.base_power_31))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.magnetizing_shunt isa Absent || (_openapi_output["magnetizing_shunt"] = _encode(_openapi_value.magnetizing_shunt))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.parameter_units isa Absent || (_openapi_output["parameter_units"] = _encode(_openapi_value.parameter_units))
    _openapi_value.primary_circuit isa Absent || (_openapi_output["primary_circuit"] = _encode(_openapi_value.primary_circuit))
    _openapi_value.r_12 isa Absent || (_openapi_output["r_12"] = _encode(_openapi_value.r_12))
    _openapi_value.r_23 isa Absent || (_openapi_output["r_23"] = _encode(_openapi_value.r_23))
    _openapi_value.r_31 isa Absent || (_openapi_output["r_31"] = _encode(_openapi_value.r_31))
    _openapi_value.secondary_circuit isa Absent || (_openapi_output["secondary_circuit"] = _encode(_openapi_value.secondary_circuit))
    _openapi_value.shunt_location isa Absent || (_openapi_output["shunt_location"] = _encode(_openapi_value.shunt_location))
    _openapi_value.star_bus isa Absent || (_openapi_output["star_bus"] = _encode(_openapi_value.star_bus))
    _openapi_value.tertiary_circuit isa Absent || (_openapi_output["tertiary_circuit"] = _encode(_openapi_value.tertiary_circuit))
    _openapi_value.x_12 isa Absent || (_openapi_output["x_12"] = _encode(_openapi_value.x_12))
    _openapi_value.x_23 isa Absent || (_openapi_output["x_23"] = _encode(_openapi_value.x_23))
    _openapi_value.x_31 isa Absent || (_openapi_output["x_31"] = _encode(_openapi_value.x_31))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThreeWindingTransformer"), _openapi_output, "encoding ThreeWindingTransformer"; direction = :neutral)
end

function _form_fields(_openapi_value::ThreeWindingTransformer)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.admittance_units isa Absent || push!(_openapi_output, "admittance_units" => _openapi_value.admittance_units)
    _openapi_value.base_power_12 isa Absent || push!(_openapi_output, "base_power_12" => _openapi_value.base_power_12)
    _openapi_value.base_power_23 isa Absent || push!(_openapi_output, "base_power_23" => _openapi_value.base_power_23)
    _openapi_value.base_power_31 isa Absent || push!(_openapi_output, "base_power_31" => _openapi_value.base_power_31)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.magnetizing_shunt isa Absent || push!(_openapi_output, "magnetizing_shunt" => _openapi_value.magnetizing_shunt)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.parameter_units isa Absent || push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.primary_circuit isa Absent || push!(_openapi_output, "primary_circuit" => _openapi_value.primary_circuit)
    _openapi_value.r_12 isa Absent || push!(_openapi_output, "r_12" => _openapi_value.r_12)
    _openapi_value.r_23 isa Absent || push!(_openapi_output, "r_23" => _openapi_value.r_23)
    _openapi_value.r_31 isa Absent || push!(_openapi_output, "r_31" => _openapi_value.r_31)
    _openapi_value.secondary_circuit isa Absent || push!(_openapi_output, "secondary_circuit" => _openapi_value.secondary_circuit)
    _openapi_value.shunt_location isa Absent || push!(_openapi_output, "shunt_location" => _openapi_value.shunt_location)
    _openapi_value.star_bus isa Absent || push!(_openapi_output, "star_bus" => _openapi_value.star_bus)
    _openapi_value.tertiary_circuit isa Absent || push!(_openapi_output, "tertiary_circuit" => _openapi_value.tertiary_circuit)
    _openapi_value.x_12 isa Absent || push!(_openapi_output, "x_12" => _openapi_value.x_12)
    _openapi_value.x_23 isa Absent || push!(_openapi_output, "x_23" => _openapi_value.x_23)
    _openapi_value.x_31 isa Absent || push!(_openapi_output, "x_31" => _openapi_value.x_31)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
