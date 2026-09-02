@doc "    ColocatedSupplyStorageTechnology\n\nSupply technology that supports storage co-located with wind and solar generation. Capital costs, operating costs, capacity limits, and lifetimes are carried separately for the solar, wind, storage, and inverter portions, which share one grid connection.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).\n- `capacity_energy_limits`: Allowable installed energy capacity for the storage component. Units: MWh.\n- `capacity_limits_solar`: Maximum allowable installed capacity for the solar component. Units: MW.\n- `capacity_limits_wind`: Maximum allowable installed capacity for the wind component. Units: MW.\n- `capacity_power_limits`: Allowable installed power capacity for the storage component. Units: MW.\n- `capital_costs_energy`: Capital costs for investing in the storage technology's energy capacity. Units: USD/MWh.\n- `capital_costs_inverter`: Capital costs for investing in inverter capacity. Units: USD/MW.\n- `capital_costs_power`: Capital costs for investing in the storage technology's charge/discharge capacity. Units: USD/MW.\n- `capital_costs_solar`: Capital costs for investing in a solar technology. Units: USD/MW.\n- `capital_costs_wind`: Capital costs for investing in a wind technology. Units: USD/MW.\n- `duration_limits`: Minimum and maximum duration limits for the storage component (minutes). Units: min.\n- `efficiency_storage`: Efficiency of charging storage, fraction of total charge (in) and discharge (out) capacity. Units: 1.\n- `financial_data`: Struct containing relevant financial information for a technology.\n- `id`: ID for individual component.\n- `inverter_efficiency`: Efficiency of AC to DC conversion of inverter. Units: 1.\n- `inverter_supply_ratio`: Ratio of generation capacity to grid connection capacity. Units: 1.\n- `lifetime_solar`: Maximum number of years the solar component can be active once installed. Units: yr.\n- `lifetime_storage`: Maximum number of years the storage component can be active once installed. Units: yr.\n- `lifetime_wind`: Maximum number of years the wind component can be active once installed. Units: yr.\n- `losses_storage`: Self-discharge of storage (fraction of stored energy per hour). Units: 1.\n- `max_inverter_capacity`: Limit on inverter capacity. Units: MW.\n- `min_inverter_capacity`: Minimum inverter capacity. Units: MW.\n- `name`: Name of the component.\n- `operation_costs_energy`: Fixed and variable O&M costs for the storage energy component. Units: USD/MWh.\n- `operation_costs_inverter`: Operational costs for using inverter in co-located systems. Units: USD/MWh.\n- `operation_costs_power`: Fixed and variable O&M costs for the storage power component. Units: USD/MWh.\n- `operation_costs_solar`: Fixed and variable O&M costs for the solar component. Units: USD/MWh.\n- `operation_costs_wind`: Fixed and variable O&M costs for the wind component. Units: USD/MWh.\n- `power_systems_type`: Corresponding type to be used in PCM modeling.\n- `region`: Location where the component applies. Can be a zone or node.\n- `requirements`: List of requirement IDs associated with the component."
Base.@kwdef struct ColocatedSupplyStorageTechnology
    available::Union{Absent,Bool,Nothing} = ABSENT
    capacity_energy_limits::Union{Absent,ColocatedSupplyStorageTechnologyCapacityEnergyLimits,Nothing} = ABSENT
    capacity_limits_solar::Union{Absent,ColocatedSupplyStorageTechnologyCapacityLimitsSolar,Nothing} = ABSENT
    capacity_limits_wind::Union{Absent,ColocatedSupplyStorageTechnologyCapacityLimitsWind,Nothing} = ABSENT
    capacity_power_limits::Union{Absent,ColocatedSupplyStorageTechnologyCapacityPowerLimits,Nothing} = ABSENT
    capital_costs_energy::Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsEnergy,Nothing} = ABSENT
    capital_costs_inverter::ColocatedSupplyStorageTechnologyCapitalCostsInverter
    capital_costs_power::Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsPower,Nothing} = ABSENT
    capital_costs_solar::Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsSolar,Nothing} = ABSENT
    capital_costs_wind::Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsWind,Nothing} = ABSENT
    duration_limits::Union{Absent,ColocatedSupplyStorageTechnologyDurationLimits,Nothing} = ABSENT
    efficiency_storage::Union{Absent,ColocatedSupplyStorageTechnologyEfficiencyStorage,Nothing} = ABSENT
    financial_data::ColocatedSupplyStorageTechnologyFinancialData
    id::Int64
    inverter_efficiency::Float64
    inverter_supply_ratio::Float64
    lifetime_solar::Union{Absent,Int64,Nothing} = ABSENT
    lifetime_storage::Union{Absent,Int64,Nothing} = ABSENT
    lifetime_wind::Union{Absent,Int64,Nothing} = ABSENT
    losses_storage::Union{Absent,Float64,Nothing} = ABSENT
    max_inverter_capacity::Union{Absent,Float64,Nothing} = ABSENT
    min_inverter_capacity::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    operation_costs_energy::Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsEnergy,Nothing} = ABSENT
    operation_costs_inverter::ColocatedSupplyStorageTechnologyOperationCostsInverter
    operation_costs_power::Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsPower,Nothing} = ABSENT
    operation_costs_solar::Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsSolar,Nothing} = ABSENT
    operation_costs_wind::Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsWind,Nothing} = ABSENT
    power_systems_type::String
    region::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    requirements::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ColocatedSupplyStorageTechnology}, value) = _decode(ColocatedSupplyStorageTechnology, value, true)
