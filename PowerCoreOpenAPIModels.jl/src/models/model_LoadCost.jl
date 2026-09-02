@doc "    LoadCost\n\nCost representation for controllable load units\n\n- `variable_operation_cost`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term."
Base.@kwdef struct LoadCost
    cost_type::Union{Absent,Nothing,String} = ABSENT
    fixed::Union{Absent,Float64,Nothing} = ABSENT
    variable_operation_cost::CostCurve
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{LoadCost}, value) = _decode(LoadCost, value, true)
function _decode(::Type{LoadCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/LoadCost"), _openapi_raw, "decoding LoadCost"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "LoadCost")
    _openapi_field_cost_type = haskey(_openapi_object, "cost_type") ? _decode(Union{Absent,Nothing,String}, _openapi_object["cost_type"], _openapi_validate) : ABSENT
    _openapi_field_fixed = haskey(_openapi_object, "fixed") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["fixed"], _openapi_validate) : ABSENT
    _openapi_field_variable_operation_cost = _decode(CostCurve, _required(_openapi_object, "variable_operation_cost", "LoadCost"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("cost_type","fixed","variable_operation_cost") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return LoadCost(; cost_type = _openapi_field_cost_type, fixed = _openapi_field_fixed, variable_operation_cost = _openapi_field_variable_operation_cost, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::LoadCost)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.cost_type isa Absent || (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.fixed isa Absent || (_openapi_output["fixed"] = _encode(_openapi_value.fixed))
    _openapi_value.variable_operation_cost isa Absent || (_openapi_output["variable_operation_cost"] = _encode(_openapi_value.variable_operation_cost))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/LoadCost"), _openapi_output, "encoding LoadCost"; direction = :neutral)
end

function _form_fields(_openapi_value::LoadCost)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.cost_type isa Absent || push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.fixed isa Absent || push!(_openapi_output, "fixed" => _openapi_value.fixed)
    _openapi_value.variable_operation_cost isa Absent || push!(_openapi_output, "variable_operation_cost" => _openapi_value.variable_operation_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
