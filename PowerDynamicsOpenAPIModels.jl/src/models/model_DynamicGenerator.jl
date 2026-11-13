"""
    DynamicGenerator

Dynamic response model of a synchronous generator. It names five function blocks by id: a synchronous machine model, a shaft, an excitation system, a turbine governor, and a power system stabilizer. It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of the generator's data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `frequency_ref`: Frequency reference set-point, in natural units. Usually equal to the system frequency. Units: Hz.
  - `synchronous_machine_dynamics`: ID of the SynchronousMachineDynamics function block: the machine model for the electromagnetic dynamics.
  - `shaft`: ID of the Shaft function block: the shaft model for the electromechanical dynamics.
  - `excitation_system_dynamics`: ID of the ExcitationSystemDynamics function block: the excitation system model.
  - `turbine_governor_dynamics`: ID of the TurbineGovernorDynamics function block: the prime mover and turbine governor model.
  - `power_system_stabilizer_dynamics`: ID of the PowerSystemStabilizerDynamics function block: the power system stabilizer model.
  - `base_power`: Base power for the per-unit parameters of the referenced function blocks. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct DynamicGenerator <: APIModel
    id::Int64
    name::String
    frequency_ref::Float64
    synchronous_machine_dynamics::Int64
    shaft::Int64
    excitation_system_dynamics::Int64
    turbine_governor_dynamics::Int64
    power_system_stabilizer_dynamics::Int64
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DynamicGenerator}, value) = _decode(DynamicGenerator, value, true)
function _decode(::Type{DynamicGenerator}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-3da498ac28b4c62c3c27.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding DynamicGenerator";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DynamicGenerator")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "DynamicGenerator"), false)
    _openapi_field_name =
        _decode_zoned(String, _required(_openapi_object, "name", "DynamicGenerator"), false)
    _openapi_field_frequency_ref = _decode_zoned(
        Float64,
        _required(_openapi_object, "frequency_ref", "DynamicGenerator"),
        false,
    )
    _openapi_field_synchronous_machine_dynamics = _decode_zoned(
        Int64,
        _required(_openapi_object, "synchronous_machine_dynamics", "DynamicGenerator"),
        false,
    )
    _openapi_field_shaft =
        _decode_zoned(Int64, _required(_openapi_object, "shaft", "DynamicGenerator"), false)
    _openapi_field_excitation_system_dynamics = _decode_zoned(
        Int64,
        _required(_openapi_object, "excitation_system_dynamics", "DynamicGenerator"),
        false,
    )
    _openapi_field_turbine_governor_dynamics = _decode_zoned(
        Int64,
        _required(_openapi_object, "turbine_governor_dynamics", "DynamicGenerator"),
        false,
    )
    _openapi_field_power_system_stabilizer_dynamics = _decode_zoned(
        Int64,
        _required(_openapi_object, "power_system_stabilizer_dynamics", "DynamicGenerator"),
        false,
    )
    _openapi_field_base_power = _decode_zoned(
        Float64,
        _required(_openapi_object, "base_power", "DynamicGenerator"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "frequency_ref",
            "synchronous_machine_dynamics",
            "shaft",
            "excitation_system_dynamics",
            "turbine_governor_dynamics",
            "power_system_stabilizer_dynamics",
            "base_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return DynamicGenerator(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        frequency_ref=_openapi_field_frequency_ref,
        synchronous_machine_dynamics=_openapi_field_synchronous_machine_dynamics,
        shaft=_openapi_field_shaft,
        excitation_system_dynamics=_openapi_field_excitation_system_dynamics,
        turbine_governor_dynamics=_openapi_field_turbine_governor_dynamics,
        power_system_stabilizer_dynamics=_openapi_field_power_system_stabilizer_dynamics,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::DynamicGenerator)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.frequency_ref isa Absent || (
        _openapi_output["frequency_ref"] =
            _encode_unvalidated(_openapi_value.frequency_ref)
    )
    _openapi_value.synchronous_machine_dynamics isa Absent || (
        _openapi_output["synchronous_machine_dynamics"] =
            _encode_unvalidated(_openapi_value.synchronous_machine_dynamics)
    )
    _openapi_value.shaft isa Absent ||
        (_openapi_output["shaft"] = _encode_unvalidated(_openapi_value.shaft))
    _openapi_value.excitation_system_dynamics isa Absent || (
        _openapi_output["excitation_system_dynamics"] =
            _encode_unvalidated(_openapi_value.excitation_system_dynamics)
    )
    _openapi_value.turbine_governor_dynamics isa Absent || (
        _openapi_output["turbine_governor_dynamics"] =
            _encode_unvalidated(_openapi_value.turbine_governor_dynamics)
    )
    _openapi_value.power_system_stabilizer_dynamics isa Absent || (
        _openapi_output["power_system_stabilizer_dynamics"] =
            _encode_unvalidated(_openapi_value.power_system_stabilizer_dynamics)
    )
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
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
_encode(_openapi_value::DynamicGenerator) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-3da498ac28b4c62c3c27.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding DynamicGenerator";
    direction=:neutral,
)

function _form_fields(_openapi_value::DynamicGenerator)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.frequency_ref isa Absent ||
        push!(_openapi_output, "frequency_ref" => _openapi_value.frequency_ref)
    _openapi_value.synchronous_machine_dynamics isa Absent || push!(
        _openapi_output,
        "synchronous_machine_dynamics" => _openapi_value.synchronous_machine_dynamics,
    )
    _openapi_value.shaft isa Absent ||
        push!(_openapi_output, "shaft" => _openapi_value.shaft)
    _openapi_value.excitation_system_dynamics isa Absent || push!(
        _openapi_output,
        "excitation_system_dynamics" => _openapi_value.excitation_system_dynamics,
    )
    _openapi_value.turbine_governor_dynamics isa Absent || push!(
        _openapi_output,
        "turbine_governor_dynamics" => _openapi_value.turbine_governor_dynamics,
    )
    _openapi_value.power_system_stabilizer_dynamics isa Absent || push!(
        _openapi_output,
        "power_system_stabilizer_dynamics" =>
            _openapi_value.power_system_stabilizer_dynamics,
    )
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
