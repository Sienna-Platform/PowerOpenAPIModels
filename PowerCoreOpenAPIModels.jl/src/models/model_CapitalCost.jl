"""
    CapitalCost

Investment cost for candidate generation and transmission technologies which includes overnight capital costs and last-mile interconnection costs.

  - `capital_cost`: A cost or fuel curve: function data plus how to read its y axis. INPUT_OUTPUT reads the total f(x), INCREMENTAL the marginal rate f'(x), AVERAGE_RATE the average f(x)/x. The TIME_SERIES_* variants are their time-varying equivalents.
"""
Base.@kwdef struct CapitalCost <: APIModel
    capital_cost::ValueCurve
    interconnection_cost::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{CapitalCost}, value) = _decode(CapitalCost, value, true)
function _decode(::Type{CapitalCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/CapitalCost",
        ),
        _openapi_raw,
        "decoding CapitalCost";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "CapitalCost")
    _openapi_field_capital_cost = _decode(
        ValueCurve,
        _required(_openapi_object, "capital_cost", "CapitalCost"),
        _openapi_validate,
    )
    _openapi_field_interconnection_cost =
        haskey(_openapi_object, "interconnection_cost") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["interconnection_cost"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("capital_cost", "interconnection_cost") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return CapitalCost(;
        capital_cost=_openapi_field_capital_cost,
        interconnection_cost=_openapi_field_interconnection_cost,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::CapitalCost)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.capital_cost isa Absent ||
        (_openapi_output["capital_cost"] = _encode(_openapi_value.capital_cost))
    _openapi_value.interconnection_cost isa Absent || (
        _openapi_output["interconnection_cost"] =
            _encode(_openapi_value.interconnection_cost)
    )
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
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/CapitalCost",
        ),
        _openapi_output,
        "encoding CapitalCost";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::CapitalCost)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.capital_cost isa Absent ||
        push!(_openapi_output, "capital_cost" => _openapi_value.capital_cost)
    _openapi_value.interconnection_cost isa Absent || push!(
        _openapi_output,
        "interconnection_cost" => _openapi_value.interconnection_cost,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
