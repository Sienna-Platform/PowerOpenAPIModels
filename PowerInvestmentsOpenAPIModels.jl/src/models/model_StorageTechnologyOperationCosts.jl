@doc "    StorageTechnologyOperationCosts\n\nFixed and variable O&M costs for a storage technology. Units: USD/MWh.\n\n- `charge_variable_cost`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term.\n- `discharge_variable_cost`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term."
Base.@kwdef struct StorageTechnologyOperationCosts
    charge_variable_cost::Union{Absent,CostCurve,Nothing} = ABSENT
    cost_type::Union{Absent,Nothing,String} = ABSENT
    discharge_variable_cost::Union{Absent,CostCurve,Nothing} = ABSENT
    energy_shortage_cost::Union{Absent,Float64,Nothing} = ABSENT
    energy_surplus_cost::Union{Absent,Float64,Nothing} = ABSENT
    fixed::Float64
    shut_down::Float64
    start_up::StorageTechnologyOperationCostsStartUp
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{StorageTechnologyOperationCosts}, value) = _decode(StorageTechnologyOperationCosts, value, true)
function _decode(::Type{StorageTechnologyOperationCosts}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/operation_costs"), _openapi_raw, "decoding StorageTechnologyOperationCosts"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "StorageTechnologyOperationCosts")
    _openapi_field_charge_variable_cost = haskey(_openapi_object, "charge_variable_cost") ? _decode(Union{Absent,CostCurve,Nothing}, _openapi_object["charge_variable_cost"], _openapi_validate) : ABSENT
    _openapi_field_cost_type = haskey(_openapi_object, "cost_type") ? _decode(Union{Absent,Nothing,String}, _openapi_object["cost_type"], _openapi_validate) : ABSENT
    _openapi_field_discharge_variable_cost = haskey(_openapi_object, "discharge_variable_cost") ? _decode(Union{Absent,CostCurve,Nothing}, _openapi_object["discharge_variable_cost"], _openapi_validate) : ABSENT
    _openapi_field_energy_shortage_cost = haskey(_openapi_object, "energy_shortage_cost") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["energy_shortage_cost"], _openapi_validate) : ABSENT
    _openapi_field_energy_surplus_cost = haskey(_openapi_object, "energy_surplus_cost") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["energy_surplus_cost"], _openapi_validate) : ABSENT
    _openapi_field_fixed = _decode(Float64, _required(_openapi_object, "fixed", "StorageTechnologyOperationCosts"), _openapi_validate)
    _openapi_field_shut_down = _decode(Float64, _required(_openapi_object, "shut_down", "StorageTechnologyOperationCosts"), _openapi_validate)
    _openapi_field_start_up = _decode(StorageTechnologyOperationCostsStartUp, _required(_openapi_object, "start_up", "StorageTechnologyOperationCosts"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("charge_variable_cost","cost_type","discharge_variable_cost","energy_shortage_cost","energy_surplus_cost","fixed","shut_down","start_up") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return StorageTechnologyOperationCosts(; charge_variable_cost = _openapi_field_charge_variable_cost, cost_type = _openapi_field_cost_type, discharge_variable_cost = _openapi_field_discharge_variable_cost, energy_shortage_cost = _openapi_field_energy_shortage_cost, energy_surplus_cost = _openapi_field_energy_surplus_cost, fixed = _openapi_field_fixed, shut_down = _openapi_field_shut_down, start_up = _openapi_field_start_up, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::StorageTechnologyOperationCosts)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.charge_variable_cost isa Absent || (_openapi_output["charge_variable_cost"] = _encode(_openapi_value.charge_variable_cost))
    _openapi_value.cost_type isa Absent || (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.discharge_variable_cost isa Absent || (_openapi_output["discharge_variable_cost"] = _encode(_openapi_value.discharge_variable_cost))
    _openapi_value.energy_shortage_cost isa Absent || (_openapi_output["energy_shortage_cost"] = _encode(_openapi_value.energy_shortage_cost))
    _openapi_value.energy_surplus_cost isa Absent || (_openapi_output["energy_surplus_cost"] = _encode(_openapi_value.energy_surplus_cost))
    _openapi_value.fixed isa Absent || (_openapi_output["fixed"] = _encode(_openapi_value.fixed))
    _openapi_value.shut_down isa Absent || (_openapi_output["shut_down"] = _encode(_openapi_value.shut_down))
    _openapi_value.start_up isa Absent || (_openapi_output["start_up"] = _encode(_openapi_value.start_up))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/operation_costs"), _openapi_output, "encoding StorageTechnologyOperationCosts"; direction = :neutral)
end

function _form_fields(_openapi_value::StorageTechnologyOperationCosts)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.charge_variable_cost isa Absent || push!(_openapi_output, "charge_variable_cost" => _openapi_value.charge_variable_cost)
    _openapi_value.cost_type isa Absent || push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.discharge_variable_cost isa Absent || push!(_openapi_output, "discharge_variable_cost" => _openapi_value.discharge_variable_cost)
    _openapi_value.energy_shortage_cost isa Absent || push!(_openapi_output, "energy_shortage_cost" => _openapi_value.energy_shortage_cost)
    _openapi_value.energy_surplus_cost isa Absent || push!(_openapi_output, "energy_surplus_cost" => _openapi_value.energy_surplus_cost)
    _openapi_value.fixed isa Absent || push!(_openapi_output, "fixed" => _openapi_value.fixed)
    _openapi_value.shut_down isa Absent || push!(_openapi_output, "shut_down" => _openapi_value.shut_down)
    _openapi_value.start_up isa Absent || push!(_openapi_output, "start_up" => _openapi_value.start_up)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
