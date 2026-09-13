"""
    EmissionsData

Supplemental attribute describing the emission of a single pollutant from a host component. Combines pollutant identity (CO2, NOx, etc.) with an emission rate expressed as a ValueCurve (supporting constant, linear, or piecewise relationships between fuel consumption / power output and emissions). One EmissionsData instance can be attached to one or many components.

  - `name`: Identifier for this emissions attribute
  - `pollutant`: Pollutant identity (CO2, CO2E, CH4, N2O, NOX, SO2, PM25, PM10, HG, HAP, CUSTOM)
  - `emission_rate`: Emission rate as a ValueCurve, typically an IncrementalCurve with LinearFunctionData (constant or linearly varying rate) or PiecewiseStepData (piecewise step rates). Rates must be non-negative and finite.
  - `basis`: FUEL_INPUT (mass per unit of heat input) or POWER_OUTPUT (mass per unit of electrical output)
  - `start_up_adder`: Per-start emission pulse, in mass_unit. Must be finite and non-negative. Units: per mass_unit — KG: kg, LB: lb, SHORT_TON: ston, METRIC_TON: t .
  - `mass_unit`: Mass unit of the emission rate numerator
  - `energy_unit`: Energy unit for the rate denominator. Must be MMBTU or GJ when basis is FUEL_INPUT, and MWH when basis is POWER_OUTPUT.
  - `gwp`: GWP100 multiplier for CO2-equivalent reporting. Must be finite and non-negative. Units: 1.
  - `available`: Whether this attribute is active
"""
Base.@kwdef struct EmissionsData <: APIModel
    id::Int64
    name::String
    pollutant::PollutantType
    emission_rate::ValueCurve
    basis::EmissionBasis
    start_up_adder::Union{Absent, Float64, Nothing} = ABSENT
    mass_unit::Union{Absent, MassUnit, Nothing} = ABSENT
    energy_unit::EnergyUnit
    gwp::Union{Absent, Float64, Nothing} = ABSENT
    available::Union{Absent, Bool, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{EmissionsData}, value) = _decode(EmissionsData, value, true)
function _decode(::Type{EmissionsData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-aaa02c6118a1bb1914ad.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding EmissionsData";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "EmissionsData")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "EmissionsData"), _openapi_validate)
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "EmissionsData"),
        _openapi_validate,
    )
    _openapi_field_pollutant = _decode(
        PollutantType,
        _required(_openapi_object, "pollutant", "EmissionsData"),
        _openapi_validate,
    )
    _openapi_field_emission_rate = _decode(
        ValueCurve,
        _required(_openapi_object, "emission_rate", "EmissionsData"),
        _openapi_validate,
    )
    _openapi_field_basis = _decode(
        EmissionBasis,
        _required(_openapi_object, "basis", "EmissionsData"),
        _openapi_validate,
    )
    _openapi_field_start_up_adder =
        haskey(_openapi_object, "start_up_adder") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["start_up_adder"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_mass_unit =
        haskey(_openapi_object, "mass_unit") ?
        _decode(
            Union{Absent, MassUnit, Nothing},
            _openapi_object["mass_unit"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_energy_unit = _decode(
        EnergyUnit,
        _required(_openapi_object, "energy_unit", "EmissionsData"),
        _openapi_validate,
    )
    _openapi_field_gwp =
        haskey(_openapi_object, "gwp") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["gwp"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_available =
        haskey(_openapi_object, "available") ?
        _decode(
            Union{Absent, Bool, Nothing},
            _openapi_object["available"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "pollutant",
            "emission_rate",
            "basis",
            "start_up_adder",
            "mass_unit",
            "energy_unit",
            "gwp",
            "available",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return EmissionsData(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        pollutant=_openapi_field_pollutant,
        emission_rate=_openapi_field_emission_rate,
        basis=_openapi_field_basis,
        start_up_adder=_openapi_field_start_up_adder,
        mass_unit=_openapi_field_mass_unit,
        energy_unit=_openapi_field_energy_unit,
        gwp=_openapi_field_gwp,
        available=_openapi_field_available,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::EmissionsData)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.pollutant isa Absent ||
        (_openapi_output["pollutant"] = _encode(_openapi_value.pollutant))
    _openapi_value.emission_rate isa Absent ||
        (_openapi_output["emission_rate"] = _encode(_openapi_value.emission_rate))
    _openapi_value.basis isa Absent ||
        (_openapi_output["basis"] = _encode(_openapi_value.basis))
    _openapi_value.start_up_adder isa Absent ||
        (_openapi_output["start_up_adder"] = _encode(_openapi_value.start_up_adder))
    _openapi_value.mass_unit isa Absent ||
        (_openapi_output["mass_unit"] = _encode(_openapi_value.mass_unit))
    _openapi_value.energy_unit isa Absent ||
        (_openapi_output["energy_unit"] = _encode(_openapi_value.energy_unit))
    _openapi_value.gwp isa Absent || (_openapi_output["gwp"] = _encode(_openapi_value.gwp))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
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
            resource="https://openapi.invalid/schema/external-aaa02c6118a1bb1914ad.json",
            pointer="",
        ),
        _openapi_output,
        "encoding EmissionsData";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::EmissionsData)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.pollutant isa Absent ||
        push!(_openapi_output, "pollutant" => _openapi_value.pollutant)
    _openapi_value.emission_rate isa Absent ||
        push!(_openapi_output, "emission_rate" => _openapi_value.emission_rate)
    _openapi_value.basis isa Absent ||
        push!(_openapi_output, "basis" => _openapi_value.basis)
    _openapi_value.start_up_adder isa Absent ||
        push!(_openapi_output, "start_up_adder" => _openapi_value.start_up_adder)
    _openapi_value.mass_unit isa Absent ||
        push!(_openapi_output, "mass_unit" => _openapi_value.mass_unit)
    _openapi_value.energy_unit isa Absent ||
        push!(_openapi_output, "energy_unit" => _openapi_value.energy_unit)
    _openapi_value.gwp isa Absent || push!(_openapi_output, "gwp" => _openapi_value.gwp)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
