@doc "    AGC\n\nAutomatic generation control (AGC) for the system or a certain `Area` within the system. This model uses a proportional-integral-derivative (PID) control to simulate a \"smooth\" response of the AGC to the area control error (ACE).\n\n- `k_d`: PID Derivative Constant.\n- `k_i`: PID Integral Constant.\n- `k_p`: PID Proportional Constant.\n- `area`: ID of the area controlled by the AGC.\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `bias`: Area frequency bias. Units: MW/Hz.\n- `delta_t`: PID Discretization period. Units: s.\n- `id`: Unique integer identifier for this component.\n- `initial_ace`: Initial condition for ACE.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name."
Base.@kwdef struct AGC
    k_d::Float64
    k_i::Float64
    k_p::Float64
    area::Union{Absent,Int64,Nothing} = ABSENT
    available::Bool
    bias::Float64
    delta_t::Float64
    id::Int64
    initial_ace::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{AGC}, value) = _decode(AGC, value, true)
function _decode(::Type{AGC}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/AGC"), _openapi_raw, "decoding AGC"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "AGC")
    _openapi_field_k_d = _decode(Float64, _required(_openapi_object, "K_d", "AGC"), _openapi_validate)
    _openapi_field_k_i = _decode(Float64, _required(_openapi_object, "K_i", "AGC"), _openapi_validate)
    _openapi_field_k_p = _decode(Float64, _required(_openapi_object, "K_p", "AGC"), _openapi_validate)
    _openapi_field_area = haskey(_openapi_object, "area") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["area"], _openapi_validate) : ABSENT
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "AGC"), _openapi_validate)
    _openapi_field_bias = _decode(Float64, _required(_openapi_object, "bias", "AGC"), _openapi_validate)
    _openapi_field_delta_t = _decode(Float64, _required(_openapi_object, "delta_t", "AGC"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "AGC"), _openapi_validate)
    _openapi_field_initial_ace = haskey(_openapi_object, "initial_ace") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["initial_ace"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "AGC"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("K_d","K_i","K_p","area","available","bias","delta_t","id","initial_ace","name") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return AGC(; k_d = _openapi_field_k_d, k_i = _openapi_field_k_i, k_p = _openapi_field_k_p, area = _openapi_field_area, available = _openapi_field_available, bias = _openapi_field_bias, delta_t = _openapi_field_delta_t, id = _openapi_field_id, initial_ace = _openapi_field_initial_ace, name = _openapi_field_name, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::AGC)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.k_d isa Absent || (_openapi_output["K_d"] = _encode(_openapi_value.k_d))
    _openapi_value.k_i isa Absent || (_openapi_output["K_i"] = _encode(_openapi_value.k_i))
    _openapi_value.k_p isa Absent || (_openapi_output["K_p"] = _encode(_openapi_value.k_p))
    _openapi_value.area isa Absent || (_openapi_output["area"] = _encode(_openapi_value.area))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bias isa Absent || (_openapi_output["bias"] = _encode(_openapi_value.bias))
    _openapi_value.delta_t isa Absent || (_openapi_output["delta_t"] = _encode(_openapi_value.delta_t))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.initial_ace isa Absent || (_openapi_output["initial_ace"] = _encode(_openapi_value.initial_ace))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/AGC"), _openapi_output, "encoding AGC"; direction = :neutral)
end

function _form_fields(_openapi_value::AGC)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.k_d isa Absent || push!(_openapi_output, "K_d" => _openapi_value.k_d)
    _openapi_value.k_i isa Absent || push!(_openapi_output, "K_i" => _openapi_value.k_i)
    _openapi_value.k_p isa Absent || push!(_openapi_output, "K_p" => _openapi_value.k_p)
    _openapi_value.area isa Absent || push!(_openapi_output, "area" => _openapi_value.area)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bias isa Absent || push!(_openapi_output, "bias" => _openapi_value.bias)
    _openapi_value.delta_t isa Absent || push!(_openapi_output, "delta_t" => _openapi_value.delta_t)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.initial_ace isa Absent || push!(_openapi_output, "initial_ace" => _openapi_value.initial_ace)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
