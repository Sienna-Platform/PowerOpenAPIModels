@doc "    DemandSideTechnology\n\nDemand-side technology such as an electric vehicle fleet or a hydrogen electrolyzer. Its flexibility is described by how far demand may be delayed or advanced, how much of it may be curtailed, and the cost and energy losses of doing either.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).\n- `curtailment_cost`: Energy cost of curtailed demand, USD per MWh. Units: USD/MWh.\n- `demand_energy_efficiency`: Energy efficiency associated with time shifting demand. Represents energy losses due to time shifting. Units: 1.\n- `id`: ID for individual component.\n- `max_demand_advance`: Maximum number of minutes that demand can be scheduled in advance of the original schedule (minutes). Units: min.\n- `max_demand_curtailment`: Maximum fraction of demand that can be curtailed. Units: 1.\n- `max_demand_delay`: Maximum number of minutes that demand can be deferred or delayed (minutes). Units: min.\n- `min_power`: Minimum operation of demandside unit as a fraction of peak demand. Units: 1.\n- `name`: Name of the component.\n- `peak_demand_mw`: Peak demand value in MW. Units: MW.\n- `power_systems_type`: Corresponding type to be used in PCM modeling.\n- `price_per_unit`: Price or value per unit of output. Ex: USD per ton of hydrogen for electrolyzers. Units: USD/t.\n- `region`: Location where the component applies. Can be a zone or node.\n- `requirements`: List of requirement IDs associated with the component.\n- `shift_variable_cost`: Variable operation and maintenance costs associated with flexible demand deferral/advancement. Units: USD/MWh.\n- `technology_efficiency`: MWh of electricity per unit of output. Ex: MWh per ton of hydrogen for electrolyzers. Units: 1."
Base.@kwdef struct DemandSideTechnology
    available::Bool
    curtailment_cost::Union{Absent,DemandSideTechnologyCurtailmentCost,Nothing} = ABSENT
    demand_energy_efficiency::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    max_demand_advance::Union{Absent,Float64,Nothing} = ABSENT
    max_demand_curtailment::Union{Absent,Float64,Nothing} = ABSENT
    max_demand_delay::Union{Absent,Float64,Nothing} = ABSENT
    min_power::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    peak_demand_mw::Union{Absent,Float64,Nothing} = ABSENT
    power_systems_type::String
    price_per_unit::Union{Absent,DemandSideTechnologyPricePerUnit,Nothing} = ABSENT
    region::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    requirements::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    shift_variable_cost::Union{Absent,DemandSideTechnologyShiftVariableCost,Nothing} = ABSENT
    technology_efficiency::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{DemandSideTechnology}, value) = _decode(DemandSideTechnology, value, true)
