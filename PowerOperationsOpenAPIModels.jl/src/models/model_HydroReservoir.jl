"""
    HydroReservoir

A hydropower reservoir feeding, or fed by, the turbines attached to it. Storage level, inflow, outflow, and spillage are recorded in the basis named by `level_data_type` — volume, head, or energy — and the upstream and downstream associations set the reservoir's place in a cascade.

  - `storage_level_limits`: Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh .
  - `initial_level`: Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh .
  - `spillage_limits`: in psy5 a required param with an option to be nothing Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW .
  - `inflow`: Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW .
  - `outflow`: Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW .
  - `level_targets`: in psy5 a required param with an option to be nothing Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh .
  - `intake_elevation`: Units: m.
  - `head_to_volume_factor`: `FunctionData` mapping reservoir head to stored volume.
  - `evaporative_loss`: Standing loss from evaporation as a fraction of the reservoir's stored volume/energy lost per hour. Units: 1.
"""
Base.@kwdef struct HydroReservoir <: APIModel
    id::Int64
    name::String
    available::Bool
    storage_level_limits::MinMax
    initial_level::Float64
    spillage_limits::Union{Absent, MinMax, Nothing} = ABSENT
    inflow::Float64
    outflow::Float64
    level_targets::Union{Absent, Float64, Nothing} = ABSENT
    intake_elevation::Float64
    head_to_volume_factor::FunctionData
    upstream_turbines::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    downstream_turbines::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    upstream_reservoirs::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    operation_cost::HydroReservoirOperationCost
    evaporative_loss::Union{Absent, Float64, Nothing} = ABSENT
    level_data_type::Union{Absent, HydroReservoirLevelDataType, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{HydroReservoir}, value) = _decode(HydroReservoir, value, true)
