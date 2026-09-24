"""
    RenewableGenerationCost

Cost representation for renewable generation units

  - `curtailment_cost`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. Units: x-axis per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu ; y-axis USD/h .
  - `variable_operation_cost`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. Units: x-axis per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu ; y-axis USD/h .
"""
Base.@kwdef struct RenewableGenerationCost <: APIModel
    cost_type::Union{Absent, Nothing, String} = ABSENT
    curtailment_cost::Union{Absent, CostCurve, Nothing} = ABSENT
    variable_operation_cost::CostCurve
    fixed::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RenewableGenerationCost}, value) =
    _decode(RenewableGenerationCost, value, true)
function _decode(::Type{RenewableGenerationCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/RenewableGenerationCost",
        ),
        _openapi_raw,
        "decoding RenewableGenerationCost";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RenewableGenerationCost")
    _openapi_field_cost_type =
        haskey(_openapi_object, "cost_type") ?
        _decode(
            Union{Absent, Nothing, String},
            _openapi_object["cost_type"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_curtailment_cost =
        haskey(_openapi_object, "curtailment_cost") ?
        _decode(
            Union{Absent, CostCurve, Nothing},
            _openapi_object["curtailment_cost"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_variable_operation_cost = _decode(
        CostCurve,
        _required(_openapi_object, "variable_operation_cost", "RenewableGenerationCost"),
        _openapi_validate,
    )
    _openapi_field_fixed =
        haskey(_openapi_object, "fixed") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["fixed"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("cost_type", "curtailment_cost", "variable_operation_cost", "fixed") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return RenewableGenerationCost(;
        cost_type=_openapi_field_cost_type,
        curtailment_cost=_openapi_field_curtailment_cost,
        variable_operation_cost=_openapi_field_variable_operation_cost,
        fixed=_openapi_field_fixed,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::RenewableGenerationCost)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.cost_type isa Absent ||
        (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.curtailment_cost isa Absent ||
        (_openapi_output["curtailment_cost"] = _encode(_openapi_value.curtailment_cost))
    _openapi_value.variable_operation_cost isa Absent || (
        _openapi_output["variable_operation_cost"] =
            _encode(_openapi_value.variable_operation_cost)
    )
    _openapi_value.fixed isa Absent ||
        (_openapi_output["fixed"] = _encode(_openapi_value.fixed))
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
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/RenewableGenerationCost",
        ),
        _openapi_output,
        "encoding RenewableGenerationCost";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::RenewableGenerationCost)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.cost_type isa Absent ||
        push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.curtailment_cost isa Absent ||
        push!(_openapi_output, "curtailment_cost" => _openapi_value.curtailment_cost)
    _openapi_value.variable_operation_cost isa Absent || push!(
        _openapi_output,
        "variable_operation_cost" => _openapi_value.variable_operation_cost,
    )
    _openapi_value.fixed isa Absent ||
        push!(_openapi_output, "fixed" => _openapi_value.fixed)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
