"""
    FiveMassShaft

Parameters of 5 mass-spring shaft model. It contains a High-Pressure (HP) steam turbine, Intermediate-Pressure (IP) steam turbine, Low-Pressure (LP) steam turbine, the Rotor and an Exciter (EX) mover

  - `id`: Unique integer identifier for this component
  - `h`: Rotor inertia constant in MWs/MVA
  - `h_hp`: High pressure turbine inertia constant in MWs/MVA
  - `h_ip`: Intermediate pressure turbine inertia constant in MWs/MVA
  - `h_lp`: Low pressure turbine inertia constant in MWs/MVA
  - `h_ex`: Exciter inertia constant in MWs/MVA
  - `d`: Rotor natural damping
  - `d_hp`: High pressure turbine natural damping
  - `d_ip`: Intermediate pressure turbine natural damping
  - `d_lp`: Low pressure turbine natural damping
  - `d_ex`: Exciter natural damping
  - `d_12`: High-intermediate pressure turbine damping
  - `d_23`: Intermediate-low pressure turbine damping
  - `d_34`: Low pressure turbine-rotor damping
  - `d_45`: Rotor-exciter damping
  - `k_hp`: High pressure turbine angle coefficient
  - `k_ip`: Intermediate pressure turbine angle coefficient
  - `k_lp`: Low pressure turbine angle coefficient
  - `k_ex`: Exciter angle coefficient
"""
Base.@kwdef struct FiveMassShaft <: APIModel
    id::Int64
    h::Float64
    h_hp::Float64
    h_ip::Float64
    h_lp::Float64
    h_ex::Float64
    d::Float64
    d_hp::Float64
    d_ip::Float64
    d_lp::Float64
    d_ex::Float64
    d_12::Float64
    d_23::Float64
    d_34::Float64
    d_45::Float64
    k_hp::Float64
    k_ip::Float64
    k_lp::Float64
    k_ex::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{FiveMassShaft}, value) = _decode(FiveMassShaft, value, true)
