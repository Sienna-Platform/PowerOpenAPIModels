"""
    BaseMachine

Parameters of a Classic Machine: GENCLS in PSSE and PSLF

  - `id`: Unique integer identifier for this component
  - `r`: Resistance after EMF
  - `xd_p`: Reactance after EMF
  - `eq_p`: Fixed EMF behind the impedance
"""
Base.@kwdef struct BaseMachine <: APIModel
    id::Int64
    r::Float64
    xd_p::Float64
    eq_p::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{BaseMachine}, value) = _decode(BaseMachine, value, true)
function _decode(::Type{BaseMachine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ccd31135a00698497b07.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding BaseMachine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "BaseMachine")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "BaseMachine"), _openapi_validate)
    _openapi_field_r =
        _decode(Float64, _required(_openapi_object, "R", "BaseMachine"), _openapi_validate)
    _openapi_field_xd_p = _decode(
        Float64,
        _required(_openapi_object, "Xd_p", "BaseMachine"),
        _openapi_validate,
    )
    _openapi_field_eq_p = _decode(
        Float64,
        _required(_openapi_object, "eq_p", "BaseMachine"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "R", "Xd_p", "eq_p") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return BaseMachine(;
        id=_openapi_field_id,
        r=_openapi_field_r,
        xd_p=_openapi_field_xd_p,
        eq_p=_openapi_field_eq_p,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::BaseMachine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.xd_p isa Absent ||
        (_openapi_output["Xd_p"] = _encode(_openapi_value.xd_p))
    _openapi_value.eq_p isa Absent ||
        (_openapi_output["eq_p"] = _encode(_openapi_value.eq_p))
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
            resource="https://openapi.invalid/schema/external-ccd31135a00698497b07.json",
            pointer="",
        ),
        _openapi_output,
        "encoding BaseMachine";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::BaseMachine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.xd_p isa Absent || push!(_openapi_output, "Xd_p" => _openapi_value.xd_p)
    _openapi_value.eq_p isa Absent || push!(_openapi_output, "eq_p" => _openapi_value.eq_p)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
