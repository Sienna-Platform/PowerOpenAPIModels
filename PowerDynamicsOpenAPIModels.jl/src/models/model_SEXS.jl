@doc "    SEXS\n\nParameters of Simplified Excitation System Model - SEXS in PSSE.\n\n- `k`: Gain.\n- `ta_tb`: Ratio of lead and lag time constants.\n- `tb`: Lag time constant. Units: s.\n- `te`: Field circuit time constant. Units: s.\n- `v_lim`: Field voltage limits.\n- `v_ref`: Reference Voltage Set-point.\n- `id`: Unique integer identifier for this component."
Base.@kwdef struct SEXS
    k::Float64
    ta_tb::Float64
    tb::Float64
    te::Float64
    v_lim::SEXSVLim
    v_ref::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{SEXS}, value) = _decode(SEXS, value, true)
function _decode(::Type{SEXS}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/SEXS"), _openapi_raw, "decoding SEXS"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "SEXS")
    _openapi_field_k = _decode(Float64, _required(_openapi_object, "K", "SEXS"), _openapi_validate)
    _openapi_field_ta_tb = _decode(Float64, _required(_openapi_object, "Ta_Tb", "SEXS"), _openapi_validate)
    _openapi_field_tb = _decode(Float64, _required(_openapi_object, "Tb", "SEXS"), _openapi_validate)
    _openapi_field_te = _decode(Float64, _required(_openapi_object, "Te", "SEXS"), _openapi_validate)
    _openapi_field_v_lim = _decode(SEXSVLim, _required(_openapi_object, "V_lim", "SEXS"), _openapi_validate)
    _openapi_field_v_ref = haskey(_openapi_object, "V_ref") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["V_ref"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "SEXS"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("K","Ta_Tb","Tb","Te","V_lim","V_ref","id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return SEXS(; k = _openapi_field_k, ta_tb = _openapi_field_ta_tb, tb = _openapi_field_tb, te = _openapi_field_te, v_lim = _openapi_field_v_lim, v_ref = _openapi_field_v_ref, id = _openapi_field_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::SEXS)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.k isa Absent || (_openapi_output["K"] = _encode(_openapi_value.k))
    _openapi_value.ta_tb isa Absent || (_openapi_output["Ta_Tb"] = _encode(_openapi_value.ta_tb))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.v_lim isa Absent || (_openapi_output["V_lim"] = _encode(_openapi_value.v_lim))
    _openapi_value.v_ref isa Absent || (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/SEXS"), _openapi_output, "encoding SEXS"; direction = :neutral)
end

function _form_fields(_openapi_value::SEXS)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.k isa Absent || push!(_openapi_output, "K" => _openapi_value.k)
    _openapi_value.ta_tb isa Absent || push!(_openapi_output, "Ta_Tb" => _openapi_value.ta_tb)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.v_lim isa Absent || push!(_openapi_output, "V_lim" => _openapi_value.v_lim)
    _openapi_value.v_ref isa Absent || push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
