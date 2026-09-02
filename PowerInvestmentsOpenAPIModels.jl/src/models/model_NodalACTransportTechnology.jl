@doc "    NodalACTransportTechnology\n\nNodal representation of candidate AC transmission lines between two regions. Alongside capacity limits and a capital cost curve it carries the electrical characteristics of the line — resistance, series reactance, and voltage rating — and is added in discrete units of `unit_size`.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).\n- `capacity_limits`: Allowable capacity for a transmission line. Units: MW.\n- `capital_costs`: Cost of adding new capacity to the nodal transmission line. Units: USD/MW.\n- `end_node`: End node for transport technology.\n- `financial_data`: Struct containing relevant financial information for a technology.\n- `id`: ID for individual component.\n- `name`: Name of the component.\n- `power_systems_type`: Corresponding type to be used in PCM modeling.\n- `reactance`: Series reactance for a line. Units: ohm.\n- `requirements`: List of requirement IDs associated with the component.\n- `resistance`: Technology resistance in Ohms. Units: ohm.\n- `start_node`: Start node for transport technology.\n- `unit_size`: Used for integer investment decisions. Represents the rating capacity of individual new lines. Units: MW.\n- `voltage`: Voltage rating of transmission line. Units: kV."
Base.@kwdef struct NodalACTransportTechnology
    available::Bool
    capacity_limits::Union{Absent,NodalACTransportTechnologyCapacityLimits,Nothing} = ABSENT
    capital_costs::Union{Absent,NodalACTransportTechnologyCapitalCosts,Nothing} = ABSENT
    end_node::Int64
    financial_data::NodalACTransportTechnologyFinancialData
    id::Int64
    name::String
    power_systems_type::String
    reactance::Union{Absent,Float64,Nothing} = ABSENT
    requirements::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    resistance::Union{Absent,Float64,Nothing} = ABSENT
    start_node::Int64
    unit_size::Union{Absent,Float64,Nothing} = ABSENT
    voltage::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{NodalACTransportTechnology}, value) = _decode(NodalACTransportTechnology, value, true)
function _decode(::Type{NodalACTransportTechnology}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/NodalACTransportTechnology"), _openapi_raw, "decoding NodalACTransportTechnology"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "NodalACTransportTechnology")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "NodalACTransportTechnology"), _openapi_validate)
    _openapi_field_capacity_limits = haskey(_openapi_object, "capacity_limits") ? _decode(Union{Absent,NodalACTransportTechnologyCapacityLimits,Nothing}, _openapi_object["capacity_limits"], _openapi_validate) : ABSENT
    _openapi_field_capital_costs = haskey(_openapi_object, "capital_costs") ? _decode(Union{Absent,NodalACTransportTechnologyCapitalCosts,Nothing}, _openapi_object["capital_costs"], _openapi_validate) : ABSENT
    _openapi_field_end_node = _decode(Int64, _required(_openapi_object, "end_node", "NodalACTransportTechnology"), _openapi_validate)
    _openapi_field_financial_data = _decode(NodalACTransportTechnologyFinancialData, _required(_openapi_object, "financial_data", "NodalACTransportTechnology"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "NodalACTransportTechnology"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "NodalACTransportTechnology"), _openapi_validate)
    _openapi_field_power_systems_type = _decode(String, _required(_openapi_object, "power_systems_type", "NodalACTransportTechnology"), _openapi_validate)
    _openapi_field_reactance = haskey(_openapi_object, "reactance") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["reactance"], _openapi_validate) : ABSENT
    _openapi_field_requirements = haskey(_openapi_object, "requirements") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["requirements"], _openapi_validate) : ABSENT
    _openapi_field_resistance = haskey(_openapi_object, "resistance") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["resistance"], _openapi_validate) : ABSENT
    _openapi_field_start_node = _decode(Int64, _required(_openapi_object, "start_node", "NodalACTransportTechnology"), _openapi_validate)
    _openapi_field_unit_size = haskey(_openapi_object, "unit_size") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["unit_size"], _openapi_validate) : ABSENT
    _openapi_field_voltage = haskey(_openapi_object, "voltage") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["voltage"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","capacity_limits","capital_costs","end_node","financial_data","id","name","power_systems_type","reactance","requirements","resistance","start_node","unit_size","voltage") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return NodalACTransportTechnology(; available = _openapi_field_available, capacity_limits = _openapi_field_capacity_limits, capital_costs = _openapi_field_capital_costs, end_node = _openapi_field_end_node, financial_data = _openapi_field_financial_data, id = _openapi_field_id, name = _openapi_field_name, power_systems_type = _openapi_field_power_systems_type, reactance = _openapi_field_reactance, requirements = _openapi_field_requirements, resistance = _openapi_field_resistance, start_node = _openapi_field_start_node, unit_size = _openapi_field_unit_size, voltage = _openapi_field_voltage, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::NodalACTransportTechnology)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.capacity_limits isa Absent || (_openapi_output["capacity_limits"] = _encode(_openapi_value.capacity_limits))
    _openapi_value.capital_costs isa Absent || (_openapi_output["capital_costs"] = _encode(_openapi_value.capital_costs))
    _openapi_value.end_node isa Absent || (_openapi_output["end_node"] = _encode(_openapi_value.end_node))
    _openapi_value.financial_data isa Absent || (_openapi_output["financial_data"] = _encode(_openapi_value.financial_data))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_systems_type isa Absent || (_openapi_output["power_systems_type"] = _encode(_openapi_value.power_systems_type))
    _openapi_value.reactance isa Absent || (_openapi_output["reactance"] = _encode(_openapi_value.reactance))
    _openapi_value.requirements isa Absent || (_openapi_output["requirements"] = _encode(_openapi_value.requirements))
    _openapi_value.resistance isa Absent || (_openapi_output["resistance"] = _encode(_openapi_value.resistance))
    _openapi_value.start_node isa Absent || (_openapi_output["start_node"] = _encode(_openapi_value.start_node))
    _openapi_value.unit_size isa Absent || (_openapi_output["unit_size"] = _encode(_openapi_value.unit_size))
    _openapi_value.voltage isa Absent || (_openapi_output["voltage"] = _encode(_openapi_value.voltage))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/NodalACTransportTechnology"), _openapi_output, "encoding NodalACTransportTechnology"; direction = :neutral)
end

function _form_fields(_openapi_value::NodalACTransportTechnology)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.capacity_limits isa Absent || push!(_openapi_output, "capacity_limits" => _openapi_value.capacity_limits)
    _openapi_value.capital_costs isa Absent || push!(_openapi_output, "capital_costs" => _openapi_value.capital_costs)
    _openapi_value.end_node isa Absent || push!(_openapi_output, "end_node" => _openapi_value.end_node)
    _openapi_value.financial_data isa Absent || push!(_openapi_output, "financial_data" => _openapi_value.financial_data)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_systems_type isa Absent || push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.reactance isa Absent || push!(_openapi_output, "reactance" => _openapi_value.reactance)
    _openapi_value.requirements isa Absent || push!(_openapi_output, "requirements" => _openapi_value.requirements)
    _openapi_value.resistance isa Absent || push!(_openapi_output, "resistance" => _openapi_value.resistance)
    _openapi_value.start_node isa Absent || push!(_openapi_output, "start_node" => _openapi_value.start_node)
    _openapi_value.unit_size isa Absent || push!(_openapi_output, "unit_size" => _openapi_value.unit_size)
    _openapi_value.voltage isa Absent || push!(_openapi_output, "voltage" => _openapi_value.voltage)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
