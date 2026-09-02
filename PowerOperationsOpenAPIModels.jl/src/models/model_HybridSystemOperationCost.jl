@doc "    HybridSystemOperationCost\n\n`MarketBidCost` of operating the hybrid system.\n\n- `ancillary_service_offers`: IDs of the ancillary service components that this market bid offers into.\n- `curve_style`: Curve-clearing style for the bid: 0 = CURVE (ordinary divisible price-setting curve, default); 1 = FIXED (clears as one indivisible all-or-nothing package over its period); 2 = VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). Corresponds to ERCOT's DAM PriceCurve curveStyle field (CURVE/FIXED/VARIABLE). A non-zero value is mutually exclusive with incremental_slope/decremental_slope.\n- `decremental_offer_curves`: Buy offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`.\n- `decremental_slope`: Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve.\n- `incremental_offer_curves`: Sell offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`.\n- `incremental_slope`: Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve.\n- `minimum_energy_offer`: Minimum-energy offer: cost to operate at minimum stable level, in \$/MWh at the curve's minimum power, stored as submitted. \$/h sources convert at parse (MEO = no-load cost / P_min). Legacy scalar promotion: a bare scalar value `s` from a legacy source converts to an `InputOutputCurve` of `LinearFunctionData` with `constant_term = s` and `proportional_term = 0`.\n- `shut_down`: Shut-down cost. Legacy scalar promotion: a bare scalar value `s` from a legacy source converts to an `InputOutputCurve` of `LinearFunctionData` with `constant_term = s` and `proportional_term = 0`.\n- `start_up`: Start-up cost at different stages of the thermal cycle (hot, warm, cold)."
Base.@kwdef struct HybridSystemOperationCost
    ancillary_service_offers::Vector{Int64}
    cost_type::Union{Absent,Nothing,String} = ABSENT
    curve_style::Union{Absent,HybridSystemOperationCostCurveStyle,Nothing} = ABSENT
    decremental_offer_curves::CostCurve
    decremental_slope::Union{Absent,Bool,Nothing} = ABSENT
    incremental_offer_curves::CostCurve
    incremental_slope::Union{Absent,Bool,Nothing} = ABSENT
    minimum_energy_offer::InputOutputCurve
    shut_down::InputOutputCurve
    start_up::StartUpStages
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{HybridSystemOperationCost}, value) = _decode(HybridSystemOperationCost, value, true)
function _decode(::Type{HybridSystemOperationCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HybridSystem/properties/operation_cost"), _openapi_raw, "decoding HybridSystemOperationCost"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "HybridSystemOperationCost")
    _openapi_field_ancillary_service_offers = _decode(Vector{Int64}, _required(_openapi_object, "ancillary_service_offers", "HybridSystemOperationCost"), _openapi_validate)
    _openapi_field_cost_type = haskey(_openapi_object, "cost_type") ? _decode(Union{Absent,Nothing,String}, _openapi_object["cost_type"], _openapi_validate) : ABSENT
    _openapi_field_curve_style = haskey(_openapi_object, "curve_style") ? _decode(Union{Absent,HybridSystemOperationCostCurveStyle,Nothing}, _openapi_object["curve_style"], _openapi_validate) : ABSENT
    _openapi_field_decremental_offer_curves = _decode(CostCurve, _required(_openapi_object, "decremental_offer_curves", "HybridSystemOperationCost"), _openapi_validate)
    _openapi_field_decremental_slope = haskey(_openapi_object, "decremental_slope") ? _decode(Union{Absent,Bool,Nothing}, _openapi_object["decremental_slope"], _openapi_validate) : ABSENT
    _openapi_field_incremental_offer_curves = _decode(CostCurve, _required(_openapi_object, "incremental_offer_curves", "HybridSystemOperationCost"), _openapi_validate)
    _openapi_field_incremental_slope = haskey(_openapi_object, "incremental_slope") ? _decode(Union{Absent,Bool,Nothing}, _openapi_object["incremental_slope"], _openapi_validate) : ABSENT
    _openapi_field_minimum_energy_offer = _decode(InputOutputCurve, _required(_openapi_object, "minimum_energy_offer", "HybridSystemOperationCost"), _openapi_validate)
    _openapi_field_shut_down = _decode(InputOutputCurve, _required(_openapi_object, "shut_down", "HybridSystemOperationCost"), _openapi_validate)
    _openapi_field_start_up = _decode(StartUpStages, _required(_openapi_object, "start_up", "HybridSystemOperationCost"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("ancillary_service_offers","cost_type","curve_style","decremental_offer_curves","decremental_slope","incremental_offer_curves","incremental_slope","minimum_energy_offer","shut_down","start_up") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return HybridSystemOperationCost(; ancillary_service_offers = _openapi_field_ancillary_service_offers, cost_type = _openapi_field_cost_type, curve_style = _openapi_field_curve_style, decremental_offer_curves = _openapi_field_decremental_offer_curves, decremental_slope = _openapi_field_decremental_slope, incremental_offer_curves = _openapi_field_incremental_offer_curves, incremental_slope = _openapi_field_incremental_slope, minimum_energy_offer = _openapi_field_minimum_energy_offer, shut_down = _openapi_field_shut_down, start_up = _openapi_field_start_up, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::HybridSystemOperationCost)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.ancillary_service_offers isa Absent || (_openapi_output["ancillary_service_offers"] = _encode(_openapi_value.ancillary_service_offers))
    _openapi_value.cost_type isa Absent || (_openapi_output["cost_type"] = _encode(_openapi_value.cost_type))
    _openapi_value.curve_style isa Absent || (_openapi_output["curve_style"] = _encode(_openapi_value.curve_style))
    _openapi_value.decremental_offer_curves isa Absent || (_openapi_output["decremental_offer_curves"] = _encode(_openapi_value.decremental_offer_curves))
    _openapi_value.decremental_slope isa Absent || (_openapi_output["decremental_slope"] = _encode(_openapi_value.decremental_slope))
    _openapi_value.incremental_offer_curves isa Absent || (_openapi_output["incremental_offer_curves"] = _encode(_openapi_value.incremental_offer_curves))
    _openapi_value.incremental_slope isa Absent || (_openapi_output["incremental_slope"] = _encode(_openapi_value.incremental_slope))
    _openapi_value.minimum_energy_offer isa Absent || (_openapi_output["minimum_energy_offer"] = _encode(_openapi_value.minimum_energy_offer))
    _openapi_value.shut_down isa Absent || (_openapi_output["shut_down"] = _encode(_openapi_value.shut_down))
    _openapi_value.start_up isa Absent || (_openapi_output["start_up"] = _encode(_openapi_value.start_up))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HybridSystem/properties/operation_cost"), _openapi_output, "encoding HybridSystemOperationCost"; direction = :neutral)
end

function _form_fields(_openapi_value::HybridSystemOperationCost)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.ancillary_service_offers isa Absent || push!(_openapi_output, "ancillary_service_offers" => _openapi_value.ancillary_service_offers)
    _openapi_value.cost_type isa Absent || push!(_openapi_output, "cost_type" => _openapi_value.cost_type)
    _openapi_value.curve_style isa Absent || push!(_openapi_output, "curve_style" => _openapi_value.curve_style)
    _openapi_value.decremental_offer_curves isa Absent || push!(_openapi_output, "decremental_offer_curves" => _openapi_value.decremental_offer_curves)
    _openapi_value.decremental_slope isa Absent || push!(_openapi_output, "decremental_slope" => _openapi_value.decremental_slope)
    _openapi_value.incremental_offer_curves isa Absent || push!(_openapi_output, "incremental_offer_curves" => _openapi_value.incremental_offer_curves)
    _openapi_value.incremental_slope isa Absent || push!(_openapi_output, "incremental_slope" => _openapi_value.incremental_slope)
    _openapi_value.minimum_energy_offer isa Absent || push!(_openapi_output, "minimum_energy_offer" => _openapi_value.minimum_energy_offer)
    _openapi_value.shut_down isa Absent || push!(_openapi_output, "shut_down" => _openapi_value.shut_down)
    _openapi_value.start_up isa Absent || push!(_openapi_output, "start_up" => _openapi_value.start_up)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
