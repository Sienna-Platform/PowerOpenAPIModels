@doc "    TwoWindingTransformer\n\nA two-winding transformer connecting two buses.\n\nAll series electrical data — the modeled arc, tap, phase shift, series impedance `r`/`x`, ratings, per-winding base power, base voltages, and control — lives on the single `TransformerCircuit` referenced by `circuit`; availability is circuit-level. The `magnetizing_shunt` admittance and its `shunt_location` are transformer-level. The model uses an equivalent circuit assuming the impedance is on the high-voltage side and allocates iron losses and magnetizing susceptance according to `shunt_location`. The transformer's device base is the circuit's `base_power`.\n\n- `admittance_units`: Unit basis for the magnetizing_shunt admittance.\n- `circuit`: The `TransformerCircuit` carrying this transformer's series electrical data.\n- `id`: Unique integer identifier for this component.\n- `magnetizing_shunt`: Magnetizing shunt admittance referenced to the circuit's `base_voltage_primary`. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr, COMPONENT_BASE: pu .\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `shunt_location`: Placement of `magnetizing_shunt` on the two sides of the circuit arc."
Base.@kwdef struct TwoWindingTransformer
    admittance_units::Union{Absent,Nothing,TwoWindingTransformerAdmittanceUnits} = ABSENT
    circuit::Int64
    id::Int64
    magnetizing_shunt::Union{Absent,Nothing,TwoWindingTransformerMagnetizingShunt} = ABSENT
    name::String
    shunt_location::Union{Absent,Nothing,TwoWindingTransformerShuntLocation2} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TwoWindingTransformer}, value) = _decode(TwoWindingTransformer, value, true)
function _decode(::Type{TwoWindingTransformer}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoWindingTransformer"), _openapi_raw, "decoding TwoWindingTransformer"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TwoWindingTransformer")
    _openapi_field_admittance_units = haskey(_openapi_object, "admittance_units") ? _decode(Union{Absent,Nothing,TwoWindingTransformerAdmittanceUnits}, _openapi_object["admittance_units"], _openapi_validate) : ABSENT
    _openapi_field_circuit = _decode(Int64, _required(_openapi_object, "circuit", "TwoWindingTransformer"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TwoWindingTransformer"), _openapi_validate)
    _openapi_field_magnetizing_shunt = haskey(_openapi_object, "magnetizing_shunt") ? _decode(Union{Absent,Nothing,TwoWindingTransformerMagnetizingShunt}, _openapi_object["magnetizing_shunt"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "TwoWindingTransformer"), _openapi_validate)
    _openapi_field_shunt_location = haskey(_openapi_object, "shunt_location") ? _decode(Union{Absent,Nothing,TwoWindingTransformerShuntLocation2}, _openapi_object["shunt_location"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("admittance_units","circuit","id","magnetizing_shunt","name","shunt_location") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TwoWindingTransformer(; admittance_units = _openapi_field_admittance_units, circuit = _openapi_field_circuit, id = _openapi_field_id, magnetizing_shunt = _openapi_field_magnetizing_shunt, name = _openapi_field_name, shunt_location = _openapi_field_shunt_location, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TwoWindingTransformer)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.admittance_units isa Absent || (_openapi_output["admittance_units"] = _encode(_openapi_value.admittance_units))
    _openapi_value.circuit isa Absent || (_openapi_output["circuit"] = _encode(_openapi_value.circuit))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.magnetizing_shunt isa Absent || (_openapi_output["magnetizing_shunt"] = _encode(_openapi_value.magnetizing_shunt))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.shunt_location isa Absent || (_openapi_output["shunt_location"] = _encode(_openapi_value.shunt_location))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoWindingTransformer"), _openapi_output, "encoding TwoWindingTransformer"; direction = :neutral)
end

function _form_fields(_openapi_value::TwoWindingTransformer)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.admittance_units isa Absent || push!(_openapi_output, "admittance_units" => _openapi_value.admittance_units)
    _openapi_value.circuit isa Absent || push!(_openapi_output, "circuit" => _openapi_value.circuit)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.magnetizing_shunt isa Absent || push!(_openapi_output, "magnetizing_shunt" => _openapi_value.magnetizing_shunt)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.shunt_location isa Absent || push!(_openapi_output, "shunt_location" => _openapi_value.shunt_location)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
