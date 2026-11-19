"""
    SimplifiedSingleCageInductionMachine

Parameters of 3-states three-phase single cage induction machine with quadratic torque-speed relationship It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `r_s`: Armature stator resistance. Units: pu.
  - `r_r`: Rotor resistance. Units: pu.
  - `x_ls`: Stator Leakage Reactance. Units: pu.
  - `x_lr`: Rotor Leakage Reactance. Units: pu.
  - `x_m`: Stator-Rotor Mutual Reactance. Units: pu.
  - `h`: Motor Inertia Constant [s]. Units: s.
  - `a`: Torque-Speed Quadratic Term
  - `b`: Torque-Speed Linear Term
  - `torque_ref`: Reference torque parameter
  - `b_shunt`: Susceptance Initialization Corrector Term
  - `base_power`: Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct SimplifiedSingleCageInductionMachine <: APIModel
    id::Int64
    name::String
    r_s::Float64
    r_r::Float64
    x_ls::Float64
    x_lr::Float64
    x_m::Float64
    h::Float64
    a::Float64
    b::Float64
    torque_ref::Float64
    b_shunt::Float64
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SimplifiedSingleCageInductionMachine}, value) =
    _decode(SimplifiedSingleCageInductionMachine, value, true)
function _decode(
    ::Type{SimplifiedSingleCageInductionMachine},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-709501a904afcff4c278.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SimplifiedSingleCageInductionMachine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SimplifiedSingleCageInductionMachine")
    _openapi_field_id = _decode_zoned(
        Int64,
        _required(_openapi_object, "id", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_name = _decode_zoned(
        String,
        _required(_openapi_object, "name", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_r_s = _decode_zoned(
        Float64,
        _required(_openapi_object, "R_s", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_r_r = _decode_zoned(
        Float64,
        _required(_openapi_object, "R_r", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_x_ls = _decode_zoned(
        Float64,
        _required(_openapi_object, "X_ls", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_x_lr = _decode_zoned(
        Float64,
        _required(_openapi_object, "X_lr", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_x_m = _decode_zoned(
        Float64,
        _required(_openapi_object, "X_m", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_h = _decode_zoned(
        Float64,
        _required(_openapi_object, "H", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_a = _decode_zoned(
        Float64,
        _required(_openapi_object, "A", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_b = _decode_zoned(
        Float64,
        _required(_openapi_object, "B", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_torque_ref = _decode_zoned(
        Float64,
        _required(_openapi_object, "torque_ref", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_b_shunt = _decode_zoned(
        Float64,
        _required(_openapi_object, "B_shunt", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_field_base_power = _decode_zoned(
        Float64,
        _required(_openapi_object, "base_power", "SimplifiedSingleCageInductionMachine"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "R_s",
            "R_r",
            "X_ls",
            "X_lr",
            "X_m",
            "H",
            "A",
            "B",
            "torque_ref",
            "B_shunt",
            "base_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return SimplifiedSingleCageInductionMachine(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        r_s=_openapi_field_r_s,
        r_r=_openapi_field_r_r,
        x_ls=_openapi_field_x_ls,
        x_lr=_openapi_field_x_lr,
        x_m=_openapi_field_x_m,
        h=_openapi_field_h,
        a=_openapi_field_a,
        b=_openapi_field_b,
        torque_ref=_openapi_field_torque_ref,
        b_shunt=_openapi_field_b_shunt,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SimplifiedSingleCageInductionMachine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.r_s isa Absent ||
        (_openapi_output["R_s"] = _encode_unvalidated(_openapi_value.r_s))
    _openapi_value.r_r isa Absent ||
        (_openapi_output["R_r"] = _encode_unvalidated(_openapi_value.r_r))
    _openapi_value.x_ls isa Absent ||
        (_openapi_output["X_ls"] = _encode_unvalidated(_openapi_value.x_ls))
    _openapi_value.x_lr isa Absent ||
        (_openapi_output["X_lr"] = _encode_unvalidated(_openapi_value.x_lr))
    _openapi_value.x_m isa Absent ||
        (_openapi_output["X_m"] = _encode_unvalidated(_openapi_value.x_m))
    _openapi_value.h isa Absent ||
        (_openapi_output["H"] = _encode_unvalidated(_openapi_value.h))
    _openapi_value.a isa Absent ||
        (_openapi_output["A"] = _encode_unvalidated(_openapi_value.a))
    _openapi_value.b isa Absent ||
        (_openapi_output["B"] = _encode_unvalidated(_openapi_value.b))
    _openapi_value.torque_ref isa Absent ||
        (_openapi_output["torque_ref"] = _encode_unvalidated(_openapi_value.torque_ref))
    _openapi_value.b_shunt isa Absent ||
        (_openapi_output["B_shunt"] = _encode_unvalidated(_openapi_value.b_shunt))
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
_encode(_openapi_value::SimplifiedSingleCageInductionMachine) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-709501a904afcff4c278.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SimplifiedSingleCageInductionMachine";
    direction=:neutral,
)

function _form_fields(_openapi_value::SimplifiedSingleCageInductionMachine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.r_s isa Absent || push!(_openapi_output, "R_s" => _openapi_value.r_s)
    _openapi_value.r_r isa Absent || push!(_openapi_output, "R_r" => _openapi_value.r_r)
    _openapi_value.x_ls isa Absent || push!(_openapi_output, "X_ls" => _openapi_value.x_ls)
    _openapi_value.x_lr isa Absent || push!(_openapi_output, "X_lr" => _openapi_value.x_lr)
    _openapi_value.x_m isa Absent || push!(_openapi_output, "X_m" => _openapi_value.x_m)
    _openapi_value.h isa Absent || push!(_openapi_output, "H" => _openapi_value.h)
    _openapi_value.a isa Absent || push!(_openapi_output, "A" => _openapi_value.a)
    _openapi_value.b isa Absent || push!(_openapi_output, "B" => _openapi_value.b)
    _openapi_value.torque_ref isa Absent ||
        push!(_openapi_output, "torque_ref" => _openapi_value.torque_ref)
    _openapi_value.b_shunt isa Absent ||
        push!(_openapi_output, "B_shunt" => _openapi_value.b_shunt)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