function _decode(::Type{DemandSideTechnology}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/DemandSideTechnology"), _openapi_raw, "decoding DemandSideTechnology"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "DemandSideTechnology")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "DemandSideTechnology"), _openapi_validate)
    _openapi_field_curtailment_cost = haskey(_openapi_object, "curtailment_cost") ? _decode(Union{Absent,DemandSideTechnologyCurtailmentCost,Nothing}, _openapi_object["curtailment_cost"], _openapi_validate) : ABSENT
    _openapi_field_demand_energy_efficiency = haskey(_openapi_object, "demand_energy_efficiency") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["demand_energy_efficiency"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "DemandSideTechnology"), _openapi_validate)
    _openapi_field_max_demand_advance = haskey(_openapi_object, "max_demand_advance") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_demand_advance"], _openapi_validate) : ABSENT
    _openapi_field_max_demand_curtailment = haskey(_openapi_object, "max_demand_curtailment") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_demand_curtailment"], _openapi_validate) : ABSENT
    _openapi_field_max_demand_delay = haskey(_openapi_object, "max_demand_delay") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_demand_delay"], _openapi_validate) : ABSENT
    _openapi_field_min_power = haskey(_openapi_object, "min_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["min_power"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "DemandSideTechnology"), _openapi_validate)
    _openapi_field_peak_demand_mw = haskey(_openapi_object, "peak_demand_mw") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["peak_demand_mw"], _openapi_validate) : ABSENT
    _openapi_field_power_systems_type = _decode(String, _required(_openapi_object, "power_systems_type", "DemandSideTechnology"), _openapi_validate)
    _openapi_field_price_per_unit = haskey(_openapi_object, "price_per_unit") ? _decode(Union{Absent,DemandSideTechnologyPricePerUnit,Nothing}, _openapi_object["price_per_unit"], _openapi_validate) : ABSENT
    _openapi_field_region = haskey(_openapi_object, "region") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["region"], _openapi_validate) : ABSENT
    _openapi_field_requirements = haskey(_openapi_object, "requirements") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["requirements"], _openapi_validate) : ABSENT
    _openapi_field_shift_variable_cost = haskey(_openapi_object, "shift_variable_cost") ? _decode(Union{Absent,DemandSideTechnologyShiftVariableCost,Nothing}, _openapi_object["shift_variable_cost"], _openapi_validate) : ABSENT
    _openapi_field_technology_efficiency = haskey(_openapi_object, "technology_efficiency") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["technology_efficiency"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","curtailment_cost","demand_energy_efficiency","id","max_demand_advance","max_demand_curtailment","max_demand_delay","min_power","name","peak_demand_mw","power_systems_type","price_per_unit","region","requirements","shift_variable_cost","technology_efficiency") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return DemandSideTechnology(; available = _openapi_field_available, curtailment_cost = _openapi_field_curtailment_cost, demand_energy_efficiency = _openapi_field_demand_energy_efficiency, id = _openapi_field_id, max_demand_advance = _openapi_field_max_demand_advance, max_demand_curtailment = _openapi_field_max_demand_curtailment, max_demand_delay = _openapi_field_max_demand_delay, min_power = _openapi_field_min_power, name = _openapi_field_name, peak_demand_mw = _openapi_field_peak_demand_mw, power_systems_type = _openapi_field_power_systems_type, price_per_unit = _openapi_field_price_per_unit, region = _openapi_field_region, requirements = _openapi_field_requirements, shift_variable_cost = _openapi_field_shift_variable_cost, technology_efficiency = _openapi_field_technology_efficiency, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::DemandSideTechnology)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.curtailment_cost isa Absent || (_openapi_output["curtailment_cost"] = _encode(_openapi_value.curtailment_cost))
    _openapi_value.demand_energy_efficiency isa Absent || (_openapi_output["demand_energy_efficiency"] = _encode(_openapi_value.demand_energy_efficiency))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.max_demand_advance isa Absent || (_openapi_output["max_demand_advance"] = _encode(_openapi_value.max_demand_advance))
    _openapi_value.max_demand_curtailment isa Absent || (_openapi_output["max_demand_curtailment"] = _encode(_openapi_value.max_demand_curtailment))
    _openapi_value.max_demand_delay isa Absent || (_openapi_output["max_demand_delay"] = _encode(_openapi_value.max_demand_delay))
    _openapi_value.min_power isa Absent || (_openapi_output["min_power"] = _encode(_openapi_value.min_power))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.peak_demand_mw isa Absent || (_openapi_output["peak_demand_mw"] = _encode(_openapi_value.peak_demand_mw))
    _openapi_value.power_systems_type isa Absent || (_openapi_output["power_systems_type"] = _encode(_openapi_value.power_systems_type))
    _openapi_value.price_per_unit isa Absent || (_openapi_output["price_per_unit"] = _encode(_openapi_value.price_per_unit))
    _openapi_value.region isa Absent || (_openapi_output["region"] = _encode(_openapi_value.region))
    _openapi_value.requirements isa Absent || (_openapi_output["requirements"] = _encode(_openapi_value.requirements))
    _openapi_value.shift_variable_cost isa Absent || (_openapi_output["shift_variable_cost"] = _encode(_openapi_value.shift_variable_cost))
    _openapi_value.technology_efficiency isa Absent || (_openapi_output["technology_efficiency"] = _encode(_openapi_value.technology_efficiency))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/DemandSideTechnology"), _openapi_output, "encoding DemandSideTechnology"; direction = :neutral)
end

function _form_fields(_openapi_value::DemandSideTechnology)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.curtailment_cost isa Absent || push!(_openapi_output, "curtailment_cost" => _openapi_value.curtailment_cost)
    _openapi_value.demand_energy_efficiency isa Absent || push!(_openapi_output, "demand_energy_efficiency" => _openapi_value.demand_energy_efficiency)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.max_demand_advance isa Absent || push!(_openapi_output, "max_demand_advance" => _openapi_value.max_demand_advance)
    _openapi_value.max_demand_curtailment isa Absent || push!(_openapi_output, "max_demand_curtailment" => _openapi_value.max_demand_curtailment)
    _openapi_value.max_demand_delay isa Absent || push!(_openapi_output, "max_demand_delay" => _openapi_value.max_demand_delay)
    _openapi_value.min_power isa Absent || push!(_openapi_output, "min_power" => _openapi_value.min_power)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.peak_demand_mw isa Absent || push!(_openapi_output, "peak_demand_mw" => _openapi_value.peak_demand_mw)
    _openapi_value.power_systems_type isa Absent || push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.price_per_unit isa Absent || push!(_openapi_output, "price_per_unit" => _openapi_value.price_per_unit)
    _openapi_value.region isa Absent || push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.requirements isa Absent || push!(_openapi_output, "requirements" => _openapi_value.requirements)
    _openapi_value.shift_variable_cost isa Absent || push!(_openapi_output, "shift_variable_cost" => _openapi_value.shift_variable_cost)
    _openapi_value.technology_efficiency isa Absent || push!(_openapi_output, "technology_efficiency" => _openapi_value.technology_efficiency)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
