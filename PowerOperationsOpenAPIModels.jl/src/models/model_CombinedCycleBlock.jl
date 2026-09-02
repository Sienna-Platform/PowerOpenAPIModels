@doc "    CombinedCycleBlock\n\nAttribute to represent combined cycle generation by block configuration that shares heat recovery conversions. CT and CA unit assignments to HRSGs are recorded as CombinedCycleAssociation rows.\n\n- `configuration`: Shaft and turbine arrangement of a combined cycle plant: a single shaft carrying one combustion and one steam turbine, separate shafts for the two, two or three combustion turbines feeding one steam turbine, or `Other` for any arrangement outside these.\n- `heat_recovery_to_steam_factor`: Factor for heat recovery to steam conversion\n- `name`: Name of the combined cycle block"
Base.@kwdef struct CombinedCycleBlock
    configuration::CombinedCycleBlockConfiguration
    heat_recovery_to_steam_factor::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    name::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{CombinedCycleBlock}, value) = _decode(CombinedCycleBlock, value, true)
function _decode(::Type{CombinedCycleBlock}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleBlock"), _openapi_raw, "decoding CombinedCycleBlock"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "CombinedCycleBlock")
    _openapi_field_configuration = _decode(CombinedCycleBlockConfiguration, _required(_openapi_object, "configuration", "CombinedCycleBlock"), _openapi_validate)
    _openapi_field_heat_recovery_to_steam_factor = haskey(_openapi_object, "heat_recovery_to_steam_factor") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["heat_recovery_to_steam_factor"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "CombinedCycleBlock"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "CombinedCycleBlock"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("configuration","heat_recovery_to_steam_factor","id","name") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return CombinedCycleBlock(; configuration = _openapi_field_configuration, heat_recovery_to_steam_factor = _openapi_field_heat_recovery_to_steam_factor, id = _openapi_field_id, name = _openapi_field_name, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::CombinedCycleBlock)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.configuration isa Absent || (_openapi_output["configuration"] = _encode(_openapi_value.configuration))
    _openapi_value.heat_recovery_to_steam_factor isa Absent || (_openapi_output["heat_recovery_to_steam_factor"] = _encode(_openapi_value.heat_recovery_to_steam_factor))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleBlock"), _openapi_output, "encoding CombinedCycleBlock"; direction = :neutral)
end

function _form_fields(_openapi_value::CombinedCycleBlock)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.configuration isa Absent || push!(_openapi_output, "configuration" => _openapi_value.configuration)
    _openapi_value.heat_recovery_to_steam_factor isa Absent || push!(_openapi_output, "heat_recovery_to_steam_factor" => _openapi_value.heat_recovery_to_steam_factor)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
