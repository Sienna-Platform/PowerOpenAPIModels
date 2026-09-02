@doc "    StorageTechnology\n\nCandidate storage technology in a region. Charge capacity, discharge capacity, and energy capacity are added independently, each with its own capital cost, unit size, and capacity limits; charge and discharge efficiency, self-discharge losses, and limits on the ratio of energy to discharge capacity complete the description.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).\n- `capacity_limits_charge`: Allowable installed power capacity for charging of a storage technology. Units: MW.\n- `capacity_limits_discharge`: Allowable installed power capacity for discharging of a storage technology. Units: MW.\n- `capacity_limits_energy`: Allowable installed energy capacity for a storage technology. Units: MWh.\n- `capital_costs_charge`: Capital costs for investing in a storage technology's charge capacity. Units: USD/MW.\n- `capital_costs_discharge`: Capital costs for investing in a storage technology's discharge capacity. Units: USD/MW.\n- `capital_costs_energy`: Capital costs for investing in a storage technology's energy capacity. Units: USD/MWh.\n- `duration_limits`: Minimum and maximum duration limits (energy to discharge capacity ratio) for a storage technology (minutes). Units: min.\n- `efficiency`: Efficiency of charging storage, fraction of total charge (in) and discharge (out) capacity. Units: 1.\n- `financial_data`: Struct containing relevant financial information for a technology.\n- `id`: ID for individual component.\n- `lifetime`: Maximum number of years a technology can be active once installed. Units: yr.\n- `losses`: Self-discharge of storage (fraction of energy stored per hour). Units: 1.\n- `min_discharge_fraction`: Minimum discharge as a fraction of total discharge capacity. Units: 1.\n- `name`: Name of the component.\n- `operation_costs`: Fixed and variable O&M costs for a storage technology. Units: USD/MWh.\n- `power_systems_type`: Corresponding type to be used in PCM modeling.\n- `prime_mover_type`: Prime mover for generator.\n- `region`: Location where the component applies. Can be a zone or node.\n- `requirements`: List of requirement IDs associated with the component.\n- `storage_tech`: Storage Technology Type.\n- `unit_size_charge`: Used for discrete investment decisions. Unit size of charging capacity. Units: MW.\n- `unit_size_discharge`: Used for discrete investment decisions. Size of each unit of discharging capacity being built. Units: MW.\n- `unit_size_energy`: Used for discrete investment decisions. Size of each unit of energy capacity being built. Units: MWh."
Base.@kwdef struct StorageTechnology
    available::Bool
    capacity_limits_charge::Union{Absent,Nothing,StorageTechnologyCapacityLimitsCharge} = ABSENT
    capacity_limits_discharge::Union{Absent,Nothing,StorageTechnologyCapacityLimitsDischarge} = ABSENT
    capacity_limits_energy::Union{Absent,Nothing,StorageTechnologyCapacityLimitsEnergy} = ABSENT
    capital_costs_charge::Union{Absent,Nothing,StorageTechnologyCapitalCostsCharge} = ABSENT
    capital_costs_discharge::Union{Absent,Nothing,StorageTechnologyCapitalCostsDischarge} = ABSENT
    capital_costs_energy::Union{Absent,Nothing,StorageTechnologyCapitalCostsEnergy} = ABSENT
    duration_limits::Union{Absent,Nothing,StorageTechnologyDurationLimits} = ABSENT
    efficiency::Union{Absent,Nothing,StorageTechnologyEfficiency} = ABSENT
    financial_data::StorageTechnologyFinancialData
    id::Int64
    lifetime::Union{Absent,Int64,Nothing} = ABSENT
    losses::Union{Absent,Float64,Nothing} = ABSENT
    min_discharge_fraction::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    operation_costs::Union{Absent,Nothing,StorageTechnologyOperationCosts} = ABSENT
    power_systems_type::String
    prime_mover_type::Union{Absent,Nothing,StorageTechnologyPrimeMoverType} = ABSENT
    region::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    requirements::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    storage_tech::StorageTechnologyStorageTech
    unit_size_charge::Union{Absent,Float64,Nothing} = ABSENT
    unit_size_discharge::Union{Absent,Float64,Nothing} = ABSENT
    unit_size_energy::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{StorageTechnology}, value) = _decode(StorageTechnology, value, true)
