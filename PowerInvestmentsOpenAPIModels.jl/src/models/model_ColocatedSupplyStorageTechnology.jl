"""
    ColocatedSupplyStorageTechnology

Supply technology co-located with storage behind a shared grid connection. The generation and storage portions are referenced by id (`supply_technology` and `storage_technology`); the inverter that couples them to the grid carries its own capacity limits, capital and operating costs, and efficiency.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `power_systems_type`: Corresponding type to be used in PCM modeling.
  - `region`: Location where the component applies. Can be a zone or node.
  - `financial_data`: Struct containing relevant financial information for a technology.
  - `supply_technology`: The ID of the underlying supply technology (e.g., wind or solar) co-located with storage.
  - `storage_technology`: The ID of the underlying storage technology co-located with the supply technology.
  - `inverter_capacity_limits`: Limits on inverter capacity. Units: MW.
  - `capital_costs_inverter`: Capital and interconnection cost for investing in inverter capacity (capital cost in USD/MW).
  - `operation_costs_inverter`: Operational costs for using inverter in co-located systems. Units: USD/MWh.
  - `inverter_efficiency`: Efficiency of AC to DC conversion of inverter. Units: 1.
  - `inverter_supply_ratio`: Ratio of generation capacity to grid connection capacity. Units: 1.
"""
Base.@kwdef struct ColocatedSupplyStorageTechnology <: APIModel
    id::Int64
    name::String
    available::Union{Absent, Bool, Nothing} = ABSENT
    power_systems_type::String
    region::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    financial_data::TechnologyFinancialData
    supply_technology::Int64
    storage_technology::Int64
    inverter_capacity_limits::Union{Absent, MinMax, Nothing} = ABSENT
    capital_costs_inverter::CapitalCost
    operation_costs_inverter::ColocatedSupplyStorageTechnologyOperationCostsInverter
    inverter_efficiency::Float64
    inverter_supply_ratio::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ColocatedSupplyStorageTechnology}, value) =
    _decode(ColocatedSupplyStorageTechnology, value, true)
