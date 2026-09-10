"""
    MarketBidTimeSeriesCost

Cost representation for time-varying market bids of energy and ancillary services. The static counterpart is MarketBidCost.

  - `ancillary_service_offers`: IDs of the ancillary service components that this bid offers into.
  - `curve_multistep`: Multi-step block indicator for the bid: 0 = SINGLE_STEP (default; each step of the bid clears independently); 1 = MULTI_STEP (the bid must be awarded as one block across every step it covers). Counted in model steps so it applies at any resolution. Independent of curve_style: curve_style is the quantity structure, curve_multistep is the time structure, and they compose.
  - `curve_style`: Curve-clearing style for the bid: 0 = VARIABLE (default; continuous quantity with one or more segments); 1 = FIXED (all-or-nothing block with a single segment). FIXED is mutually exclusive with incremental_slope/decremental_slope and requires a single-segment offer curve.
  - `decremental_offer_curves`: Buy offer curves whose value curve is a time-series-backed piecewise incremental curve. Only the TIME_SERIES_INCREMENTAL variant is admissible here; any other variant is rejected by the consuming constructor.
  - `decremental_slope`: Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve.
  - `incremental_offer_curves`: Sell offer curves whose value curve is a time-series-backed piecewise incremental curve. Only the TIME_SERIES_INCREMENTAL variant is admissible here; any other variant is rejected by the consuming constructor.
  - `incremental_slope`: Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve.
  - `minimum_energy_offer`: Minimum-energy offer: cost to operate at minimum stable level, in \$/MWh at the curve's minimum power, stored as submitted. \$/h sources convert at parse (MEO = no-load cost / P_min). Time-series-backed linear curve; only the TIME_SERIES_LINEAR function-data variant is admissible here — the consuming constructor rejects any other.
  - `shut_down`: Shut-down cost as a time-series-backed linear curve. Only the TIME_SERIES_LINEAR function-data variant is admissible here; the consuming constructor rejects any other.
  - `start_up_association_id`: Store-minted id of a time series of three-stage (hot, warm, cold) start-up costs.
"""
Base.@kwdef struct MarketBidTimeSeriesCost <: APIModel
    ancillary_service_offers::Vector{Int64}
    cost_type::String = "MARKET_BID_TIME_SERIES"
    curve_multistep::Union{Absent, CurveMultiStep, Nothing} = ABSENT
    curve_style::Union{Absent, CurveStyles, Nothing} = ABSENT
    decremental_offer_curves::CostCurve
    decremental_slope::Union{Absent, Bool, Nothing} = ABSENT
    incremental_offer_curves::CostCurve
    incremental_slope::Union{Absent, Bool, Nothing} = ABSENT
    minimum_energy_offer::TimeSeriesInputOutputCurve
    shut_down::TimeSeriesInputOutputCurve
    start_up_association_id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{MarketBidTimeSeriesCost}, value) =
    _decode(MarketBidTimeSeriesCost, value, true)
