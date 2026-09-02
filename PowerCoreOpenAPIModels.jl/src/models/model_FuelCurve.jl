@doc "    FuelCurve\n\nVariable operation cost of a device expressed in fuel consumed — MBTU, liters, m^3 — together with the price that converts fuel to currency. Wraps a `ValueCurve` in input-output, incremental, or average-rate form; exactly one of `fuel_cost` and `fuel_cost_time_series` supplies the price.\n\n- `fuel_cost`: Fixed fuel cost per unit of fuel, or null when fuel_cost_time_series names a time-varying one. Exactly one of the two is set; producers and consumers enforce it.\n- `fuel_cost_time_series`: Store-minted id of the fuel-cost time series association, or null when fuel_cost carries a fixed value. Exactly one of the two is set.\n- `power_units`: Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component's own `power_units` (against that component's `base_power`), a cost payload's own `power_units` (e.g. `CostCurve`, against the owning component's `base_power`), and a time series association's own `unit_system` (governing only that one series).\n- `startup_fuel_offtake`: Fuel consumed during startup, as a curve in the unit's fuel units.\n- `value_curve`: A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate.\n- `vom_cost`: A curve whose y values are the total input `f(x)` at production level `x` — currency per hour against MW in a cost curve, fuel per hour against MW in a fuel curve. The y axis is an absolute quantity, not a rate; use `IncrementalCurve` for marginal-rate data."
Base.@kwdef struct FuelCurve
    fuel_cost::Union{Absent,Union{Float64,Nothing}} = ABSENT
    fuel_cost_time_series::Union{Absent,Union{Int64,Nothing}} = ABSENT
    power_units::UnitSystem
    startup_fuel_offtake::Union{Absent,InputOutputCurve,Nothing} = ABSENT
    value_curve::ValueCurve
    variable_cost_type::String
    vom_cost::InputOutputCurve
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{FuelCurve}, value) = _decode(FuelCurve, value, true)
function _decode(::Type{FuelCurve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/FuelCurve"), _openapi_raw, "decoding FuelCurve"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "FuelCurve")
    _openapi_field_fuel_cost = haskey(_openapi_object, "fuel_cost") ? _decode(Union{Absent,Union{Float64,Nothing}}, _openapi_object["fuel_cost"], _openapi_validate) : ABSENT
    _openapi_field_fuel_cost_time_series = haskey(_openapi_object, "fuel_cost_time_series") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["fuel_cost_time_series"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(UnitSystem, _required(_openapi_object, "power_units", "FuelCurve"), _openapi_validate)
    _openapi_field_startup_fuel_offtake = haskey(_openapi_object, "startup_fuel_offtake") ? _decode(Union{Absent,InputOutputCurve,Nothing}, _openapi_object["startup_fuel_offtake"], _openapi_validate) : ABSENT
    _openapi_field_value_curve = _decode(ValueCurve, _required(_openapi_object, "value_curve", "FuelCurve"), _openapi_validate)
    _openapi_field_variable_cost_type = _decode(String, _required(_openapi_object, "variable_cost_type", "FuelCurve"), _openapi_validate)
    _openapi_field_vom_cost = _decode(InputOutputCurve, _required(_openapi_object, "vom_cost", "FuelCurve"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("fuel_cost","fuel_cost_time_series","power_units","startup_fuel_offtake","value_curve","variable_cost_type","vom_cost") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return FuelCurve(; fuel_cost = _openapi_field_fuel_cost, fuel_cost_time_series = _openapi_field_fuel_cost_time_series, power_units = _openapi_field_power_units, startup_fuel_offtake = _openapi_field_startup_fuel_offtake, value_curve = _openapi_field_value_curve, variable_cost_type = _openapi_field_variable_cost_type, vom_cost = _openapi_field_vom_cost, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::FuelCurve)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.fuel_cost isa Absent || (_openapi_output["fuel_cost"] = _encode(_openapi_value.fuel_cost))
    _openapi_value.fuel_cost_time_series isa Absent || (_openapi_output["fuel_cost_time_series"] = _encode(_openapi_value.fuel_cost_time_series))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.startup_fuel_offtake isa Absent || (_openapi_output["startup_fuel_offtake"] = _encode(_openapi_value.startup_fuel_offtake))
    _openapi_value.value_curve isa Absent || (_openapi_output["value_curve"] = _encode(_openapi_value.value_curve))
    _openapi_value.variable_cost_type isa Absent || (_openapi_output["variable_cost_type"] = _encode(_openapi_value.variable_cost_type))
    _openapi_value.vom_cost isa Absent || (_openapi_output["vom_cost"] = _encode(_openapi_value.vom_cost))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/FuelCurve"), _openapi_output, "encoding FuelCurve"; direction = :neutral)
end

function _form_fields(_openapi_value::FuelCurve)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.fuel_cost isa Absent || push!(_openapi_output, "fuel_cost" => _openapi_value.fuel_cost)
    _openapi_value.fuel_cost_time_series isa Absent || push!(_openapi_output, "fuel_cost_time_series" => _openapi_value.fuel_cost_time_series)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.startup_fuel_offtake isa Absent || push!(_openapi_output, "startup_fuel_offtake" => _openapi_value.startup_fuel_offtake)
    _openapi_value.value_curve isa Absent || push!(_openapi_output, "value_curve" => _openapi_value.value_curve)
    _openapi_value.variable_cost_type isa Absent || push!(_openapi_output, "variable_cost_type" => _openapi_value.variable_cost_type)
    _openapi_value.vom_cost isa Absent || push!(_openapi_output, "vom_cost" => _openapi_value.vom_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
