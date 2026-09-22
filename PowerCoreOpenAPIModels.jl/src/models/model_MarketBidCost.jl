"""
    MarketBidCost

Cost representation for static (non-time-varying) market bids of energy and ancillary services.

  - `minimum_energy_offer`: Minimum-energy offer: cost to operate at minimum stable level, in \$/MWh at the curve's minimum power, stored as submitted. \$/h sources convert at parse (MEO = no-load cost / P_min). Legacy scalar promotion: a bare scalar value `s` from a legacy source converts to an `InputOutputCurve` of `LinearFunctionData` with `constant_term = s` and `proportional_term = 0`.
  - `start_up`: Start-up cost at different stages of the thermal cycle (hot, warm, cold).
  - `shut_down`: Shut-down cost. Legacy scalar promotion: a bare scalar value `s` from a legacy source converts to an `InputOutputCurve` of `LinearFunctionData` with `constant_term = s` and `proportional_term = 0`.
  - `incremental_offer_curves`: Sell offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`.
  - `decremental_offer_curves`: Buy offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`.
  - `ancillary_service_offers`: IDs of the ancillary service components that this market bid offers into.
  - `incremental_slope`: Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve.
  - `decremental_slope`: Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve.
  - `curve_style`: Curve-clearing style for the bid: 0 = VARIABLE (default; continuous quantity with one or more segments); 1 = FIXED (all-or-nothing block with a single segment). FIXED is mutually exclusive with incremental_slope/decremental_slope and requires a single-segment offer curve.
  - `curve_multistep`: Multi-step block indicator for the bid: 0 = SINGLE_STEP (default; each step of the bid clears independently); 1 = MULTI_STEP (the bid must be awarded as one block across every step it covers). Counted in model steps so it applies at any resolution. Independent of curve_style: curve_style is the quantity structure, curve_multistep is the time structure, and they compose.
"""
Base.@kwdef struct MarketBidCost <: APIModel
    cost_type::Union{Absent, Nothing, String} = ABSENT
    minimum_energy_offer::InputOutputCurve
    start_up::StartUpStages
    shut_down::InputOutputCurve
    incremental_offer_curves::CostCurve
    decremental_offer_curves::CostCurve
    ancillary_service_offers::Vector{Int64}
    incremental_slope::Union{Absent, Bool, Nothing} = ABSENT
    decremental_slope::Union{Absent, Bool, Nothing} = ABSENT
    curve_style::Union{Absent, CurveStyles, Nothing} = ABSENT
    curve_multistep::Union{Absent, CurveMultiStep, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{MarketBidCost}, value) = _decode(MarketBidCost, value, true)