function _decode(::Type{StorageTechnology}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology"), _openapi_raw, "decoding StorageTechnology"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "StorageTechnology")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "StorageTechnology"), _openapi_validate)
    _openapi_field_capacity_limits_charge = haskey(_openapi_object, "capacity_limits_charge") ? _decode(Union{Absent,Nothing,StorageTechnologyCapacityLimitsCharge}, _openapi_object["capacity_limits_charge"], _openapi_validate) : ABSENT
    _openapi_field_capacity_limits_discharge = haskey(_openapi_object, "capacity_limits_discharge") ? _decode(Union{Absent,Nothing,StorageTechnologyCapacityLimitsDischarge}, _openapi_object["capacity_limits_discharge"], _openapi_validate) : ABSENT
    _openapi_field_capacity_limits_energy = haskey(_openapi_object, "capacity_limits_energy") ? _decode(Union{Absent,Nothing,StorageTechnologyCapacityLimitsEnergy}, _openapi_object["capacity_limits_energy"], _openapi_validate) : ABSENT
    _openapi_field_capital_costs_charge = haskey(_openapi_object, "capital_costs_charge") ? _decode(Union{Absent,Nothing,StorageTechnologyCapitalCostsCharge}, _openapi_object["capital_costs_charge"], _openapi_validate) : ABSENT
    _openapi_field_capital_costs_discharge = haskey(_openapi_object, "capital_costs_discharge") ? _decode(Union{Absent,Nothing,StorageTechnologyCapitalCostsDischarge}, _openapi_object["capital_costs_discharge"], _openapi_validate) : ABSENT
    _openapi_field_capital_costs_energy = haskey(_openapi_object, "capital_costs_energy") ? _decode(Union{Absent,Nothing,StorageTechnologyCapitalCostsEnergy}, _openapi_object["capital_costs_energy"], _openapi_validate) : ABSENT
    _openapi_field_duration_limits = haskey(_openapi_object, "duration_limits") ? _decode(Union{Absent,Nothing,StorageTechnologyDurationLimits}, _openapi_object["duration_limits"], _openapi_validate) : ABSENT
    _openapi_field_efficiency = haskey(_openapi_object, "efficiency") ? _decode(Union{Absent,Nothing,StorageTechnologyEfficiency}, _openapi_object["efficiency"], _openapi_validate) : ABSENT
    _openapi_field_financial_data = _decode(StorageTechnologyFinancialData, _required(_openapi_object, "financial_data", "StorageTechnology"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "StorageTechnology"), _openapi_validate)
    _openapi_field_lifetime = haskey(_openapi_object, "lifetime") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["lifetime"], _openapi_validate) : ABSENT
    _openapi_field_losses = haskey(_openapi_object, "losses") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["losses"], _openapi_validate) : ABSENT
    _openapi_field_min_discharge_fraction = haskey(_openapi_object, "min_discharge_fraction") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["min_discharge_fraction"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "StorageTechnology"), _openapi_validate)
    _openapi_field_operation_costs = haskey(_openapi_object, "operation_costs") ? _decode(Union{Absent,Nothing,StorageTechnologyOperationCosts}, _openapi_object["operation_costs"], _openapi_validate) : ABSENT
    _openapi_field_power_systems_type = _decode(String, _required(_openapi_object, "power_systems_type", "StorageTechnology"), _openapi_validate)
    _openapi_field_prime_mover_type = haskey(_openapi_object, "prime_mover_type") ? _decode(Union{Absent,Nothing,StorageTechnologyPrimeMoverType}, _openapi_object["prime_mover_type"], _openapi_validate) : ABSENT
    _openapi_field_region = haskey(_openapi_object, "region") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["region"], _openapi_validate) : ABSENT
    _openapi_field_requirements = haskey(_openapi_object, "requirements") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["requirements"], _openapi_validate) : ABSENT
    _openapi_field_storage_tech = _decode(StorageTechnologyStorageTech, _required(_openapi_object, "storage_tech", "StorageTechnology"), _openapi_validate)
    _openapi_field_unit_size_charge = haskey(_openapi_object, "unit_size_charge") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["unit_size_charge"], _openapi_validate) : ABSENT
    _openapi_field_unit_size_discharge = haskey(_openapi_object, "unit_size_discharge") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["unit_size_discharge"], _openapi_validate) : ABSENT
    _openapi_field_unit_size_energy = haskey(_openapi_object, "unit_size_energy") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["unit_size_energy"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","capacity_limits_charge","capacity_limits_discharge","capacity_limits_energy","capital_costs_charge","capital_costs_discharge","capital_costs_energy","duration_limits","efficiency","financial_data","id","lifetime","losses","min_discharge_fraction","name","operation_costs","power_systems_type","prime_mover_type","region","requirements","storage_tech","unit_size_charge","unit_size_discharge","unit_size_energy") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return StorageTechnology(; available = _openapi_field_available, capacity_limits_charge = _openapi_field_capacity_limits_charge, capacity_limits_discharge = _openapi_field_capacity_limits_discharge, capacity_limits_energy = _openapi_field_capacity_limits_energy, capital_costs_charge = _openapi_field_capital_costs_charge, capital_costs_discharge = _openapi_field_capital_costs_discharge, capital_costs_energy = _openapi_field_capital_costs_energy, duration_limits = _openapi_field_duration_limits, efficiency = _openapi_field_efficiency, financial_data = _openapi_field_financial_data, id = _openapi_field_id, lifetime = _openapi_field_lifetime, losses = _openapi_field_losses, min_discharge_fraction = _openapi_field_min_discharge_fraction, name = _openapi_field_name, operation_costs = _openapi_field_operation_costs, power_systems_type = _openapi_field_power_systems_type, prime_mover_type = _openapi_field_prime_mover_type, region = _openapi_field_region, requirements = _openapi_field_requirements, storage_tech = _openapi_field_storage_tech, unit_size_charge = _openapi_field_unit_size_charge, unit_size_discharge = _openapi_field_unit_size_discharge, unit_size_energy = _openapi_field_unit_size_energy, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::StorageTechnology)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.capacity_limits_charge isa Absent || (_openapi_output["capacity_limits_charge"] = _encode(_openapi_value.capacity_limits_charge))
    _openapi_value.capacity_limits_discharge isa Absent || (_openapi_output["capacity_limits_discharge"] = _encode(_openapi_value.capacity_limits_discharge))
    _openapi_value.capacity_limits_energy isa Absent || (_openapi_output["capacity_limits_energy"] = _encode(_openapi_value.capacity_limits_energy))
    _openapi_value.capital_costs_charge isa Absent || (_openapi_output["capital_costs_charge"] = _encode(_openapi_value.capital_costs_charge))
    _openapi_value.capital_costs_discharge isa Absent || (_openapi_output["capital_costs_discharge"] = _encode(_openapi_value.capital_costs_discharge))
    _openapi_value.capital_costs_energy isa Absent || (_openapi_output["capital_costs_energy"] = _encode(_openapi_value.capital_costs_energy))
    _openapi_value.duration_limits isa Absent || (_openapi_output["duration_limits"] = _encode(_openapi_value.duration_limits))
    _openapi_value.efficiency isa Absent || (_openapi_output["efficiency"] = _encode(_openapi_value.efficiency))
    _openapi_value.financial_data isa Absent || (_openapi_output["financial_data"] = _encode(_openapi_value.financial_data))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.lifetime isa Absent || (_openapi_output["lifetime"] = _encode(_openapi_value.lifetime))
    _openapi_value.losses isa Absent || (_openapi_output["losses"] = _encode(_openapi_value.losses))
    _openapi_value.min_discharge_fraction isa Absent || (_openapi_output["min_discharge_fraction"] = _encode(_openapi_value.min_discharge_fraction))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.operation_costs isa Absent || (_openapi_output["operation_costs"] = _encode(_openapi_value.operation_costs))
    _openapi_value.power_systems_type isa Absent || (_openapi_output["power_systems_type"] = _encode(_openapi_value.power_systems_type))
    _openapi_value.prime_mover_type isa Absent || (_openapi_output["prime_mover_type"] = _encode(_openapi_value.prime_mover_type))
    _openapi_value.region isa Absent || (_openapi_output["region"] = _encode(_openapi_value.region))
    _openapi_value.requirements isa Absent || (_openapi_output["requirements"] = _encode(_openapi_value.requirements))
    _openapi_value.storage_tech isa Absent || (_openapi_output["storage_tech"] = _encode(_openapi_value.storage_tech))
    _openapi_value.unit_size_charge isa Absent || (_openapi_output["unit_size_charge"] = _encode(_openapi_value.unit_size_charge))
    _openapi_value.unit_size_discharge isa Absent || (_openapi_output["unit_size_discharge"] = _encode(_openapi_value.unit_size_discharge))
    _openapi_value.unit_size_energy isa Absent || (_openapi_output["unit_size_energy"] = _encode(_openapi_value.unit_size_energy))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology"), _openapi_output, "encoding StorageTechnology"; direction = :neutral)
end

function _form_fields(_openapi_value::StorageTechnology)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.capacity_limits_charge isa Absent || push!(_openapi_output, "capacity_limits_charge" => _openapi_value.capacity_limits_charge)
    _openapi_value.capacity_limits_discharge isa Absent || push!(_openapi_output, "capacity_limits_discharge" => _openapi_value.capacity_limits_discharge)
    _openapi_value.capacity_limits_energy isa Absent || push!(_openapi_output, "capacity_limits_energy" => _openapi_value.capacity_limits_energy)
    _openapi_value.capital_costs_charge isa Absent || push!(_openapi_output, "capital_costs_charge" => _openapi_value.capital_costs_charge)
    _openapi_value.capital_costs_discharge isa Absent || push!(_openapi_output, "capital_costs_discharge" => _openapi_value.capital_costs_discharge)
    _openapi_value.capital_costs_energy isa Absent || push!(_openapi_output, "capital_costs_energy" => _openapi_value.capital_costs_energy)
    _openapi_value.duration_limits isa Absent || push!(_openapi_output, "duration_limits" => _openapi_value.duration_limits)
    _openapi_value.efficiency isa Absent || push!(_openapi_output, "efficiency" => _openapi_value.efficiency)
    _openapi_value.financial_data isa Absent || push!(_openapi_output, "financial_data" => _openapi_value.financial_data)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.lifetime isa Absent || push!(_openapi_output, "lifetime" => _openapi_value.lifetime)
    _openapi_value.losses isa Absent || push!(_openapi_output, "losses" => _openapi_value.losses)
    _openapi_value.min_discharge_fraction isa Absent || push!(_openapi_output, "min_discharge_fraction" => _openapi_value.min_discharge_fraction)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.operation_costs isa Absent || push!(_openapi_output, "operation_costs" => _openapi_value.operation_costs)
    _openapi_value.power_systems_type isa Absent || push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.prime_mover_type isa Absent || push!(_openapi_output, "prime_mover_type" => _openapi_value.prime_mover_type)
    _openapi_value.region isa Absent || push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.requirements isa Absent || push!(_openapi_output, "requirements" => _openapi_value.requirements)
    _openapi_value.storage_tech isa Absent || push!(_openapi_output, "storage_tech" => _openapi_value.storage_tech)
    _openapi_value.unit_size_charge isa Absent || push!(_openapi_output, "unit_size_charge" => _openapi_value.unit_size_charge)
    _openapi_value.unit_size_discharge isa Absent || push!(_openapi_output, "unit_size_discharge" => _openapi_value.unit_size_discharge)
    _openapi_value.unit_size_energy isa Absent || push!(_openapi_output, "unit_size_energy" => _openapi_value.unit_size_energy)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
