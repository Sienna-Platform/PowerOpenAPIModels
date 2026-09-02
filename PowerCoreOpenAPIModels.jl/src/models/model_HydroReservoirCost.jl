@doc "    HydroReservoirCost\n\nCost representation for hydro reservoir"
Base.@kwdef struct HydroReservoirCost
    cost_type::Union{Absent,Nothing,String} = ABSENT
    level_shortage_cost::Union{Absent,Float64,Nothing} = ABSENT
    level_surplus_cost::Union{Absent,Float64,Nothing} = ABSENT
    spillage_cost::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{HydroReservoirCost}, value) = _decode(HydroReservoirCost, value, true)
function _decode(::Type{HydroReservoirCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/HydroReservoirCost"), _openapi_raw, "decoding HydroReservoirCost"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "HydroReservoirCost")
    _openapi_field_cost_type = haskey(_openapi_object, "cost_type") ? _decode(Union{Absent,Nothing,String}, _openapi_object["cost_type"], _openapi_validate) : ABSENT
    _openapi_field_level_shortage_cost = haskey(_openapi_object, "level_shortage_cost") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["level_shortage_cost"], _openapi_validate) : ABSENT
    _openapi_field_level_surplus_cost = haskey(_openapi_object, "level_surplus_cost") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["level_surplus_cost"], _openapi_validate) : ABSENT
    _openapi_field_spillage_cost = haskey(_openapi_object, "spillage_cost") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["spillage_cost"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("cost_type","level_shortage_cost","level_surplus_cost","spillage_cost") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return HydroReservoirCost(; cost_type = _openapi_field_cost_type, level_shortage_cost = _openapi_field_level_shortage_cost, level_surplus_cost = _openapi_field_level_surplus_cost, spillage_cost = _openapi_field_spillage_cost, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::HydroReservoirCost)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.cost_type isa Absent || (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.level_shortage_cost isa Absent || (_openapi_output["level_shortage_cost"] = _encode(_openapi_value.level_shortage_cost))
    _openapi_value.level_surplus_cost isa Absent || (_openapi_output["level_surplus_cost"] = _encode(_openapi_value.level_surplus_cost))
    _openapi_value.spillage_cost isa Absent || (_openapi_output["spillage_cost"] = _encode(_openapi_value.spillage_cost))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/HydroReservoirCost"), _openapi_output, "encoding HydroReservoirCost"; direction = :neutral)
end

function _form_fields(_openapi_value::HydroReservoirCost)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.cost_type isa Absent || push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.level_shortage_cost isa Absent || push!(_openapi_output, "level_shortage_cost" => _openapi_value.level_shortage_cost)
    _openapi_value.level_surplus_cost isa Absent || push!(_openapi_output, "level_surplus_cost" => _openapi_value.level_surplus_cost)
    _openapi_value.spillage_cost isa Absent || push!(_openapi_output, "spillage_cost" => _openapi_value.spillage_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
