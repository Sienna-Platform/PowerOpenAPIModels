"""
    SingleMass

Parameters of single mass shaft model. Typically represents the rotor mass

  - `id`: Unique integer identifier for this component
  - `h`: Rotor inertia constant in MWs/MVA
  - `d`: Rotor natural damping
"""
Base.@kwdef struct SingleMass <: APIModel
    id::Int64
    h::Float64
    d::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SingleMass}, value) = _decode(SingleMass, value, true)
function _decode(::Type{SingleMass}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-5b61553797a3e2497f5b.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SingleMass";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SingleMass")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "SingleMass"), false)
    _openapi_field_h =
        _decode(Float64, _required(_openapi_object, "H", "SingleMass"), false)
    _openapi_field_d =
        _decode(Float64, _required(_openapi_object, "D", "SingleMass"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "H", "D") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return SingleMass(;
        id=_openapi_field_id,
        h=_openapi_field_h,
        d=_openapi_field_d,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SingleMass)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.h isa Absent ||
        (_openapi_output["H"] = _encode_unvalidated(_openapi_value.h))
    _openapi_value.d isa Absent ||
        (_openapi_output["D"] = _encode_unvalidated(_openapi_value.d))
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
_encode(_openapi_value::SingleMass) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-5b61553797a3e2497f5b.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SingleMass";
    direction=:neutral,
)

function _form_fields(_openapi_value::SingleMass)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.h isa Absent || push!(_openapi_output, "H" => _openapi_value.h)
    _openapi_value.d isa Absent || push!(_openapi_output, "D" => _openapi_value.d)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
