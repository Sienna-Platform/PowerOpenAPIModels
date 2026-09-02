@doc "    SwitchedAdmittance\n\nA switched admittance, with discrete steps to adjust the admittance.\n\nMost often used in power flow studies, iterating over the steps to see impacts of admittance on the results. Total admittance is calculated as: `Y` + `number_of_steps` * `Y_increase`.\n\n- `y`: Initial admittance at N = 0. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr .\n- `y_increase`: Vector with admittance increment step for each adjustable shunt block. For example, `Y_increase[2]` is the complex admittance increment for each step at block 2. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr .\n- `admittance_limits`: Shunt admittance limits for switched shunt model. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr .\n- `admittance_units`: Unit basis for the shunt admittance Y. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage).\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `bus`: ID of the bus that this component is connected to.\n- `control_mode`: Switched-shunt control mode (PSS/E MODSW).\n- `dynamic_injector`: ID of the corresponding dynamic injection model for admittance, if any.\n- `id`: Unique integer identifier for this component.\n- `initial_status`: Vector of initial switched shunt status, one for in-service and zero for out-of-service for block i (1 through 8).\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `number_of_steps`: Vector with number of steps for each adjustable shunt block. For example, `number_of_steps[2]` are the number of available steps for admittance increment at block 2.\n- `regulated_bus_number`: Bus number whose voltage/quantity this shunt regulates; 0 means local bus (PSS/E SWREM/NREG). Units: 1."
Base.@kwdef struct SwitchedAdmittance
    y::SwitchedAdmittanceY
    y_increase::Union{Absent,Nothing,Vector{ComplexNumber}} = ABSENT
    admittance_limits::Union{Absent,Nothing,SwitchedAdmittanceAdmittanceLimits} = ABSENT
    admittance_units::Union{Absent,Nothing,SwitchedAdmittanceAdmittanceUnits} = ABSENT
    available::Bool
    bus::Int64
    control_mode::Union{Absent,Nothing,SwitchedAdmittanceControlMode} = ABSENT
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    id::Int64
    initial_status::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    name::String
    number_of_steps::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    regulated_bus_number::Union{Absent,Int64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{SwitchedAdmittance}, value) = _decode(SwitchedAdmittance, value, true)
function _decode(::Type{SwitchedAdmittance}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/SwitchedAdmittance"), _openapi_raw, "decoding SwitchedAdmittance"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "SwitchedAdmittance")
    _openapi_field_y = _decode(SwitchedAdmittanceY, _required(_openapi_object, "Y", "SwitchedAdmittance"), _openapi_validate)
    _openapi_field_y_increase = haskey(_openapi_object, "Y_increase") ? _decode(Union{Absent,Nothing,Vector{ComplexNumber}}, _openapi_object["Y_increase"], _openapi_validate) : ABSENT
    _openapi_field_admittance_limits = haskey(_openapi_object, "admittance_limits") ? _decode(Union{Absent,Nothing,SwitchedAdmittanceAdmittanceLimits}, _openapi_object["admittance_limits"], _openapi_validate) : ABSENT
    _openapi_field_admittance_units = haskey(_openapi_object, "admittance_units") ? _decode(Union{Absent,Nothing,SwitchedAdmittanceAdmittanceUnits}, _openapi_object["admittance_units"], _openapi_validate) : ABSENT
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "SwitchedAdmittance"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "SwitchedAdmittance"), _openapi_validate)
    _openapi_field_control_mode = haskey(_openapi_object, "control_mode") ? _decode(Union{Absent,Nothing,SwitchedAdmittanceControlMode}, _openapi_object["control_mode"], _openapi_validate) : ABSENT
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "SwitchedAdmittance"), _openapi_validate)
    _openapi_field_initial_status = haskey(_openapi_object, "initial_status") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["initial_status"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "SwitchedAdmittance"), _openapi_validate)
    _openapi_field_number_of_steps = haskey(_openapi_object, "number_of_steps") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["number_of_steps"], _openapi_validate) : ABSENT
    _openapi_field_regulated_bus_number = haskey(_openapi_object, "regulated_bus_number") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["regulated_bus_number"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("Y","Y_increase","admittance_limits","admittance_units","available","bus","control_mode","dynamic_injector","id","initial_status","name","number_of_steps","regulated_bus_number") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return SwitchedAdmittance(; y = _openapi_field_y, y_increase = _openapi_field_y_increase, admittance_limits = _openapi_field_admittance_limits, admittance_units = _openapi_field_admittance_units, available = _openapi_field_available, bus = _openapi_field_bus, control_mode = _openapi_field_control_mode, dynamic_injector = _openapi_field_dynamic_injector, id = _openapi_field_id, initial_status = _openapi_field_initial_status, name = _openapi_field_name, number_of_steps = _openapi_field_number_of_steps, regulated_bus_number = _openapi_field_regulated_bus_number, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::SwitchedAdmittance)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.y isa Absent || (_openapi_output["Y"] = _encode(_openapi_value.y))
    _openapi_value.y_increase isa Absent || (_openapi_output["Y_increase"] = _encode(_openapi_value.y_increase))
    _openapi_value.admittance_limits isa Absent || (_openapi_output["admittance_limits"] = _encode(_openapi_value.admittance_limits))
    _openapi_value.admittance_units isa Absent || (_openapi_output["admittance_units"] = _encode(_openapi_value.admittance_units))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.control_mode isa Absent || (_openapi_output["control_mode"] = _encode(_openapi_value.control_mode))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.initial_status isa Absent || (_openapi_output["initial_status"] = _encode(_openapi_value.initial_status))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.number_of_steps isa Absent || (_openapi_output["number_of_steps"] = _encode(_openapi_value.number_of_steps))
    _openapi_value.regulated_bus_number isa Absent || (_openapi_output["regulated_bus_number"] = _encode(_openapi_value.regulated_bus_number))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/SwitchedAdmittance"), _openapi_output, "encoding SwitchedAdmittance"; direction = :neutral)
end

function _form_fields(_openapi_value::SwitchedAdmittance)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.y isa Absent || push!(_openapi_output, "Y" => _openapi_value.y)
    _openapi_value.y_increase isa Absent || push!(_openapi_output, "Y_increase" => _openapi_value.y_increase)
    _openapi_value.admittance_limits isa Absent || push!(_openapi_output, "admittance_limits" => _openapi_value.admittance_limits)
    _openapi_value.admittance_units isa Absent || push!(_openapi_output, "admittance_units" => _openapi_value.admittance_units)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.control_mode isa Absent || push!(_openapi_output, "control_mode" => _openapi_value.control_mode)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.initial_status isa Absent || push!(_openapi_output, "initial_status" => _openapi_value.initial_status)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.number_of_steps isa Absent || push!(_openapi_output, "number_of_steps" => _openapi_value.number_of_steps)
    _openapi_value.regulated_bus_number isa Absent || push!(_openapi_output, "regulated_bus_number" => _openapi_value.regulated_bus_number)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
