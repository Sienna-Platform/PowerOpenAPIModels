@doc "    TechnologyFinancialData\n\nFinancial data for a candidate technology: the capital recovery period used to derive overnight capital cost from annualized investment cost, the dollar-year its cost data is reported in, and the debt fraction, debt rate, return on equity, and tax rate that together set its cost of capital.\n\n- `capital_recovery_period`: Period over which capital costs are recovered for net present value calculations. Units: yr.\n- `debt_fraction`: Fraction of capital costs financed through debt. Units: 1.\n- `debt_rate`: Interest rate on debt financing. Units: 1.\n- `return_on_equity`: Required rate of return on equity financing. Units: 1.\n- `tax_rate`: Tax rate applied to equity returns. Units: 1.\n- `technology_base_year`: Base year for technology cost data used in NPV calculations."
Base.@kwdef struct TechnologyFinancialData
    capital_recovery_period::Int64
    debt_fraction::Float64
    debt_rate::Float64
    return_on_equity::Float64
    tax_rate::Float64
    technology_base_year::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TechnologyFinancialData}, value) = _decode(TechnologyFinancialData, value, true)
function _decode(::Type{TechnologyFinancialData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TechnologyFinancialData"), _openapi_raw, "decoding TechnologyFinancialData"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TechnologyFinancialData")
    _openapi_field_capital_recovery_period = _decode(Int64, _required(_openapi_object, "capital_recovery_period", "TechnologyFinancialData"), _openapi_validate)
    _openapi_field_debt_fraction = _decode(Float64, _required(_openapi_object, "debt_fraction", "TechnologyFinancialData"), _openapi_validate)
    _openapi_field_debt_rate = _decode(Float64, _required(_openapi_object, "debt_rate", "TechnologyFinancialData"), _openapi_validate)
    _openapi_field_return_on_equity = _decode(Float64, _required(_openapi_object, "return_on_equity", "TechnologyFinancialData"), _openapi_validate)
    _openapi_field_tax_rate = _decode(Float64, _required(_openapi_object, "tax_rate", "TechnologyFinancialData"), _openapi_validate)
    _openapi_field_technology_base_year = _decode(Int64, _required(_openapi_object, "technology_base_year", "TechnologyFinancialData"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("capital_recovery_period","debt_fraction","debt_rate","return_on_equity","tax_rate","technology_base_year") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TechnologyFinancialData(; capital_recovery_period = _openapi_field_capital_recovery_period, debt_fraction = _openapi_field_debt_fraction, debt_rate = _openapi_field_debt_rate, return_on_equity = _openapi_field_return_on_equity, tax_rate = _openapi_field_tax_rate, technology_base_year = _openapi_field_technology_base_year, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TechnologyFinancialData)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.capital_recovery_period isa Absent || (_openapi_output["capital_recovery_period"] = _encode(_openapi_value.capital_recovery_period))
    _openapi_value.debt_fraction isa Absent || (_openapi_output["debt_fraction"] = _encode(_openapi_value.debt_fraction))
    _openapi_value.debt_rate isa Absent || (_openapi_output["debt_rate"] = _encode(_openapi_value.debt_rate))
    _openapi_value.return_on_equity isa Absent || (_openapi_output["return_on_equity"] = _encode(_openapi_value.return_on_equity))
    _openapi_value.tax_rate isa Absent || (_openapi_output["tax_rate"] = _encode(_openapi_value.tax_rate))
    _openapi_value.technology_base_year isa Absent || (_openapi_output["technology_base_year"] = _encode(_openapi_value.technology_base_year))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TechnologyFinancialData"), _openapi_output, "encoding TechnologyFinancialData"; direction = :neutral)
end

function _form_fields(_openapi_value::TechnologyFinancialData)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.capital_recovery_period isa Absent || push!(_openapi_output, "capital_recovery_period" => _openapi_value.capital_recovery_period)
    _openapi_value.debt_fraction isa Absent || push!(_openapi_output, "debt_fraction" => _openapi_value.debt_fraction)
    _openapi_value.debt_rate isa Absent || push!(_openapi_output, "debt_rate" => _openapi_value.debt_rate)
    _openapi_value.return_on_equity isa Absent || push!(_openapi_output, "return_on_equity" => _openapi_value.return_on_equity)
    _openapi_value.tax_rate isa Absent || push!(_openapi_output, "tax_rate" => _openapi_value.tax_rate)
    _openapi_value.technology_base_year isa Absent || push!(_openapi_output, "technology_base_year" => _openapi_value.technology_base_year)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
