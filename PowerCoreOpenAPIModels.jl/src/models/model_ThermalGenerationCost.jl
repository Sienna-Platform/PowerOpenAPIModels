@doc "    ThermalGenerationCost\n\nCost representation for thermal generation units\n\n- `fixed`: Fixed cost of keeping the unit online. For some cost represenations this field can be duplicative\n- `shut_down`: Cost to turn the unit off\n- `start_up`: Start-up cost can take linear or multi-stage cost\n- `variable_operation_cost`: Variable production cost of a device, selected by `variable_cost_type` between a curve denominated directly in currency (`COST`) and one denominated in fuel with a separate fuel price (`FUEL`)."
Base.@kwdef struct ThermalGenerationCost
    cost_type::Union{Absent,Nothing,String} = ABSENT
    fixed::Float64
    shut_down::Float64
    start_up::ThermalGenerationCostStartUp
    variable_operation_cost::ProductionVariableCostCurve
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ThermalGenerationCost}, value) = _decode(ThermalGenerationCost, value, true)
function _decode(::Type{ThermalGenerationCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ThermalGenerationCost"), _openapi_raw, "decoding ThermalGenerationCost"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ThermalGenerationCost")
    _openapi_field_cost_type = haskey(_openapi_object, "cost_type") ? _decode(Union{Absent,Nothing,String}, _openapi_object["cost_type"], _openapi_validate) : ABSENT
    _openapi_field_fixed = _decode(Float64, _required(_openapi_object, "fixed", "ThermalGenerationCost"), _openapi_validate)
    _openapi_field_shut_down = _decode(Float64, _required(_openapi_object, "shut_down", "ThermalGenerationCost"), _openapi_validate)
    _openapi_field_start_up = _decode(ThermalGenerationCostStartUp, _required(_openapi_object, "start_up", "ThermalGenerationCost"), _openapi_validate)
    _openapi_field_variable_operation_cost = _decode(ProductionVariableCostCurve, _required(_openapi_object, "variable_operation_cost", "ThermalGenerationCost"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("cost_type","fixed","shut_down","start_up","variable_operation_cost") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ThermalGenerationCost(; cost_type = _openapi_field_cost_type, fixed = _openapi_field_fixed, shut_down = _openapi_field_shut_down, start_up = _openapi_field_start_up, variable_operation_cost = _openapi_field_variable_operation_cost, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ThermalGenerationCost)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.cost_type isa Absent || (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.fixed isa Absent || (_openapi_output["fixed"] = _encode(_openapi_value.fixed))
    _openapi_value.shut_down isa Absent || (_openapi_output["shut_down"] = _encode(_openapi_value.shut_down))
    _openapi_value.start_up isa Absent || (_openapi_output["start_up"] = _encode(_openapi_value.start_up))
    _openapi_value.variable_operation_cost isa Absent || (_openapi_output["variable_operation_cost"] = _encode(_openapi_value.variable_operation_cost))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ThermalGenerationCost"), _openapi_output, "encoding ThermalGenerationCost"; direction = :neutral)
end

function _form_fields(_openapi_value::ThermalGenerationCost)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.cost_type isa Absent || push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.fixed isa Absent || push!(_openapi_output, "fixed" => _openapi_value.fixed)
    _openapi_value.shut_down isa Absent || push!(_openapi_output, "shut_down" => _openapi_value.shut_down)
    _openapi_value.start_up isa Absent || push!(_openapi_output, "start_up" => _openapi_value.start_up)
    _openapi_value.variable_operation_cost isa Absent || push!(_openapi_output, "variable_operation_cost" => _openapi_value.variable_operation_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
