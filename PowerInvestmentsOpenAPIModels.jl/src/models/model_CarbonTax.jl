"""
    CarbonTax

Policy requirement defining an additional cost penalty per ton of CO2 produced in the eligible regions during the target year.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `target_year`: Year in which this requirement is applied.
  - `tax_dollars_per_ton`: Cost penalty per ton of CO2 emitted by technologies in the eligible regions during the target year. Units: USD/t.
"""
Base.@kwdef struct CarbonTax <: APIModel
    id::Int64
    name::String
    available::Bool
    target_year::Union{Absent, Int64, Nothing} = ABSENT
    tax_dollars_per_ton::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{CarbonTax}, value) = _decode(CarbonTax, value, true)
function _decode(::Type{CarbonTax}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1b461b28a8011f21afd8.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding CarbonTax";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "CarbonTax")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "CarbonTax"), false)
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "CarbonTax"), false)
    _openapi_field_available =
        _decode(Bool, _required(_openapi_object, "available", "CarbonTax"), false)
    _openapi_field_target_year =
        haskey(_openapi_object, "target_year") ?
        _decode(Union{Absent, Int64, Nothing}, _openapi_object["target_year"], false) :
        ABSENT
    _openapi_field_tax_dollars_per_ton =
        haskey(_openapi_object, "tax_dollars_per_ton") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["tax_dollars_per_ton"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "name", "available", "target_year", "tax_dollars_per_ton") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return CarbonTax(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        target_year=_openapi_field_target_year,
        tax_dollars_per_ton=_openapi_field_tax_dollars_per_ton,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::CarbonTax)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.target_year isa Absent ||
        (_openapi_output["target_year"] = _encode_unvalidated(_openapi_value.target_year))
    _openapi_value.tax_dollars_per_ton isa Absent || (
        _openapi_output["tax_dollars_per_ton"] =
            _encode_unvalidated(_openapi_value.tax_dollars_per_ton)
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
_encode(_openapi_value::CarbonTax) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1b461b28a8011f21afd8.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding CarbonTax";
    direction=:neutral,
)

function _form_fields(_openapi_value::CarbonTax)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.target_year isa Absent ||
        push!(_openapi_output, "target_year" => _openapi_value.target_year)
    _openapi_value.tax_dollars_per_ton isa Absent ||
        push!(_openapi_output, "tax_dollars_per_ton" => _openapi_value.tax_dollars_per_ton)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
