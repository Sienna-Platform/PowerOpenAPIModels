@doc "    PortfolioFinancialData\n\nFinancial data for the portfolio as a whole: the base economic year that all costs are converted to a net present value in, and the discount, inflation, and interest rates used in that conversion.\n\n- `base_year`: Base economic year. All costs will be converted to a net present value in this year.\n- `discount_rate`: Discount rate for financial calculations. Units: 1.\n- `id`: ID for individual component.\n- `inflation_rate`: Inflation rate for cost adjustments. Units: 1.\n- `interest_rate`: Interest rate for financing calculations. Units: 1."
Base.@kwdef struct PortfolioFinancialData
    base_year::Int64
    discount_rate::Float64
    id::Int64
    inflation_rate::Float64
    interest_rate::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{PortfolioFinancialData}, value) = _decode(PortfolioFinancialData, value, true)
function _decode(::Type{PortfolioFinancialData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/PortfolioFinancialData"), _openapi_raw, "decoding PortfolioFinancialData"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "PortfolioFinancialData")
    _openapi_field_base_year = _decode(Int64, _required(_openapi_object, "base_year", "PortfolioFinancialData"), _openapi_validate)
    _openapi_field_discount_rate = _decode(Float64, _required(_openapi_object, "discount_rate", "PortfolioFinancialData"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "PortfolioFinancialData"), _openapi_validate)
    _openapi_field_inflation_rate = _decode(Float64, _required(_openapi_object, "inflation_rate", "PortfolioFinancialData"), _openapi_validate)
    _openapi_field_interest_rate = _decode(Float64, _required(_openapi_object, "interest_rate", "PortfolioFinancialData"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("base_year","discount_rate","id","inflation_rate","interest_rate") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return PortfolioFinancialData(; base_year = _openapi_field_base_year, discount_rate = _openapi_field_discount_rate, id = _openapi_field_id, inflation_rate = _openapi_field_inflation_rate, interest_rate = _openapi_field_interest_rate, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::PortfolioFinancialData)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.base_year isa Absent || (_openapi_output["base_year"] = _encode(_openapi_value.base_year))
    _openapi_value.discount_rate isa Absent || (_openapi_output["discount_rate"] = _encode(_openapi_value.discount_rate))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.inflation_rate isa Absent || (_openapi_output["inflation_rate"] = _encode(_openapi_value.inflation_rate))
    _openapi_value.interest_rate isa Absent || (_openapi_output["interest_rate"] = _encode(_openapi_value.interest_rate))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/PortfolioFinancialData"), _openapi_output, "encoding PortfolioFinancialData"; direction = :neutral)
end

function _form_fields(_openapi_value::PortfolioFinancialData)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.base_year isa Absent || push!(_openapi_output, "base_year" => _openapi_value.base_year)
    _openapi_value.discount_rate isa Absent || push!(_openapi_output, "discount_rate" => _openapi_value.discount_rate)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.inflation_rate isa Absent || push!(_openapi_output, "inflation_rate" => _openapi_value.inflation_rate)
    _openapi_value.interest_rate isa Absent || push!(_openapi_output, "interest_rate" => _openapi_value.interest_rate)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