function _decode(::Type{ColocatedSupplyStorageTechnology}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/ColocatedSupplyStorageTechnology"), _openapi_raw, "decoding ColocatedSupplyStorageTechnology"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ColocatedSupplyStorageTechnology")
    _openapi_field_available = haskey(_openapi_object, "available") ? _decode(Union{Absent,Bool,Nothing}, _openapi_object["available"], _openapi_validate) : ABSENT
    _openapi_field_capacity_energy_limits = haskey(_openapi_object, "capacity_energy_limits") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyCapacityEnergyLimits,Nothing}, _openapi_object["capacity_energy_limits"], _openapi_validate) : ABSENT
    _openapi_field_capacity_limits_solar = haskey(_openapi_object, "capacity_limits_solar") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyCapacityLimitsSolar,Nothing}, _openapi_object["capacity_limits_solar"], _openapi_validate) : ABSENT
    _openapi_field_capacity_limits_wind = haskey(_openapi_object, "capacity_limits_wind") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyCapacityLimitsWind,Nothing}, _openapi_object["capacity_limits_wind"], _openapi_validate) : ABSENT
    _openapi_field_capacity_power_limits = haskey(_openapi_object, "capacity_power_limits") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyCapacityPowerLimits,Nothing}, _openapi_object["capacity_power_limits"], _openapi_validate) : ABSENT
    _openapi_field_capital_costs_energy = haskey(_openapi_object, "capital_costs_energy") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsEnergy,Nothing}, _openapi_object["capital_costs_energy"], _openapi_validate) : ABSENT
    _openapi_field_capital_costs_inverter = _decode(ColocatedSupplyStorageTechnologyCapitalCostsInverter, _required(_openapi_object, "capital_costs_inverter", "ColocatedSupplyStorageTechnology"), _openapi_validate)
    _openapi_field_capital_costs_power = haskey(_openapi_object, "capital_costs_power") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsPower,Nothing}, _openapi_object["capital_costs_power"], _openapi_validate) : ABSENT
    _openapi_field_capital_costs_solar = haskey(_openapi_object, "capital_costs_solar") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsSolar,Nothing}, _openapi_object["capital_costs_solar"], _openapi_validate) : ABSENT
    _openapi_field_capital_costs_wind = haskey(_openapi_object, "capital_costs_wind") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsWind,Nothing}, _openapi_object["capital_costs_wind"], _openapi_validate) : ABSENT
    _openapi_field_duration_limits = haskey(_openapi_object, "duration_limits") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyDurationLimits,Nothing}, _openapi_object["duration_limits"], _openapi_validate) : ABSENT
    _openapi_field_efficiency_storage = haskey(_openapi_object, "efficiency_storage") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyEfficiencyStorage,Nothing}, _openapi_object["efficiency_storage"], _openapi_validate) : ABSENT
    _openapi_field_financial_data = _decode(ColocatedSupplyStorageTechnologyFinancialData, _required(_openapi_object, "financial_data", "ColocatedSupplyStorageTechnology"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "ColocatedSupplyStorageTechnology"), _openapi_validate)
    _openapi_field_inverter_efficiency = _decode(Float64, _required(_openapi_object, "inverter_efficiency", "ColocatedSupplyStorageTechnology"), _openapi_validate)
    _openapi_field_inverter_supply_ratio = _decode(Float64, _required(_openapi_object, "inverter_supply_ratio", "ColocatedSupplyStorageTechnology"), _openapi_validate)
    _openapi_field_lifetime_solar = haskey(_openapi_object, "lifetime_solar") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["lifetime_solar"], _openapi_validate) : ABSENT
    _openapi_field_lifetime_storage = haskey(_openapi_object, "lifetime_storage") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["lifetime_storage"], _openapi_validate) : ABSENT
    _openapi_field_lifetime_wind = haskey(_openapi_object, "lifetime_wind") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["lifetime_wind"], _openapi_validate) : ABSENT
    _openapi_field_losses_storage = haskey(_openapi_object, "losses_storage") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["losses_storage"], _openapi_validate) : ABSENT
    _openapi_field_max_inverter_capacity = haskey(_openapi_object, "max_inverter_capacity") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_inverter_capacity"], _openapi_validate) : ABSENT
    _openapi_field_min_inverter_capacity = haskey(_openapi_object, "min_inverter_capacity") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["min_inverter_capacity"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "ColocatedSupplyStorageTechnology"), _openapi_validate)
    _openapi_field_operation_costs_energy = haskey(_openapi_object, "operation_costs_energy") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsEnergy,Nothing}, _openapi_object["operation_costs_energy"], _openapi_validate) : ABSENT
    _openapi_field_operation_costs_inverter = _decode(ColocatedSupplyStorageTechnologyOperationCostsInverter, _required(_openapi_object, "operation_costs_inverter", "ColocatedSupplyStorageTechnology"), _openapi_validate)
    _openapi_field_operation_costs_power = haskey(_openapi_object, "operation_costs_power") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsPower,Nothing}, _openapi_object["operation_costs_power"], _openapi_validate) : ABSENT
    _openapi_field_operation_costs_solar = haskey(_openapi_object, "operation_costs_solar") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsSolar,Nothing}, _openapi_object["operation_costs_solar"], _openapi_validate) : ABSENT
    _openapi_field_operation_costs_wind = haskey(_openapi_object, "operation_costs_wind") ? _decode(Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsWind,Nothing}, _openapi_object["operation_costs_wind"], _openapi_validate) : ABSENT
    _openapi_field_power_systems_type = _decode(String, _required(_openapi_object, "power_systems_type", "ColocatedSupplyStorageTechnology"), _openapi_validate)
    _openapi_field_region = haskey(_openapi_object, "region") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["region"], _openapi_validate) : ABSENT
    _openapi_field_requirements = haskey(_openapi_object, "requirements") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["requirements"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","capacity_energy_limits","capacity_limits_solar","capacity_limits_wind","capacity_power_limits","capital_costs_energy","capital_costs_inverter","capital_costs_power","capital_costs_solar","capital_costs_wind","duration_limits","efficiency_storage","financial_data","id","inverter_efficiency","inverter_supply_ratio","lifetime_solar","lifetime_storage","lifetime_wind","losses_storage","max_inverter_capacity","min_inverter_capacity","name","operation_costs_energy","operation_costs_inverter","operation_costs_power","operation_costs_solar","operation_costs_wind","power_systems_type","region","requirements") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ColocatedSupplyStorageTechnology(; available = _openapi_field_available, capacity_energy_limits = _openapi_field_capacity_energy_limits, capacity_limits_solar = _openapi_field_capacity_limits_solar, capacity_limits_wind = _openapi_field_capacity_limits_wind, capacity_power_limits = _openapi_field_capacity_power_limits, capital_costs_energy = _openapi_field_capital_costs_energy, capital_costs_inverter = _openapi_field_capital_costs_inverter, capital_costs_power = _openapi_field_capital_costs_power, capital_costs_solar = _openapi_field_capital_costs_solar, capital_costs_wind = _openapi_field_capital_costs_wind, duration_limits = _openapi_field_duration_limits, efficiency_storage = _openapi_field_efficiency_storage, financial_data = _openapi_field_financial_data, id = _openapi_field_id, inverter_efficiency = _openapi_field_inverter_efficiency, inverter_supply_ratio = _openapi_field_inverter_supply_ratio, lifetime_solar = _openapi_field_lifetime_solar, lifetime_storage = _openapi_field_lifetime_storage, lifetime_wind = _openapi_field_lifetime_wind, losses_storage = _openapi_field_losses_storage, max_inverter_capacity = _openapi_field_max_inverter_capacity, min_inverter_capacity = _openapi_field_min_inverter_capacity, name = _openapi_field_name, operation_costs_energy = _openapi_field_operation_costs_energy, operation_costs_inverter = _openapi_field_operation_costs_inverter, operation_costs_power = _openapi_field_operation_costs_power, operation_costs_solar = _openapi_field_operation_costs_solar, operation_costs_wind = _openapi_field_operation_costs_wind, power_systems_type = _openapi_field_power_systems_type, region = _openapi_field_region, requirements = _openapi_field_requirements, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ColocatedSupplyStorageTechnology)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.capacity_energy_limits isa Absent || (_openapi_output["capacity_energy_limits"] = _encode(_openapi_value.capacity_energy_limits))
    _openapi_value.capacity_limits_solar isa Absent || (_openapi_output["capacity_limits_solar"] = _encode(_openapi_value.capacity_limits_solar))
    _openapi_value.capacity_limits_wind isa Absent || (_openapi_output["capacity_limits_wind"] = _encode(_openapi_value.capacity_limits_wind))
    _openapi_value.capacity_power_limits isa Absent || (_openapi_output["capacity_power_limits"] = _encode(_openapi_value.capacity_power_limits))
    _openapi_value.capital_costs_energy isa Absent || (_openapi_output["capital_costs_energy"] = _encode(_openapi_value.capital_costs_energy))
    _openapi_value.capital_costs_inverter isa Absent || (_openapi_output["capital_costs_inverter"] = _encode(_openapi_value.capital_costs_inverter))
    _openapi_value.capital_costs_power isa Absent || (_openapi_output["capital_costs_power"] = _encode(_openapi_value.capital_costs_power))
    _openapi_value.capital_costs_solar isa Absent || (_openapi_output["capital_costs_solar"] = _encode(_openapi_value.capital_costs_solar))
    _openapi_value.capital_costs_wind isa Absent || (_openapi_output["capital_costs_wind"] = _encode(_openapi_value.capital_costs_wind))
    _openapi_value.duration_limits isa Absent || (_openapi_output["duration_limits"] = _encode(_openapi_value.duration_limits))
    _openapi_value.efficiency_storage isa Absent || (_openapi_output["efficiency_storage"] = _encode(_openapi_value.efficiency_storage))
    _openapi_value.financial_data isa Absent || (_openapi_output["financial_data"] = _encode(_openapi_value.financial_data))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.inverter_efficiency isa Absent || (_openapi_output["inverter_efficiency"] = _encode(_openapi_value.inverter_efficiency))
    _openapi_value.inverter_supply_ratio isa Absent || (_openapi_output["inverter_supply_ratio"] = _encode(_openapi_value.inverter_supply_ratio))
    _openapi_value.lifetime_solar isa Absent || (_openapi_output["lifetime_solar"] = _encode(_openapi_value.lifetime_solar))
    _openapi_value.lifetime_storage isa Absent || (_openapi_output["lifetime_storage"] = _encode(_openapi_value.lifetime_storage))
    _openapi_value.lifetime_wind isa Absent || (_openapi_output["lifetime_wind"] = _encode(_openapi_value.lifetime_wind))
    _openapi_value.losses_storage isa Absent || (_openapi_output["losses_storage"] = _encode(_openapi_value.losses_storage))
    _openapi_value.max_inverter_capacity isa Absent || (_openapi_output["max_inverter_capacity"] = _encode(_openapi_value.max_inverter_capacity))
    _openapi_value.min_inverter_capacity isa Absent || (_openapi_output["min_inverter_capacity"] = _encode(_openapi_value.min_inverter_capacity))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.operation_costs_energy isa Absent || (_openapi_output["operation_costs_energy"] = _encode(_openapi_value.operation_costs_energy))
    _openapi_value.operation_costs_inverter isa Absent || (_openapi_output["operation_costs_inverter"] = _encode(_openapi_value.operation_costs_inverter))
    _openapi_value.operation_costs_power isa Absent || (_openapi_output["operation_costs_power"] = _encode(_openapi_value.operation_costs_power))
    _openapi_value.operation_costs_solar isa Absent || (_openapi_output["operation_costs_solar"] = _encode(_openapi_value.operation_costs_solar))
    _openapi_value.operation_costs_wind isa Absent || (_openapi_output["operation_costs_wind"] = _encode(_openapi_value.operation_costs_wind))
    _openapi_value.power_systems_type isa Absent || (_openapi_output["power_systems_type"] = _encode(_openapi_value.power_systems_type))
    _openapi_value.region isa Absent || (_openapi_output["region"] = _encode(_openapi_value.region))
    _openapi_value.requirements isa Absent || (_openapi_output["requirements"] = _encode(_openapi_value.requirements))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/ColocatedSupplyStorageTechnology"), _openapi_output, "encoding ColocatedSupplyStorageTechnology"; direction = :neutral)
end

function _form_fields(_openapi_value::ColocatedSupplyStorageTechnology)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.capacity_energy_limits isa Absent || push!(_openapi_output, "capacity_energy_limits" => _openapi_value.capacity_energy_limits)
    _openapi_value.capacity_limits_solar isa Absent || push!(_openapi_output, "capacity_limits_solar" => _openapi_value.capacity_limits_solar)
    _openapi_value.capacity_limits_wind isa Absent || push!(_openapi_output, "capacity_limits_wind" => _openapi_value.capacity_limits_wind)
    _openapi_value.capacity_power_limits isa Absent || push!(_openapi_output, "capacity_power_limits" => _openapi_value.capacity_power_limits)
    _openapi_value.capital_costs_energy isa Absent || push!(_openapi_output, "capital_costs_energy" => _openapi_value.capital_costs_energy)
    _openapi_value.capital_costs_inverter isa Absent || push!(_openapi_output, "capital_costs_inverter" => _openapi_value.capital_costs_inverter)
    _openapi_value.capital_costs_power isa Absent || push!(_openapi_output, "capital_costs_power" => _openapi_value.capital_costs_power)
    _openapi_value.capital_costs_solar isa Absent || push!(_openapi_output, "capital_costs_solar" => _openapi_value.capital_costs_solar)
    _openapi_value.capital_costs_wind isa Absent || push!(_openapi_output, "capital_costs_wind" => _openapi_value.capital_costs_wind)
    _openapi_value.duration_limits isa Absent || push!(_openapi_output, "duration_limits" => _openapi_value.duration_limits)
    _openapi_value.efficiency_storage isa Absent || push!(_openapi_output, "efficiency_storage" => _openapi_value.efficiency_storage)
    _openapi_value.financial_data isa Absent || push!(_openapi_output, "financial_data" => _openapi_value.financial_data)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.inverter_efficiency isa Absent || push!(_openapi_output, "inverter_efficiency" => _openapi_value.inverter_efficiency)
    _openapi_value.inverter_supply_ratio isa Absent || push!(_openapi_output, "inverter_supply_ratio" => _openapi_value.inverter_supply_ratio)
    _openapi_value.lifetime_solar isa Absent || push!(_openapi_output, "lifetime_solar" => _openapi_value.lifetime_solar)
    _openapi_value.lifetime_storage isa Absent || push!(_openapi_output, "lifetime_storage" => _openapi_value.lifetime_storage)
    _openapi_value.lifetime_wind isa Absent || push!(_openapi_output, "lifetime_wind" => _openapi_value.lifetime_wind)
    _openapi_value.losses_storage isa Absent || push!(_openapi_output, "losses_storage" => _openapi_value.losses_storage)
    _openapi_value.max_inverter_capacity isa Absent || push!(_openapi_output, "max_inverter_capacity" => _openapi_value.max_inverter_capacity)
    _openapi_value.min_inverter_capacity isa Absent || push!(_openapi_output, "min_inverter_capacity" => _openapi_value.min_inverter_capacity)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.operation_costs_energy isa Absent || push!(_openapi_output, "operation_costs_energy" => _openapi_value.operation_costs_energy)
    _openapi_value.operation_costs_inverter isa Absent || push!(_openapi_output, "operation_costs_inverter" => _openapi_value.operation_costs_inverter)
    _openapi_value.operation_costs_power isa Absent || push!(_openapi_output, "operation_costs_power" => _openapi_value.operation_costs_power)
    _openapi_value.operation_costs_solar isa Absent || push!(_openapi_output, "operation_costs_solar" => _openapi_value.operation_costs_solar)
    _openapi_value.operation_costs_wind isa Absent || push!(_openapi_output, "operation_costs_wind" => _openapi_value.operation_costs_wind)
    _openapi_value.power_systems_type isa Absent || push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.region isa Absent || push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.requirements isa Absent || push!(_openapi_output, "requirements" => _openapi_value.requirements)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
