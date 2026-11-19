"""
    CSVGN1

Parameters of static shunt compensator: CSVGN1 in PSSE It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `k`: Gain in pu (`DEVICE_BASE`)
  - `t1`: Time constant in s. Units: s.
  - `t2`: Time constant in s. Units: s.
  - `t3`: Time constant in s. Units: s.
  - `t4`: Time constant in s. Units: s.
  - `t5`: Time constant in s. Units: s.
  - `rmin`: Reactor minimum MVAr
  - `vmax`: Maximum voltage in pu. Units: pu.
  - `vmin`: Minimum voltage in pu. Units: pu.
  - `cbase`: Capacitor (MVAR)
  - `r_th`: Source Thevenin resistance
  - `x_th`: Source Thevenin reactance
  - `base_power`: Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct CSVGN1 <: APIModel
    id::Int64
    name::String
    k::Float64
    t1::Float64
    t2::Float64
    t3::Float64
    t4::Float64
    t5::Float64
    rmin::Float64
    vmax::Float64
    vmin::Float64
    cbase::Float64
    r_th::Float64
    x_th::Float64
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{CSVGN1}, value) = _decode(CSVGN1, value, true)
function _decode(::Type{CSVGN1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-b5be769998a00c45ef98.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding CSVGN1";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "CSVGN1")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "CSVGN1"), false)
    _openapi_field_name =
        _decode_zoned(String, _required(_openapi_object, "name", "CSVGN1"), false)
    _openapi_field_k =
        _decode_zoned(Float64, _required(_openapi_object, "K", "CSVGN1"), false)
    _openapi_field_t1 =
        _decode_zoned(Float64, _required(_openapi_object, "T1", "CSVGN1"), false)
    _openapi_field_t2 =
        _decode_zoned(Float64, _required(_openapi_object, "T2", "CSVGN1"), false)
    _openapi_field_t3 =
        _decode_zoned(Float64, _required(_openapi_object, "T3", "CSVGN1"), false)
    _openapi_field_t4 =
        _decode_zoned(Float64, _required(_openapi_object, "T4", "CSVGN1"), false)
    _openapi_field_t5 =
        _decode_zoned(Float64, _required(_openapi_object, "T5", "CSVGN1"), false)
    _openapi_field_rmin =
        _decode_zoned(Float64, _required(_openapi_object, "Rmin", "CSVGN1"), false)
    _openapi_field_vmax =
        _decode_zoned(Float64, _required(_openapi_object, "Vmax", "CSVGN1"), false)
    _openapi_field_vmin =
        _decode_zoned(Float64, _required(_openapi_object, "Vmin", "CSVGN1"), false)
    _openapi_field_cbase =
        _decode_zoned(Float64, _required(_openapi_object, "CBase", "CSVGN1"), false)
    _openapi_field_r_th =
        _decode_zoned(Float64, _required(_openapi_object, "R_th", "CSVGN1"), false)
    _openapi_field_x_th =
        _decode_zoned(Float64, _required(_openapi_object, "X_th", "CSVGN1"), false)
    _openapi_field_base_power =
        _decode_zoned(Float64, _required(_openapi_object, "base_power", "CSVGN1"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "K",
            "T1",
            "T2",
            "T3",
            "T4",
            "T5",
            "Rmin",
            "Vmax",
            "Vmin",
            "CBase",
            "R_th",
            "X_th",
            "base_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return CSVGN1(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        k=_openapi_field_k,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        t4=_openapi_field_t4,
        t5=_openapi_field_t5,
        rmin=_openapi_field_rmin,
        vmax=_openapi_field_vmax,
        vmin=_openapi_field_vmin,
        cbase=_openapi_field_cbase,
        r_th=_openapi_field_r_th,
        x_th=_openapi_field_x_th,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::CSVGN1)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.k isa Absent ||
        (_openapi_output["K"] = _encode_unvalidated(_openapi_value.k))
    _openapi_value.t1 isa Absent ||
        (_openapi_output["T1"] = _encode_unvalidated(_openapi_value.t1))
    _openapi_value.t2 isa Absent ||
        (_openapi_output["T2"] = _encode_unvalidated(_openapi_value.t2))
    _openapi_value.t3 isa Absent ||
        (_openapi_output["T3"] = _encode_unvalidated(_openapi_value.t3))
    _openapi_value.t4 isa Absent ||
        (_openapi_output["T4"] = _encode_unvalidated(_openapi_value.t4))
    _openapi_value.t5 isa Absent ||
        (_openapi_output["T5"] = _encode_unvalidated(_openapi_value.t5))
    _openapi_value.rmin isa Absent ||
        (_openapi_output["Rmin"] = _encode_unvalidated(_openapi_value.rmin))
    _openapi_value.vmax isa Absent ||
        (_openapi_output["Vmax"] = _encode_unvalidated(_openapi_value.vmax))
    _openapi_value.vmin isa Absent ||
        (_openapi_output["Vmin"] = _encode_unvalidated(_openapi_value.vmin))
    _openapi_value.cbase isa Absent ||
        (_openapi_output["CBase"] = _encode_unvalidated(_openapi_value.cbase))
    _openapi_value.r_th isa Absent ||
        (_openapi_output["R_th"] = _encode_unvalidated(_openapi_value.r_th))
    _openapi_value.x_th isa Absent ||
        (_openapi_output["X_th"] = _encode_unvalidated(_openapi_value.x_th))
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
_encode(_openapi_value::CSVGN1) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-b5be769998a00c45ef98.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding CSVGN1";
    direction=:neutral,
)

function _form_fields(_openapi_value::CSVGN1)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.k isa Absent || push!(_openapi_output, "K" => _openapi_value.k)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.t5 isa Absent || push!(_openapi_output, "T5" => _openapi_value.t5)
    _openapi_value.rmin isa Absent || push!(_openapi_output, "Rmin" => _openapi_value.rmin)
    _openapi_value.vmax isa Absent || push!(_openapi_output, "Vmax" => _openapi_value.vmax)
    _openapi_value.vmin isa Absent || push!(_openapi_output, "Vmin" => _openapi_value.vmin)
    _openapi_value.cbase isa Absent ||
        push!(_openapi_output, "CBase" => _openapi_value.cbase)
    _openapi_value.r_th isa Absent || push!(_openapi_output, "R_th" => _openapi_value.r_th)
    _openapi_value.x_th isa Absent || push!(_openapi_output, "X_th" => _openapi_value.x_th)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
