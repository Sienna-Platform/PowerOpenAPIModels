@doc "    DemandRequirement\n\nDemand requirements for a region. New demand enters at a stated peak in its construction year and scales forward by a growth rate; `value_of_lost_load` and `unserved_demand_curve` price whatever portion goes unserved.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).\n- `conformity`: Indicator of how the demand requirement should conform to the load profile of existing technologies in the system. Should only be used for new demand requirements.\n- `growth_rate`: The annual growth rate of the demand requirement, used to scale present-day loads into future projections. Should only be used for conforming loads. Units: 1.\n- `id`: ID for individual component.\n- `name`: Name of the component.\n- `new_construction_year`: The year in which the new demand requirement will be installed. Should only be used for new demand requirements.\n- `new_demand_mw`: The value of the peak demand to be used for new DemandRequirements. Units: MW.\n- `power_systems_type`: Corresponding type to be used in PCM modeling.\n- `region`: Location where the component applies. Can be a zone or node.\n- `requirements`: List of requirement IDs associated with the component.\n- `unserved_demand_curve`: Piecewise curve to scale the cost of unserved load based on the value of lost load. Units: USD/MWh.\n- `value_of_lost_load`: Value of unserved load. Units: USD/MWh."
Base.@kwdef struct DemandRequirement
    available::Union{Absent,Bool,Nothing} = ABSENT
    conformity::Union{Absent,Nothing,String} = ABSENT
    growth_rate::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    name::String
    new_construction_year::Union{Absent,Int64,Nothing} = ABSENT
    new_demand_mw::Union{Absent,Float64,Nothing} = ABSENT
    power_systems_type::String
    region::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    requirements::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    unserved_demand_curve::Union{Absent,DemandRequirementUnservedDemandCurve,Nothing} = ABSENT
    value_of_lost_load::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{DemandRequirement}, value) = _decode(DemandRequirement, value, true)
function _decode(::Type{DemandRequirement}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/DemandRequirement"), _openapi_raw, "decoding DemandRequirement"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "DemandRequirement")
    _openapi_field_available = haskey(_openapi_object, "available") ? _decode(Union{Absent,Bool,Nothing}, _openapi_object["available"], _openapi_validate) : ABSENT
    _openapi_field_conformity = haskey(_openapi_object, "conformity") ? _decode(Union{Absent,Nothing,String}, _openapi_object["conformity"], _openapi_validate) : ABSENT
    _openapi_field_growth_rate = haskey(_openapi_object, "growth_rate") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["growth_rate"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "DemandRequirement"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "DemandRequirement"), _openapi_validate)
    _openapi_field_new_construction_year = haskey(_openapi_object, "new_construction_year") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["new_construction_year"], _openapi_validate) : ABSENT
    _openapi_field_new_demand_mw = haskey(_openapi_object, "new_demand_mw") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["new_demand_mw"], _openapi_validate) : ABSENT
    _openapi_field_power_systems_type = _decode(String, _required(_openapi_object, "power_systems_type", "DemandRequirement"), _openapi_validate)
    _openapi_field_region = haskey(_openapi_object, "region") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["region"], _openapi_validate) : ABSENT
    _openapi_field_requirements = haskey(_openapi_object, "requirements") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["requirements"], _openapi_validate) : ABSENT
    _openapi_field_unserved_demand_curve = haskey(_openapi_object, "unserved_demand_curve") ? _decode(Union{Absent,DemandRequirementUnservedDemandCurve,Nothing}, _openapi_object["unserved_demand_curve"], _openapi_validate) : ABSENT
    _openapi_field_value_of_lost_load = _decode(Float64, _required(_openapi_object, "value_of_lost_load", "DemandRequirement"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","conformity","growth_rate","id","name","new_construction_year","new_demand_mw","power_systems_type","region","requirements","unserved_demand_curve","value_of_lost_load") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return DemandRequirement(; available = _openapi_field_available, conformity = _openapi_field_conformity, growth_rate = _openapi_field_growth_rate, id = _openapi_field_id, name = _openapi_field_name, new_construction_year = _openapi_field_new_construction_year, new_demand_mw = _openapi_field_new_demand_mw, power_systems_type = _openapi_field_power_systems_type, region = _openapi_field_region, requirements = _openapi_field_requirements, unserved_demand_curve = _openapi_field_unserved_demand_curve, value_of_lost_load = _openapi_field_value_of_lost_load, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::DemandRequirement)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.conformity isa Absent || (_openapi_output["conformity"] = _encode(_openapi_value.conformity))
    _openapi_value.growth_rate isa Absent || (_openapi_output["growth_rate"] = _encode(_openapi_value.growth_rate))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.new_construction_year isa Absent || (_openapi_output["new_construction_year"] = _encode(_openapi_value.new_construction_year))
    _openapi_value.new_demand_mw isa Absent || (_openapi_output["new_demand_mw"] = _encode(_openapi_value.new_demand_mw))
    _openapi_value.power_systems_type isa Absent || (_openapi_output["power_systems_type"] = _encode(_openapi_value.power_systems_type))
    _openapi_value.region isa Absent || (_openapi_output["region"] = _encode(_openapi_value.region))
    _openapi_value.requirements isa Absent || (_openapi_output["requirements"] = _encode(_openapi_value.requirements))
    _openapi_value.unserved_demand_curve isa Absent || (_openapi_output["unserved_demand_curve"] = _encode(_openapi_value.unserved_demand_curve))
    _openapi_value.value_of_lost_load isa Absent || (_openapi_output["value_of_lost_load"] = _encode(_openapi_value.value_of_lost_load))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/DemandRequirement"), _openapi_output, "encoding DemandRequirement"; direction = :neutral)
end

function _form_fields(_openapi_value::DemandRequirement)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.conformity isa Absent || push!(_openapi_output, "conformity" => _openapi_value.conformity)
    _openapi_value.growth_rate isa Absent || push!(_openapi_output, "growth_rate" => _openapi_value.growth_rate)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.new_construction_year isa Absent || push!(_openapi_output, "new_construction_year" => _openapi_value.new_construction_year)
    _openapi_value.new_demand_mw isa Absent || push!(_openapi_output, "new_demand_mw" => _openapi_value.new_demand_mw)
    _openapi_value.power_systems_type isa Absent || push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.region isa Absent || push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.requirements isa Absent || push!(_openapi_output, "requirements" => _openapi_value.requirements)
    _openapi_value.unserved_demand_curve isa Absent || push!(_openapi_output, "unserved_demand_curve" => _openapi_value.unserved_demand_curve)
    _openapi_value.value_of_lost_load isa Absent || push!(_openapi_output, "value_of_lost_load" => _openapi_value.value_of_lost_load)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
