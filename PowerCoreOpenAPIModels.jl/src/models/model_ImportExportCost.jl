"""
    ImportExportCost

Cost representation for static (non-time-varying) imports and exports with neighboring areas, together with the ancillary services offered alongside them. The offer curves are piecewise incremental cost curves with an implied zero cost at zero power, and a weekly energy limit bounds each direction. The time-varying counterpart is `ImportExportTimeSeriesCost`.

  - `import_offer_curves`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. Units: x-axis per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu ; y-axis USD/h .
  - `export_offer_curves`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. Units: x-axis per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu ; y-axis USD/h .
  - `energy_import_weekly_limit`: Weekly limit on imported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh.
  - `energy_export_weekly_limit`: Weekly limit on exported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh.
"""
Base.@kwdef struct ImportExportCost <: APIModel
    cost_type::Union{Absent, Nothing, String} = ABSENT
    import_offer_curves::Union{Absent, CostCurve, Nothing} = ABSENT
    export_offer_curves::Union{Absent, CostCurve, Nothing} = ABSENT
    energy_import_weekly_limit::Float64
    energy_export_weekly_limit::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ImportExportCost}, value) = _decode(ImportExportCost, value, true)
function _decode(::Type{ImportExportCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ImportExportCost",
        ),
        _openapi_raw,
        "decoding ImportExportCost";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ImportExportCost")
    _openapi_field_cost_type =
        haskey(_openapi_object, "cost_type") ?
        _decode(Union{Absent, Nothing, String}, _openapi_object["cost_type"], false) :
        ABSENT
    _openapi_field_import_offer_curves =
        haskey(_openapi_object, "import_offer_curves") ?
        _decode(
            Union{Absent, CostCurve, Nothing},
            _openapi_object["import_offer_curves"],
            false,
        ) : ABSENT
    _openapi_field_export_offer_curves =
        haskey(_openapi_object, "export_offer_curves") ?
        _decode(
            Union{Absent, CostCurve, Nothing},
            _openapi_object["export_offer_curves"],
            false,
        ) : ABSENT
    _openapi_field_energy_import_weekly_limit = _decode(
        Float64,
        _required(_openapi_object, "energy_import_weekly_limit", "ImportExportCost"),
        false,
    )
    _openapi_field_energy_export_weekly_limit = _decode(
        Float64,
        _required(_openapi_object, "energy_export_weekly_limit", "ImportExportCost"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "cost_type",
            "import_offer_curves",
            "export_offer_curves",
            "energy_import_weekly_limit",
            "energy_export_weekly_limit",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return ImportExportCost(;
        cost_type=_openapi_field_cost_type,
        import_offer_curves=_openapi_field_import_offer_curves,
        export_offer_curves=_openapi_field_export_offer_curves,
        energy_import_weekly_limit=_openapi_field_energy_import_weekly_limit,
        energy_export_weekly_limit=_openapi_field_energy_export_weekly_limit,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ImportExportCost)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.cost_type isa Absent ||
        (_openapi_output["cost_type"] = _encode_unvalidated(_openapi_value.cost_type))
    _openapi_value.import_offer_curves isa Absent || (
        _openapi_output["import_offer_curves"] =
            _encode_unvalidated(_openapi_value.import_offer_curves)
    )
    _openapi_value.export_offer_curves isa Absent || (
        _openapi_output["export_offer_curves"] =
            _encode_unvalidated(_openapi_value.export_offer_curves)
    )
    _openapi_value.energy_import_weekly_limit isa Absent || (
        _openapi_output["energy_import_weekly_limit"] =
            _encode_unvalidated(_openapi_value.energy_import_weekly_limit)
    )
    _openapi_value.energy_export_weekly_limit isa Absent || (
        _openapi_output["energy_export_weekly_limit"] =
            _encode_unvalidated(_openapi_value.energy_export_weekly_limit)
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
_encode(_openapi_value::ImportExportCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/ImportExportCost",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ImportExportCost";
    direction=:neutral,
)

function _form_fields(_openapi_value::ImportExportCost)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.cost_type isa Absent ||
        push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.import_offer_curves isa Absent ||
        push!(_openapi_output, "import_offer_curves" => _openapi_value.import_offer_curves)
    _openapi_value.export_offer_curves isa Absent ||
        push!(_openapi_output, "export_offer_curves" => _openapi_value.export_offer_curves)
    _openapi_value.energy_import_weekly_limit isa Absent || push!(
        _openapi_output,
        "energy_import_weekly_limit" => _openapi_value.energy_import_weekly_limit,
    )
    _openapi_value.energy_export_weekly_limit isa Absent || push!(
        _openapi_output,
        "energy_export_weekly_limit" => _openapi_value.energy_export_weekly_limit,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