function _decode(::Type{MarketBidTimeSeriesCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-8b7a0b23509734856b11.json",
            pointer="/components/schemas/MarketBidTimeSeriesCost",
        ),
        _openapi_raw,
        "decoding MarketBidTimeSeriesCost";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "MarketBidTimeSeriesCost")
    _openapi_field_ancillary_service_offers = _decode(
        Vector{Int64},
        _required(_openapi_object, "ancillary_service_offers", "MarketBidTimeSeriesCost"),
        _openapi_validate,
    )
    _openapi_field_cost_type = _decode(
        String,
        _required(_openapi_object, "cost_type", "MarketBidTimeSeriesCost"),
        _openapi_validate,
    )
    _openapi_field_curve_multistep =
        haskey(_openapi_object, "curve_multistep") ?
        _decode(
            Union{Absent, CurveMultiStep, Nothing},
            _openapi_object["curve_multistep"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_curve_style =
        haskey(_openapi_object, "curve_style") ?
        _decode(
            Union{Absent, CurveStyles, Nothing},
            _openapi_object["curve_style"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_decremental_offer_curves = _decode(
        CostCurve,
        _required(_openapi_object, "decremental_offer_curves", "MarketBidTimeSeriesCost"),
        _openapi_validate,
    )
    _openapi_field_decremental_slope =
        haskey(_openapi_object, "decremental_slope") ?
        _decode(
            Union{Absent, Bool, Nothing},
            _openapi_object["decremental_slope"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_incremental_offer_curves = _decode(
        CostCurve,
        _required(_openapi_object, "incremental_offer_curves", "MarketBidTimeSeriesCost"),
        _openapi_validate,
    )
    _openapi_field_incremental_slope =
        haskey(_openapi_object, "incremental_slope") ?
        _decode(
            Union{Absent, Bool, Nothing},
            _openapi_object["incremental_slope"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_minimum_energy_offer = _decode(
        TimeSeriesInputOutputCurve,
        _required(_openapi_object, "minimum_energy_offer", "MarketBidTimeSeriesCost"),
        _openapi_validate,
    )
    _openapi_field_shut_down = _decode(
        TimeSeriesInputOutputCurve,
        _required(_openapi_object, "shut_down", "MarketBidTimeSeriesCost"),
        _openapi_validate,
    )
    _openapi_field_start_up_association_id = _decode(
        Int64,
        _required(_openapi_object, "start_up_association_id", "MarketBidTimeSeriesCost"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "ancillary_service_offers",
            "cost_type",
            "curve_multistep",
            "curve_style",
            "decremental_offer_curves",
            "decremental_slope",
            "incremental_offer_curves",
            "incremental_slope",
            "minimum_energy_offer",
            "shut_down",
            "start_up_association_id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return MarketBidTimeSeriesCost(;
        ancillary_service_offers=_openapi_field_ancillary_service_offers,
        cost_type=_openapi_field_cost_type,
        curve_multistep=_openapi_field_curve_multistep,
        curve_style=_openapi_field_curve_style,
        decremental_offer_curves=_openapi_field_decremental_offer_curves,
        decremental_slope=_openapi_field_decremental_slope,
        incremental_offer_curves=_openapi_field_incremental_offer_curves,
        incremental_slope=_openapi_field_incremental_slope,
        minimum_energy_offer=_openapi_field_minimum_energy_offer,
        shut_down=_openapi_field_shut_down,
        start_up_association_id=_openapi_field_start_up_association_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::MarketBidTimeSeriesCost)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.ancillary_service_offers isa Absent || (
        _openapi_output["ancillary_service_offers"] =
            _encode(_openapi_value.ancillary_service_offers)
    )
    _openapi_value.cost_type isa Absent ||
        (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.curve_multistep isa Absent ||
        (_openapi_output["curve_multistep"] = _encode(_openapi_value.curve_multistep))
    _openapi_value.curve_style isa Absent ||
        (_openapi_output["curve_style"] = _encode(_openapi_value.curve_style))
    _openapi_value.decremental_offer_curves isa Absent || (
        _openapi_output["decremental_offer_curves"] =
            _encode(_openapi_value.decremental_offer_curves)
    )
    _openapi_value.decremental_slope isa Absent ||
        (_openapi_output["decremental_slope"] = _encode(_openapi_value.decremental_slope))
    _openapi_value.incremental_offer_curves isa Absent || (
        _openapi_output["incremental_offer_curves"] =
            _encode(_openapi_value.incremental_offer_curves)
    )
    _openapi_value.incremental_slope isa Absent ||
        (_openapi_output["incremental_slope"] = _encode(_openapi_value.incremental_slope))
    _openapi_value.minimum_energy_offer isa Absent || (
        _openapi_output["minimum_energy_offer"] =
            _encode(_openapi_value.minimum_energy_offer)
    )
    _openapi_value.shut_down isa Absent ||
        (_openapi_output["shut_down"] = _encode(_openapi_value.shut_down))
    _openapi_value.start_up_association_id isa Absent || (
        _openapi_output["start_up_association_id"] =
            _encode(_openapi_value.start_up_association_id)
    )
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
            resource="https://openapi.invalid/schema/root-8b7a0b23509734856b11.json",
            pointer="/components/schemas/MarketBidTimeSeriesCost",
        ),
        _openapi_output,
        "encoding MarketBidTimeSeriesCost";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::MarketBidTimeSeriesCost)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.ancillary_service_offers isa Absent || push!(
        _openapi_output,
        "ancillary_service_offers" => _openapi_value.ancillary_service_offers,
    )
    _openapi_value.cost_type isa Absent ||
        push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.curve_multistep isa Absent ||
        push!(_openapi_output, "curve_multistep" => _openapi_value.curve_multistep)
    _openapi_value.curve_style isa Absent ||
        push!(_openapi_output, "curve_style" => _openapi_value.curve_style)
    _openapi_value.decremental_offer_curves isa Absent || push!(
        _openapi_output,
        "decremental_offer_curves" => _openapi_value.decremental_offer_curves,
    )
    _openapi_value.decremental_slope isa Absent ||
        push!(_openapi_output, "decremental_slope" => _openapi_value.decremental_slope)
    _openapi_value.incremental_offer_curves isa Absent || push!(
        _openapi_output,
        "incremental_offer_curves" => _openapi_value.incremental_offer_curves,
    )
    _openapi_value.incremental_slope isa Absent ||
        push!(_openapi_output, "incremental_slope" => _openapi_value.incremental_slope)
    _openapi_value.minimum_energy_offer isa Absent || push!(
        _openapi_output,
        "minimum_energy_offer" => _openapi_value.minimum_energy_offer,
    )
    _openapi_value.shut_down isa Absent ||
        push!(_openapi_output, "shut_down" => _openapi_value.shut_down)
    _openapi_value.start_up_association_id isa Absent || push!(
        _openapi_output,
        "start_up_association_id" => _openapi_value.start_up_association_id,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