function _decode(::Type{FiveMassShaft}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-d30e01cebb9b9c6268bb.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding FiveMassShaft";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "FiveMassShaft")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "FiveMassShaft"), _openapi_validate)
    _openapi_field_h = _decode(
        Float64,
        _required(_openapi_object, "H", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_h_hp = _decode(
        Float64,
        _required(_openapi_object, "H_hp", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_h_ip = _decode(
        Float64,
        _required(_openapi_object, "H_ip", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_h_lp = _decode(
        Float64,
        _required(_openapi_object, "H_lp", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_h_ex = _decode(
        Float64,
        _required(_openapi_object, "H_ex", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d = _decode(
        Float64,
        _required(_openapi_object, "D", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d_hp = _decode(
        Float64,
        _required(_openapi_object, "D_hp", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d_ip = _decode(
        Float64,
        _required(_openapi_object, "D_ip", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d_lp = _decode(
        Float64,
        _required(_openapi_object, "D_lp", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d_ex = _decode(
        Float64,
        _required(_openapi_object, "D_ex", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d_12 = _decode(
        Float64,
        _required(_openapi_object, "D_12", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d_23 = _decode(
        Float64,
        _required(_openapi_object, "D_23", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d_34 = _decode(
        Float64,
        _required(_openapi_object, "D_34", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_d_45 = _decode(
        Float64,
        _required(_openapi_object, "D_45", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_k_hp = _decode(
        Float64,
        _required(_openapi_object, "K_hp", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_k_ip = _decode(
        Float64,
        _required(_openapi_object, "K_ip", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_k_lp = _decode(
        Float64,
        _required(_openapi_object, "K_lp", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_field_k_ex = _decode(
        Float64,
        _required(_openapi_object, "K_ex", "FiveMassShaft"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "H",
            "H_hp",
            "H_ip",
            "H_lp",
            "H_ex",
            "D",
            "D_hp",
            "D_ip",
            "D_lp",
            "D_ex",
            "D_12",
            "D_23",
            "D_34",
            "D_45",
            "K_hp",
            "K_ip",
            "K_lp",
            "K_ex",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return FiveMassShaft(;
        id=_openapi_field_id,
        h=_openapi_field_h,
        h_hp=_openapi_field_h_hp,
        h_ip=_openapi_field_h_ip,
        h_lp=_openapi_field_h_lp,
        h_ex=_openapi_field_h_ex,
        d=_openapi_field_d,
        d_hp=_openapi_field_d_hp,
        d_ip=_openapi_field_d_ip,
        d_lp=_openapi_field_d_lp,
        d_ex=_openapi_field_d_ex,
        d_12=_openapi_field_d_12,
        d_23=_openapi_field_d_23,
        d_34=_openapi_field_d_34,
        d_45=_openapi_field_d_45,
        k_hp=_openapi_field_k_hp,
        k_ip=_openapi_field_k_ip,
        k_lp=_openapi_field_k_lp,
        k_ex=_openapi_field_k_ex,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::FiveMassShaft)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.h isa Absent || (_openapi_output["H"] = _encode(_openapi_value.h))
    _openapi_value.h_hp isa Absent ||
        (_openapi_output["H_hp"] = _encode(_openapi_value.h_hp))
    _openapi_value.h_ip isa Absent ||
        (_openapi_output["H_ip"] = _encode(_openapi_value.h_ip))
    _openapi_value.h_lp isa Absent ||
        (_openapi_output["H_lp"] = _encode(_openapi_value.h_lp))
    _openapi_value.h_ex isa Absent ||
        (_openapi_output["H_ex"] = _encode(_openapi_value.h_ex))
    _openapi_value.d isa Absent || (_openapi_output["D"] = _encode(_openapi_value.d))
    _openapi_value.d_hp isa Absent ||
        (_openapi_output["D_hp"] = _encode(_openapi_value.d_hp))
    _openapi_value.d_ip isa Absent ||
        (_openapi_output["D_ip"] = _encode(_openapi_value.d_ip))
    _openapi_value.d_lp isa Absent ||
        (_openapi_output["D_lp"] = _encode(_openapi_value.d_lp))
    _openapi_value.d_ex isa Absent ||
        (_openapi_output["D_ex"] = _encode(_openapi_value.d_ex))
    _openapi_value.d_12 isa Absent ||
        (_openapi_output["D_12"] = _encode(_openapi_value.d_12))
    _openapi_value.d_23 isa Absent ||
        (_openapi_output["D_23"] = _encode(_openapi_value.d_23))
    _openapi_value.d_34 isa Absent ||
        (_openapi_output["D_34"] = _encode(_openapi_value.d_34))
    _openapi_value.d_45 isa Absent ||
        (_openapi_output["D_45"] = _encode(_openapi_value.d_45))
    _openapi_value.k_hp isa Absent ||
        (_openapi_output["K_hp"] = _encode(_openapi_value.k_hp))
    _openapi_value.k_ip isa Absent ||
        (_openapi_output["K_ip"] = _encode(_openapi_value.k_ip))
    _openapi_value.k_lp isa Absent ||
        (_openapi_output["K_lp"] = _encode(_openapi_value.k_lp))
    _openapi_value.k_ex isa Absent ||
        (_openapi_output["K_ex"] = _encode(_openapi_value.k_ex))
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
            resource="https://openapi.invalid/schema/external-d30e01cebb9b9c6268bb.json",
            pointer="",
        ),
        _openapi_output,
        "encoding FiveMassShaft";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::FiveMassShaft)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.h isa Absent || push!(_openapi_output, "H" => _openapi_value.h)
    _openapi_value.h_hp isa Absent || push!(_openapi_output, "H_hp" => _openapi_value.h_hp)
    _openapi_value.h_ip isa Absent || push!(_openapi_output, "H_ip" => _openapi_value.h_ip)
    _openapi_value.h_lp isa Absent || push!(_openapi_output, "H_lp" => _openapi_value.h_lp)
    _openapi_value.h_ex isa Absent || push!(_openapi_output, "H_ex" => _openapi_value.h_ex)
    _openapi_value.d isa Absent || push!(_openapi_output, "D" => _openapi_value.d)
    _openapi_value.d_hp isa Absent || push!(_openapi_output, "D_hp" => _openapi_value.d_hp)
    _openapi_value.d_ip isa Absent || push!(_openapi_output, "D_ip" => _openapi_value.d_ip)
    _openapi_value.d_lp isa Absent || push!(_openapi_output, "D_lp" => _openapi_value.d_lp)
    _openapi_value.d_ex isa Absent || push!(_openapi_output, "D_ex" => _openapi_value.d_ex)
    _openapi_value.d_12 isa Absent || push!(_openapi_output, "D_12" => _openapi_value.d_12)
    _openapi_value.d_23 isa Absent || push!(_openapi_output, "D_23" => _openapi_value.d_23)
    _openapi_value.d_34 isa Absent || push!(_openapi_output, "D_34" => _openapi_value.d_34)
    _openapi_value.d_45 isa Absent || push!(_openapi_output, "D_45" => _openapi_value.d_45)
    _openapi_value.k_hp isa Absent || push!(_openapi_output, "K_hp" => _openapi_value.k_hp)
    _openapi_value.k_ip isa Absent || push!(_openapi_output, "K_ip" => _openapi_value.k_ip)
    _openapi_value.k_lp isa Absent || push!(_openapi_output, "K_lp" => _openapi_value.k_lp)
    _openapi_value.k_ex isa Absent || push!(_openapi_output, "K_ex" => _openapi_value.k_ex)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
