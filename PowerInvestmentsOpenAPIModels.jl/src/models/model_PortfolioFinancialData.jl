"""
    PortfolioFinancialData

Financial data for the portfolio as a whole: the base economic year that all costs are converted to a net present value in, and the discount, inflation, and interest rates used in that conversion.

  - `id`: ID for individual component.
  - `discount_rate`: Discount rate for financial calculations. Units: 1.
  - `inflation_rate`: Inflation rate for cost adjustments. Units: 1.
  - `interest_rate`: Interest rate for financing calculations. Units: 1.
  - `base_year`: Base economic year. All costs will be converted to a net present value in this year.
"""
Base.@kwdef struct PortfolioFinancialData <: APIModel
    id::Int64
    discount_rate::Float64
    inflation_rate::Float64
    interest_rate::Float64
    base_year::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PortfolioFinancialData}, value) =
    _decode(PortfolioFinancialData, value, true)
function _decode(::Type{PortfolioFinancialData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-491a87e9a2e08b1106f1.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding PortfolioFinancialData";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PortfolioFinancialData")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "PortfolioFinancialData"), false)
    _openapi_field_discount_rate = _decode(
        Float64,
        _required(_openapi_object, "discount_rate", "PortfolioFinancialData"),
        false,
    )
    _openapi_field_inflation_rate = _decode(
        Float64,
        _required(_openapi_object, "inflation_rate", "PortfolioFinancialData"),
        false,
    )
    _openapi_field_interest_rate = _decode(
        Float64,
        _required(_openapi_object, "interest_rate", "PortfolioFinancialData"),
        false,
    )
    _openapi_field_base_year = _decode(
        Int64,
        _required(_openapi_object, "base_year", "PortfolioFinancialData"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "discount_rate", "inflation_rate", "interest_rate", "base_year") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return PortfolioFinancialData(;
        id=_openapi_field_id,
        discount_rate=_openapi_field_discount_rate,
        inflation_rate=_openapi_field_inflation_rate,
        interest_rate=_openapi_field_interest_rate,
        base_year=_openapi_field_base_year,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::PortfolioFinancialData)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.discount_rate isa Absent || (
        _openapi_output["discount_rate"] =
            _encode_unvalidated(_openapi_value.discount_rate)
    )
    _openapi_value.inflation_rate isa Absent || (
        _openapi_output["inflation_rate"] =
            _encode_unvalidated(_openapi_value.inflation_rate)
    )
    _openapi_value.interest_rate isa Absent || (
        _openapi_output["interest_rate"] =
            _encode_unvalidated(_openapi_value.interest_rate)
    )
    _openapi_value.base_year isa Absent ||
        (_openapi_output["base_year"] = _encode_unvalidated(_openapi_value.base_year))
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
_encode(_openapi_value::PortfolioFinancialData) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-491a87e9a2e08b1106f1.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding PortfolioFinancialData";
    direction=:neutral,
)

function _form_fields(_openapi_value::PortfolioFinancialData)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.discount_rate isa Absent ||
        push!(_openapi_output, "discount_rate" => _openapi_value.discount_rate)
    _openapi_value.inflation_rate isa Absent ||
        push!(_openapi_output, "inflation_rate" => _openapi_value.inflation_rate)
    _openapi_value.interest_rate isa Absent ||
        push!(_openapi_output, "interest_rate" => _openapi_value.interest_rate)
    _openapi_value.base_year isa Absent ||
        push!(_openapi_output, "base_year" => _openapi_value.base_year)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
