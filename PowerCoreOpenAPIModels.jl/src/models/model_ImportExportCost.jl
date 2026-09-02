@doc "    ImportExportCost\n\nCost representation for static (non-time-varying) imports and exports with neighboring areas, together with the ancillary services offered alongside them. The offer curves are piecewise incremental cost curves with an implied zero cost at zero power, and a weekly energy limit bounds each direction. The time-varying counterpart is `ImportExportTimeSeriesCost`.\n\n- `energy_export_weekly_limit`: Weekly limit on exported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh.\n- `energy_import_weekly_limit`: Weekly limit on imported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh.\n- `export_offer_curves`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term.\n- `import_offer_curves`: Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term."
Base.@kwdef struct ImportExportCost
    cost_type::Union{Absent,Nothing,String} = ABSENT
    energy_export_weekly_limit::Float64
    energy_import_weekly_limit::Float64
    export_offer_curves::Union{Absent,CostCurve,Nothing} = ABSENT
    import_offer_curves::Union{Absent,CostCurve,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ImportExportCost}, value) = _decode(ImportExportCost, value, true)
function _decode(::Type{ImportExportCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ImportExportCost"), _openapi_raw, "decoding ImportExportCost"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ImportExportCost")
    _openapi_field_cost_type = haskey(_openapi_object, "cost_type") ? _decode(Union{Absent,Nothing,String}, _openapi_object["cost_type"], _openapi_validate) : ABSENT
    _openapi_field_energy_export_weekly_limit = _decode(Float64, _required(_openapi_object, "energy_export_weekly_limit", "ImportExportCost"), _openapi_validate)
    _openapi_field_energy_import_weekly_limit = _decode(Float64, _required(_openapi_object, "energy_import_weekly_limit", "ImportExportCost"), _openapi_validate)
    _openapi_field_export_offer_curves = haskey(_openapi_object, "export_offer_curves") ? _decode(Union{Absent,CostCurve,Nothing}, _openapi_object["export_offer_curves"], _openapi_validate) : ABSENT
    _openapi_field_import_offer_curves = haskey(_openapi_object, "import_offer_curves") ? _decode(Union{Absent,CostCurve,Nothing}, _openapi_object["import_offer_curves"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("cost_type","energy_export_weekly_limit","energy_import_weekly_limit","export_offer_curves","import_offer_curves") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ImportExportCost(; cost_type = _openapi_field_cost_type, energy_export_weekly_limit = _openapi_field_energy_export_weekly_limit, energy_import_weekly_limit = _openapi_field_energy_import_weekly_limit, export_offer_curves = _openapi_field_export_offer_curves, import_offer_curves = _openapi_field_import_offer_curves, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ImportExportCost)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.cost_type isa Absent || (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.energy_export_weekly_limit isa Absent || (_openapi_output["energy_export_weekly_limit"] = _encode(_openapi_value.energy_export_weekly_limit))
    _openapi_value.energy_import_weekly_limit isa Absent || (_openapi_output["energy_import_weekly_limit"] = _encode(_openapi_value.energy_import_weekly_limit))
    _openapi_value.export_offer_curves isa Absent || (_openapi_output["export_offer_curves"] = _encode(_openapi_value.export_offer_curves))
    _openapi_value.import_offer_curves isa Absent || (_openapi_output["import_offer_curves"] = _encode(_openapi_value.import_offer_curves))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ImportExportCost"), _openapi_output, "encoding ImportExportCost"; direction = :neutral)
end

function _form_fields(_openapi_value::ImportExportCost)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.cost_type isa Absent || push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.energy_export_weekly_limit isa Absent || push!(_openapi_output, "energy_export_weekly_limit" => _openapi_value.energy_export_weekly_limit)
    _openapi_value.energy_import_weekly_limit isa Absent || push!(_openapi_output, "energy_import_weekly_limit" => _openapi_value.energy_import_weekly_limit)
    _openapi_value.export_offer_curves isa Absent || push!(_openapi_output, "export_offer_curves" => _openapi_value.export_offer_curves)
    _openapi_value.import_offer_curves isa Absent || push!(_openapi_output, "import_offer_curves" => _openapi_value.import_offer_curves)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
