@doc "    ImportExportTimeSeriesCost\n\nCost representation for time-varying imports and exports with neighboring areas. The static counterpart is ImportExportCost.\n\n- `energy_export_weekly_limit`: Weekly limit on exported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh.\n- `energy_import_weekly_limit`: Weekly limit on imported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh.\n- `export_offer_curves`: Export price curves whose value curve admits only the TIME_SERIES_INCREMENTAL variant; any other variant is rejected by the consuming constructor.\n- `import_offer_curves`: Import price curves whose value curve admits only the TIME_SERIES_INCREMENTAL variant; any other variant is rejected by the consuming constructor."
Base.@kwdef struct ImportExportTimeSeriesCost
    ancillary_service_offers::Vector{Int64}
    cost_type::String
    energy_export_weekly_limit::Float64
    energy_import_weekly_limit::Float64
    export_offer_curves::CostCurve
    import_offer_curves::CostCurve
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ImportExportTimeSeriesCost}, value) = _decode(ImportExportTimeSeriesCost, value, true)
function _decode(::Type{ImportExportTimeSeriesCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ImportExportTimeSeriesCost"), _openapi_raw, "decoding ImportExportTimeSeriesCost"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ImportExportTimeSeriesCost")
    _openapi_field_ancillary_service_offers = _decode(Vector{Int64}, _required(_openapi_object, "ancillary_service_offers", "ImportExportTimeSeriesCost"), _openapi_validate)
    _openapi_field_cost_type = _decode(String, _required(_openapi_object, "cost_type", "ImportExportTimeSeriesCost"), _openapi_validate)
    _openapi_field_energy_export_weekly_limit = _decode(Float64, _required(_openapi_object, "energy_export_weekly_limit", "ImportExportTimeSeriesCost"), _openapi_validate)
    _openapi_field_energy_import_weekly_limit = _decode(Float64, _required(_openapi_object, "energy_import_weekly_limit", "ImportExportTimeSeriesCost"), _openapi_validate)
    _openapi_field_export_offer_curves = _decode(CostCurve, _required(_openapi_object, "export_offer_curves", "ImportExportTimeSeriesCost"), _openapi_validate)
    _openapi_field_import_offer_curves = _decode(CostCurve, _required(_openapi_object, "import_offer_curves", "ImportExportTimeSeriesCost"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("ancillary_service_offers","cost_type","energy_export_weekly_limit","energy_import_weekly_limit","export_offer_curves","import_offer_curves") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ImportExportTimeSeriesCost(; ancillary_service_offers = _openapi_field_ancillary_service_offers, cost_type = _openapi_field_cost_type, energy_export_weekly_limit = _openapi_field_energy_export_weekly_limit, energy_import_weekly_limit = _openapi_field_energy_import_weekly_limit, export_offer_curves = _openapi_field_export_offer_curves, import_offer_curves = _openapi_field_import_offer_curves, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ImportExportTimeSeriesCost)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.ancillary_service_offers isa Absent || (_openapi_output["ancillary_service_offers"] = _encode(_openapi_value.ancillary_service_offers))
    _openapi_value.cost_type isa Absent || (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.energy_export_weekly_limit isa Absent || (_openapi_output["energy_export_weekly_limit"] = _encode(_openapi_value.energy_export_weekly_limit))
    _openapi_value.energy_import_weekly_limit isa Absent || (_openapi_output["energy_import_weekly_limit"] = _encode(_openapi_value.energy_import_weekly_limit))
    _openapi_value.export_offer_curves isa Absent || (_openapi_output["export_offer_curves"] = _encode(_openapi_value.export_offer_curves))
    _openapi_value.import_offer_curves isa Absent || (_openapi_output["import_offer_curves"] = _encode(_openapi_value.import_offer_curves))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ImportExportTimeSeriesCost"), _openapi_output, "encoding ImportExportTimeSeriesCost"; direction = :neutral)
end

function _form_fields(_openapi_value::ImportExportTimeSeriesCost)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.ancillary_service_offers isa Absent || push!(_openapi_output, "ancillary_service_offers" => _openapi_value.ancillary_service_offers)
    _openapi_value.cost_type isa Absent || push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.energy_export_weekly_limit isa Absent || push!(_openapi_output, "energy_export_weekly_limit" => _openapi_value.energy_export_weekly_limit)
    _openapi_value.energy_import_weekly_limit isa Absent || push!(_openapi_output, "energy_import_weekly_limit" => _openapi_value.energy_import_weekly_limit)
    _openapi_value.export_offer_curves isa Absent || push!(_openapi_output, "export_offer_curves" => _openapi_value.export_offer_curves)
    _openapi_value.import_offer_curves isa Absent || push!(_openapi_output, "import_offer_curves" => _openapi_value.import_offer_curves)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