function _decode(
    ::Type{ColocatedSupplyStorageTechnology},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-f93e37d5ed4806981666.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ColocatedSupplyStorageTechnology";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ColocatedSupplyStorageTechnology")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "ColocatedSupplyStorageTechnology"),
        false,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "ColocatedSupplyStorageTechnology"),
        false,
    )
    _openapi_field_available =
        haskey(_openapi_object, "available") ?
        _decode(Union{Absent, Bool, Nothing}, _openapi_object["available"], false) : ABSENT
    _openapi_field_power_systems_type = _decode(
        String,
        _required(
            _openapi_object,
            "power_systems_type",
            "ColocatedSupplyStorageTechnology",
        ),
        false,
    )
    _openapi_field_region =
        haskey(_openapi_object, "region") ?
        _decode(Union{Absent, Nothing, Vector{Int64}}, _openapi_object["region"], false) :
        ABSENT
    _openapi_field_financial_data = _decode(
        TechnologyFinancialData,
        _required(_openapi_object, "financial_data", "ColocatedSupplyStorageTechnology"),
        false,
    )
    _openapi_field_supply_technology = _decode(
        Int64,
        _required(_openapi_object, "supply_technology", "ColocatedSupplyStorageTechnology"),
        false,
    )
    _openapi_field_storage_technology = _decode(
        Int64,
        _required(
            _openapi_object,
            "storage_technology",
            "ColocatedSupplyStorageTechnology",
        ),
        false,
    )
    _openapi_field_inverter_capacity_limits =
        haskey(_openapi_object, "inverter_capacity_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["inverter_capacity_limits"],
            false,
        ) : ABSENT
    _openapi_field_capital_costs_inverter = _decode(
        CapitalCost,
        _required(
            _openapi_object,
            "capital_costs_inverter",
            "ColocatedSupplyStorageTechnology",
        ),
        false,
    )
    _openapi_field_operation_costs_inverter = _decode(
        ColocatedSupplyStorageTechnologyOperationCostsInverter,
        _required(
            _openapi_object,
            "operation_costs_inverter",
            "ColocatedSupplyStorageTechnology",
        ),
        false,
    )
    _openapi_field_inverter_efficiency = _decode(
        Float64,
        _required(
            _openapi_object,
            "inverter_efficiency",
            "ColocatedSupplyStorageTechnology",
        ),
        false,
    )
    _openapi_field_inverter_supply_ratio = _decode(
        Float64,
        _required(
            _openapi_object,
            "inverter_supply_ratio",
            "ColocatedSupplyStorageTechnology",
        ),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "power_systems_type",
            "region",
            "financial_data",
            "supply_technology",
            "storage_technology",
            "inverter_capacity_limits",
            "capital_costs_inverter",
            "operation_costs_inverter",
            "inverter_efficiency",
            "inverter_supply_ratio",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return ColocatedSupplyStorageTechnology(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        power_systems_type=_openapi_field_power_systems_type,
        region=_openapi_field_region,
        financial_data=_openapi_field_financial_data,
        supply_technology=_openapi_field_supply_technology,
        storage_technology=_openapi_field_storage_technology,
        inverter_capacity_limits=_openapi_field_inverter_capacity_limits,
        capital_costs_inverter=_openapi_field_capital_costs_inverter,
        operation_costs_inverter=_openapi_field_operation_costs_inverter,
        inverter_efficiency=_openapi_field_inverter_efficiency,
        inverter_supply_ratio=_openapi_field_inverter_supply_ratio,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ColocatedSupplyStorageTechnology)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.power_systems_type isa Absent || (
        _openapi_output["power_systems_type"] =
            _encode_unvalidated(_openapi_value.power_systems_type)
    )
    _openapi_value.region isa Absent ||
        (_openapi_output["region"] = _encode_unvalidated(_openapi_value.region))
    _openapi_value.financial_data isa Absent || (
        _openapi_output["financial_data"] =
            _encode_unvalidated(_openapi_value.financial_data)
    )
    _openapi_value.supply_technology isa Absent || (
        _openapi_output["supply_technology"] =
            _encode_unvalidated(_openapi_value.supply_technology)
    )
    _openapi_value.storage_technology isa Absent || (
        _openapi_output["storage_technology"] =
            _encode_unvalidated(_openapi_value.storage_technology)
    )
    _openapi_value.inverter_capacity_limits isa Absent || (
        _openapi_output["inverter_capacity_limits"] =
            _encode_unvalidated(_openapi_value.inverter_capacity_limits)
    )
    _openapi_value.capital_costs_inverter isa Absent || (
        _openapi_output["capital_costs_inverter"] =
            _encode_unvalidated(_openapi_value.capital_costs_inverter)
    )
    _openapi_value.operation_costs_inverter isa Absent || (
        _openapi_output["operation_costs_inverter"] =
            _encode_unvalidated(_openapi_value.operation_costs_inverter)
    )
    _openapi_value.inverter_efficiency isa Absent || (
        _openapi_output["inverter_efficiency"] =
            _encode_unvalidated(_openapi_value.inverter_efficiency)
    )
    _openapi_value.inverter_supply_ratio isa Absent || (
        _openapi_output["inverter_supply_ratio"] =
            _encode_unvalidated(_openapi_value.inverter_supply_ratio)
    )
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::ColocatedSupplyStorageTechnology) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-f93e37d5ed4806981666.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ColocatedSupplyStorageTechnology";
    direction=:neutral,
)

function _form_fields(_openapi_value::ColocatedSupplyStorageTechnology)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.power_systems_type isa Absent ||
        push!(_openapi_output, "power_systems_type" => _openapi_value.power_systems_type)
    _openapi_value.region isa Absent ||
        push!(_openapi_output, "region" => _openapi_value.region)
    _openapi_value.financial_data isa Absent ||
        push!(_openapi_output, "financial_data" => _openapi_value.financial_data)
    _openapi_value.supply_technology isa Absent ||
        push!(_openapi_output, "supply_technology" => _openapi_value.supply_technology)
    _openapi_value.storage_technology isa Absent ||
        push!(_openapi_output, "storage_technology" => _openapi_value.storage_technology)
    _openapi_value.inverter_capacity_limits isa Absent || push!(
        _openapi_output,
        "inverter_capacity_limits" => _openapi_value.inverter_capacity_limits,
    )
    _openapi_value.capital_costs_inverter isa Absent || push!(
        _openapi_output,
        "capital_costs_inverter" => _openapi_value.capital_costs_inverter,
    )
    _openapi_value.operation_costs_inverter isa Absent || push!(
        _openapi_output,
        "operation_costs_inverter" => _openapi_value.operation_costs_inverter,
    )
    _openapi_value.inverter_efficiency isa Absent ||
        push!(_openapi_output, "inverter_efficiency" => _openapi_value.inverter_efficiency)
    _openapi_value.inverter_supply_ratio isa Absent || push!(
        _openapi_output,
        "inverter_supply_ratio" => _openapi_value.inverter_supply_ratio,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