function _decode(::Type{MarketBidCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/MarketBidCost",
        ),
        _openapi_raw,
        "decoding MarketBidCost";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "MarketBidCost")
    _openapi_field_cost_type =
        haskey(_openapi_object, "cost_type") ?
        _decode(Union{Absent, Nothing, String}, _openapi_object["cost_type"], false) :
        ABSENT
    _openapi_field_minimum_energy_offer = _decode(
        InputOutputCurve,
        _required(_openapi_object, "minimum_energy_offer", "MarketBidCost"),
        false,
    )
    _openapi_field_start_up = _decode(
        StartUpStages,
        _required(_openapi_object, "start_up", "MarketBidCost"),
        false,
    )
    _openapi_field_shut_down = _decode(
        InputOutputCurve,
        _required(_openapi_object, "shut_down", "MarketBidCost"),
        false,
    )
    _openapi_field_incremental_offer_curves = _decode(
        CostCurve,
        _required(_openapi_object, "incremental_offer_curves", "MarketBidCost"),
        false,
    )
    _openapi_field_decremental_offer_curves = _decode(
        CostCurve,
        _required(_openapi_object, "decremental_offer_curves", "MarketBidCost"),
        false,
    )
    _openapi_field_ancillary_service_offers = _decode(
        Vector{Int64},
        _required(_openapi_object, "ancillary_service_offers", "MarketBidCost"),
        false,
    )
    _openapi_field_incremental_slope =
        haskey(_openapi_object, "incremental_slope") ?
        _decode(Union{Absent, Bool, Nothing}, _openapi_object["incremental_slope"], false) :
        ABSENT
    _openapi_field_decremental_slope =
        haskey(_openapi_object, "decremental_slope") ?
        _decode(Union{Absent, Bool, Nothing}, _openapi_object["decremental_slope"], false) :
        ABSENT
    _openapi_field_curve_style =
        haskey(_openapi_object, "curve_style") ?
        _decode(
            Union{Absent, CurveStyles, Nothing},
            _openapi_object["curve_style"],
            false,
        ) : ABSENT
    _openapi_field_curve_multistep =
        haskey(_openapi_object, "curve_multistep") ?
        _decode(
            Union{Absent, CurveMultiStep, Nothing},
            _openapi_object["curve_multistep"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "cost_type",
            "minimum_energy_offer",
            "start_up",
            "shut_down",
            "incremental_offer_curves",
            "decremental_offer_curves",
            "ancillary_service_offers",
            "incremental_slope",
            "decremental_slope",
            "curve_style",
            "curve_multistep",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return MarketBidCost(;
        cost_type=_openapi_field_cost_type,
        minimum_energy_offer=_openapi_field_minimum_energy_offer,
        start_up=_openapi_field_start_up,
        shut_down=_openapi_field_shut_down,
        incremental_offer_curves=_openapi_field_incremental_offer_curves,
        decremental_offer_curves=_openapi_field_decremental_offer_curves,
        ancillary_service_offers=_openapi_field_ancillary_service_offers,
        incremental_slope=_openapi_field_incremental_slope,
        decremental_slope=_openapi_field_decremental_slope,
        curve_style=_openapi_field_curve_style,
        curve_multistep=_openapi_field_curve_multistep,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::MarketBidCost)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.cost_type isa Absent ||
        (_openapi_output["cost_type"] = _encode_unvalidated(_openapi_value.cost_type))
    _openapi_value.minimum_energy_offer isa Absent || (
        _openapi_output["minimum_energy_offer"] =
            _encode_unvalidated(_openapi_value.minimum_energy_offer)
    )
    _openapi_value.start_up isa Absent ||
        (_openapi_output["start_up"] = _encode_unvalidated(_openapi_value.start_up))
    _openapi_value.shut_down isa Absent ||
        (_openapi_output["shut_down"] = _encode_unvalidated(_openapi_value.shut_down))
    _openapi_value.incremental_offer_curves isa Absent || (
        _openapi_output["incremental_offer_curves"] =
            _encode_unvalidated(_openapi_value.incremental_offer_curves)
    )
    _openapi_value.decremental_offer_curves isa Absent || (
        _openapi_output["decremental_offer_curves"] =
            _encode_unvalidated(_openapi_value.decremental_offer_curves)
    )
    _openapi_value.ancillary_service_offers isa Absent || (
        _openapi_output["ancillary_service_offers"] =
            _encode_unvalidated(_openapi_value.ancillary_service_offers)
    )
    _openapi_value.incremental_slope isa Absent || (
        _openapi_output["incremental_slope"] =
            _encode_unvalidated(_openapi_value.incremental_slope)
    )
    _openapi_value.decremental_slope isa Absent || (
        _openapi_output["decremental_slope"] =
            _encode_unvalidated(_openapi_value.decremental_slope)
    )
    _openapi_value.curve_style isa Absent ||
        (_openapi_output["curve_style"] = _encode_unvalidated(_openapi_value.curve_style))
    _openapi_value.curve_multistep isa Absent || (
        _openapi_output["curve_multistep"] =
            _encode_unvalidated(_openapi_value.curve_multistep)
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
_encode(_openapi_value::MarketBidCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/MarketBidCost",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding MarketBidCost";
    direction=:neutral,
)

function _form_fields(_openapi_value::MarketBidCost)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.cost_type isa Absent ||
        push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.minimum_energy_offer isa Absent || push!(
        _openapi_output,
        "minimum_energy_offer" => _openapi_value.minimum_energy_offer,
    )
    _openapi_value.start_up isa Absent ||
        push!(_openapi_output, "start_up" => _openapi_value.start_up)
    _openapi_value.shut_down isa Absent ||
        push!(_openapi_output, "shut_down" => _openapi_value.shut_down)
    _openapi_value.incremental_offer_curves isa Absent || push!(
        _openapi_output,
        "incremental_offer_curves" => _openapi_value.incremental_offer_curves,
    )
    _openapi_value.decremental_offer_curves isa Absent || push!(
        _openapi_output,
        "decremental_offer_curves" => _openapi_value.decremental_offer_curves,
    )
    _openapi_value.ancillary_service_offers isa Absent || push!(
        _openapi_output,
        "ancillary_service_offers" => _openapi_value.ancillary_service_offers,
    )
    _openapi_value.incremental_slope isa Absent ||
        push!(_openapi_output, "incremental_slope" => _openapi_value.incremental_slope)
    _openapi_value.decremental_slope isa Absent ||
        push!(_openapi_output, "decremental_slope" => _openapi_value.decremental_slope)
    _openapi_value.curve_style isa Absent ||
        push!(_openapi_output, "curve_style" => _openapi_value.curve_style)
    _openapi_value.curve_multistep isa Absent ||
        push!(_openapi_output, "curve_multistep" => _openapi_value.curve_multistep)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
