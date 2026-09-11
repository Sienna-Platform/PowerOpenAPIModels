"""
    SimpleFullMachine

Parameter of a full order flux stator-rotor model without zero sequence flux in the stator. The derivative of stator fluxes (ψd and ψq) is neglected. This is standard when transmission network dynamics is neglected. Only one q-axis damping circuit is considered. All per unit are in machine per unit. Refer to Chapter 3 of Power System Stability and Control by P. Kundur or Chapter 11 of Power System Dynamics: Stability and Control, by J. Machowski, J. Bialek and J. Bumby, for more details. Note that the models are somewhat different (but equivalent) due to the different Park Transformation used in both books

  - `l_1d`: Inductance of the d-axis rotor damping circuit
  - `l_1q`: Inductance of the q-axis rotor damping circuit
  - `l_ad`: Mutual inductance between stator winding and rotor field (and damping) winding inductance on d-axis
  - `l_aq`: Mutual inductance between stator winding and rotor damping winding inductance on q-axi
  - `l_d`: Inductance of fictitious damping that represent the effect of the three-phase stator winding in the d-axis of the rotor, in per unit. This value is denoted as Lad + Ll in Kundur (and Ld in Machowski)
  - `l_f1d`: Mutual inductance between rotor field winding and rotor damping winding inductance on d-axis
  - `l_ff`: Field rotor winding inductance
  - `l_q`: Inductance of fictitious damping that represent the effect of the three-phase stator winding in the q-axis of the rotor, in per unit. This value is denoted as Laq + Ll in Kundur
  - `r`: Resistance after EMF
  - `r_1d`: Damping rotor winding resistance on d-axis, denoted as RD in Machowski
  - `r_1q`: Damping rotor winding resistance on q-axis, denoted as RQ in Machowski
  - `r_f`: Field motor winding resistance
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct SimpleFullMachine <: APIModel
    l_1d::Float64
    l_1q::Float64
    l_ad::Float64
    l_aq::Float64
    l_d::Float64
    l_f1d::Float64
    l_ff::Float64
    l_q::Float64
    r::Float64
    r_1d::Float64
    r_1q::Float64
    r_f::Float64
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SimpleFullMachine}, value) = _decode(SimpleFullMachine, value, true)
function _decode(::Type{SimpleFullMachine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/SimpleFullMachine",
        ),
        _openapi_raw,
        "decoding SimpleFullMachine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SimpleFullMachine")
    _openapi_field_l_1d = _decode(
        Float64,
        _required(_openapi_object, "L_1d", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_l_1q = _decode(
        Float64,
        _required(_openapi_object, "L_1q", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_l_ad = _decode(
        Float64,
        _required(_openapi_object, "L_ad", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_l_aq = _decode(
        Float64,
        _required(_openapi_object, "L_aq", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_l_d = _decode(
        Float64,
        _required(_openapi_object, "L_d", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_l_f1d = _decode(
        Float64,
        _required(_openapi_object, "L_f1d", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_l_ff = _decode(
        Float64,
        _required(_openapi_object, "L_ff", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_l_q = _decode(
        Float64,
        _required(_openapi_object, "L_q", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_r = _decode(
        Float64,
        _required(_openapi_object, "R", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_r_1d = _decode(
        Float64,
        _required(_openapi_object, "R_1d", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_r_1q = _decode(
        Float64,
        _required(_openapi_object, "R_1q", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_r_f = _decode(
        Float64,
        _required(_openapi_object, "R_f", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "SimpleFullMachine"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "L_1d",
            "L_1q",
            "L_ad",
            "L_aq",
            "L_d",
            "L_f1d",
            "L_ff",
            "L_q",
            "R",
            "R_1d",
            "R_1q",
            "R_f",
            "id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return SimpleFullMachine(;
        l_1d=_openapi_field_l_1d,
        l_1q=_openapi_field_l_1q,
        l_ad=_openapi_field_l_ad,
        l_aq=_openapi_field_l_aq,
        l_d=_openapi_field_l_d,
        l_f1d=_openapi_field_l_f1d,
        l_ff=_openapi_field_l_ff,
        l_q=_openapi_field_l_q,
        r=_openapi_field_r,
        r_1d=_openapi_field_r_1d,
        r_1q=_openapi_field_r_1q,
        r_f=_openapi_field_r_f,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::SimpleFullMachine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.l_1d isa Absent ||
        (_openapi_output["L_1d"] = _encode(_openapi_value.l_1d))
    _openapi_value.l_1q isa Absent ||
        (_openapi_output["L_1q"] = _encode(_openapi_value.l_1q))
    _openapi_value.l_ad isa Absent ||
        (_openapi_output["L_ad"] = _encode(_openapi_value.l_ad))
    _openapi_value.l_aq isa Absent ||
        (_openapi_output["L_aq"] = _encode(_openapi_value.l_aq))
    _openapi_value.l_d isa Absent || (_openapi_output["L_d"] = _encode(_openapi_value.l_d))
    _openapi_value.l_f1d isa Absent ||
        (_openapi_output["L_f1d"] = _encode(_openapi_value.l_f1d))
    _openapi_value.l_ff isa Absent ||
        (_openapi_output["L_ff"] = _encode(_openapi_value.l_ff))
    _openapi_value.l_q isa Absent || (_openapi_output["L_q"] = _encode(_openapi_value.l_q))
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.r_1d isa Absent ||
        (_openapi_output["R_1d"] = _encode(_openapi_value.r_1d))
    _openapi_value.r_1q isa Absent ||
        (_openapi_output["R_1q"] = _encode(_openapi_value.r_1q))
    _openapi_value.r_f isa Absent || (_openapi_output["R_f"] = _encode(_openapi_value.r_f))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
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
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/SimpleFullMachine",
        ),
        _openapi_output,
        "encoding SimpleFullMachine";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::SimpleFullMachine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.l_1d isa Absent || push!(_openapi_output, "L_1d" => _openapi_value.l_1d)
    _openapi_value.l_1q isa Absent || push!(_openapi_output, "L_1q" => _openapi_value.l_1q)
    _openapi_value.l_ad isa Absent || push!(_openapi_output, "L_ad" => _openapi_value.l_ad)
    _openapi_value.l_aq isa Absent || push!(_openapi_output, "L_aq" => _openapi_value.l_aq)
    _openapi_value.l_d isa Absent || push!(_openapi_output, "L_d" => _openapi_value.l_d)
    _openapi_value.l_f1d isa Absent ||
        push!(_openapi_output, "L_f1d" => _openapi_value.l_f1d)
    _openapi_value.l_ff isa Absent || push!(_openapi_output, "L_ff" => _openapi_value.l_ff)
    _openapi_value.l_q isa Absent || push!(_openapi_output, "L_q" => _openapi_value.l_q)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.r_1d isa Absent || push!(_openapi_output, "R_1d" => _openapi_value.r_1d)
    _openapi_value.r_1q isa Absent || push!(_openapi_output, "R_1q" => _openapi_value.r_1q)
    _openapi_value.r_f isa Absent || push!(_openapi_output, "R_f" => _openapi_value.r_f)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