function _decode(::Type{HydroReservoir}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-d7efd24f681bcc70f626.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding HydroReservoir";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "HydroReservoir")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_storage_level_limits = _decode(
        MinMax,
        _required(_openapi_object, "storage_level_limits", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_initial_level = _decode(
        Float64,
        _required(_openapi_object, "initial_level", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_spillage_limits =
        haskey(_openapi_object, "spillage_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["spillage_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_inflow = _decode(
        Float64,
        _required(_openapi_object, "inflow", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_outflow = _decode(
        Float64,
        _required(_openapi_object, "outflow", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_level_targets =
        haskey(_openapi_object, "level_targets") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["level_targets"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_intake_elevation = _decode(
        Float64,
        _required(_openapi_object, "intake_elevation", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_head_to_volume_factor = _decode(
        FunctionData,
        _required(_openapi_object, "head_to_volume_factor", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_upstream_turbines =
        haskey(_openapi_object, "upstream_turbines") ?
        _decode(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["upstream_turbines"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_downstream_turbines =
        haskey(_openapi_object, "downstream_turbines") ?
        _decode(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["downstream_turbines"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_upstream_reservoirs =
        haskey(_openapi_object, "upstream_reservoirs") ?
        _decode(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["upstream_reservoirs"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_operation_cost = _decode(
        HydroReservoirOperationCost,
        _required(_openapi_object, "operation_cost", "HydroReservoir"),
        _openapi_validate,
    )
    _openapi_field_evaporative_loss =
        haskey(_openapi_object, "evaporative_loss") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["evaporative_loss"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_level_data_type =
        haskey(_openapi_object, "level_data_type") ?
        _decode(
            Union{Absent, HydroReservoirLevelDataType, Nothing},
            _openapi_object["level_data_type"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "storage_level_limits",
            "initial_level",
            "spillage_limits",
            "inflow",
            "outflow",
            "level_targets",
            "intake_elevation",
            "head_to_volume_factor",
            "upstream_turbines",
            "downstream_turbines",
            "upstream_reservoirs",
            "operation_cost",
            "evaporative_loss",
            "level_data_type",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return HydroReservoir(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        storage_level_limits=_openapi_field_storage_level_limits,
        initial_level=_openapi_field_initial_level,
        spillage_limits=_openapi_field_spillage_limits,
        inflow=_openapi_field_inflow,
        outflow=_openapi_field_outflow,
        level_targets=_openapi_field_level_targets,
        intake_elevation=_openapi_field_intake_elevation,
        head_to_volume_factor=_openapi_field_head_to_volume_factor,
        upstream_turbines=_openapi_field_upstream_turbines,
        downstream_turbines=_openapi_field_downstream_turbines,
        upstream_reservoirs=_openapi_field_upstream_reservoirs,
        operation_cost=_openapi_field_operation_cost,
        evaporative_loss=_openapi_field_evaporative_loss,
        level_data_type=_openapi_field_level_data_type,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::HydroReservoir)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.storage_level_limits isa Absent || (
        _openapi_output["storage_level_limits"] =
            _encode(_openapi_value.storage_level_limits)
    )
    _openapi_value.initial_level isa Absent ||
        (_openapi_output["initial_level"] = _encode(_openapi_value.initial_level))
    _openapi_value.spillage_limits isa Absent ||
        (_openapi_output["spillage_limits"] = _encode(_openapi_value.spillage_limits))
    _openapi_value.inflow isa Absent ||
        (_openapi_output["inflow"] = _encode(_openapi_value.inflow))
    _openapi_value.outflow isa Absent ||
        (_openapi_output["outflow"] = _encode(_openapi_value.outflow))
    _openapi_value.level_targets isa Absent ||
        (_openapi_output["level_targets"] = _encode(_openapi_value.level_targets))
    _openapi_value.intake_elevation isa Absent ||
        (_openapi_output["intake_elevation"] = _encode(_openapi_value.intake_elevation))
    _openapi_value.head_to_volume_factor isa Absent || (
        _openapi_output["head_to_volume_factor"] =
            _encode(_openapi_value.head_to_volume_factor)
    )
    _openapi_value.upstream_turbines isa Absent ||
        (_openapi_output["upstream_turbines"] = _encode(_openapi_value.upstream_turbines))
    _openapi_value.downstream_turbines isa Absent || (
        _openapi_output["downstream_turbines"] =
            _encode(_openapi_value.downstream_turbines)
    )
    _openapi_value.upstream_reservoirs isa Absent || (
        _openapi_output["upstream_reservoirs"] =
            _encode(_openapi_value.upstream_reservoirs)
    )
    _openapi_value.operation_cost isa Absent ||
        (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.evaporative_loss isa Absent ||
        (_openapi_output["evaporative_loss"] = _encode(_openapi_value.evaporative_loss))
    _openapi_value.level_data_type isa Absent ||
        (_openapi_output["level_data_type"] = _encode(_openapi_value.level_data_type))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-d7efd24f681bcc70f626.json",
            pointer="",
        ),
        _openapi_output,
        "encoding HydroReservoir";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::HydroReservoir)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.storage_level_limits isa Absent || push!(
        _openapi_output,
        "storage_level_limits" => _openapi_value.storage_level_limits,
    )
    _openapi_value.initial_level isa Absent ||
        push!(_openapi_output, "initial_level" => _openapi_value.initial_level)
    _openapi_value.spillage_limits isa Absent ||
        push!(_openapi_output, "spillage_limits" => _openapi_value.spillage_limits)
    _openapi_value.inflow isa Absent ||
        push!(_openapi_output, "inflow" => _openapi_value.inflow)
    _openapi_value.outflow isa Absent ||
        push!(_openapi_output, "outflow" => _openapi_value.outflow)
    _openapi_value.level_targets isa Absent ||
        push!(_openapi_output, "level_targets" => _openapi_value.level_targets)
    _openapi_value.intake_elevation isa Absent ||
        push!(_openapi_output, "intake_elevation" => _openapi_value.intake_elevation)
    _openapi_value.head_to_volume_factor isa Absent || push!(
        _openapi_output,
        "head_to_volume_factor" => _openapi_value.head_to_volume_factor,
    )
    _openapi_value.upstream_turbines isa Absent ||
        push!(_openapi_output, "upstream_turbines" => _openapi_value.upstream_turbines)
    _openapi_value.downstream_turbines isa Absent ||
        push!(_openapi_output, "downstream_turbines" => _openapi_value.downstream_turbines)
    _openapi_value.upstream_reservoirs isa Absent ||
        push!(_openapi_output, "upstream_reservoirs" => _openapi_value.upstream_reservoirs)
    _openapi_value.operation_cost isa Absent ||
        push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.evaporative_loss isa Absent ||
        push!(_openapi_output, "evaporative_loss" => _openapi_value.evaporative_loss)
    _openapi_value.level_data_type isa Absent ||
        push!(_openapi_output, "level_data_type" => _openapi_value.level_data_type)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
