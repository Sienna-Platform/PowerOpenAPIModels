#!/usr/bin/env julia
# Emit unit annotations from SiennaSchemas into each generated package.
#
# openapi-generator drops x-unit / x-units / x-unit-base vendor extensions, so the
# generated structs carry units only as prose in docstrings. This reads the bundled
# specs plus Core/units.json and emits the annotations as methods, keeping units and
# structs in lockstep because both come out of the same generation run.
#
# Non-core packages emit QUALIFIED definitions. An unqualified `has_declared_unit(...)`
# inside a package that only does `using PowerCoreOpenAPIModels` defines a new local
# function instead of extending Core's, and every lookup through PC would miss it.

import JSON

const DOMAIN_TO_PKG = Dict(
    "core" => "PowerCoreOpenAPIModels.jl",
    "operations" => "PowerOperationsOpenAPIModels.jl",
    "investments" => "PowerInvestmentsOpenAPIModels.jl",
    "dynamics" => "PowerDynamicsOpenAPIModels.jl",
)

const UNIT_EXPORTS = [
    "has_declared_unit",
    "declared_unit",
    "declared_quantity",
    "has_unit_base",
    "unit_base",
    "has_conversion_factor",
    "conversion_factor",
    "UNIT_VOCABULARY",
]

# A unit string can belong to several quantity types with DIFFERENT conversion
# factors ("m": Length 0.001, Elevation 1.0). Where that happens the unit alone
# cannot identify the quantity, so the property must be listed here. Generation
# fails on any unlisted ambiguous property rather than guessing.
const QUANTITY_OVERRIDES = Dict(
    ("ACBus", "magnitude") => "Voltage",
    ("ACBus", "voltage_limits") => "Voltage",
    ("AggregateRetrofitPotential", "retrofit_fraction") => "Fraction",
    ("AggregateTransportTechnology", "line_loss") => "Fraction",
    ("CapacityReserveMargin", "capacity_reserve_fraction") => "Fraction",
    ("ColocatedSupplyStorageTechnology", "efficiency_storage") => "Fraction",
    ("ColocatedSupplyStorageTechnology", "inverter_efficiency") => "Fraction",
    # Generation capacity over grid connection capacity: deliberately oversized
    # above 1 in co-located designs, so a plain ratio and not a [0,1] Fraction.
    ("ColocatedSupplyStorageTechnology", "inverter_supply_ratio") => "Dimensionless",
    ("ColocatedSupplyStorageTechnology", "losses_storage") => "Fraction",
    ("DCBus", "magnitude") => "Voltage",
    ("DCBus", "voltage_limits") => "Voltage",

    # Same reasoning as PortfolioFinancialData's rates below.
    ("DemandRequirement", "growth_rate") => "Fraction",
    ("DemandSideTechnology", "demand_energy_efficiency") => "Fraction",
    ("DemandSideTechnology", "max_demand_curtailment") => "Fraction",
    ("DemandSideTechnology", "min_power") => "Fraction",
    ("DemandSideTechnology", "technology_efficiency") => "Fraction",
    ("DiscreteControlledACBranch", "b") => "Susceptance",
    ("DiscreteControlledACBranch", "g") => "Conductance",
    ("DiscreteControlledACBranch", "r") => "Resistance",
    ("DiscreteControlledACBranch", "x") => "Reactance",

    # GWP multipliers run well above 1 (e.g. CH4 ~27-30), so this is a plain
    # scaling factor, not a [0,1]-style Fraction.
    ("EmissionsData", "gwp") => "Dimensionless",

    # conversion_factor is a generic multiplier (e.g. MWh/liter, m^3 -> pu-hr)
    # and cycle_limits is a plain count -- neither is a bounded [0,1]-style
    # fraction, so Dimensionless rather than Fraction.
    ("EnergyReservoirStorage", "conversion_factor") => "Dimensionless",
    ("EnergyReservoirStorage", "cycle_limits") => "Dimensionless",
    ("EnergyReservoirStorage", "initial_storage_capacity_level") => "Fraction",
    ("EnergyReservoirStorage", "self_discharge") => "Fraction",
    ("EnergyReservoirStorage", "storage_target") => "Fraction",
    ("EnergyShareRequirements", "generation_fraction_requirement") => "Fraction",
    ("FACTSControlDevice", "max_reactive_power") => "ReactivePower",
    ("FACTSControlDevice", "reactive_power_required") => "Fraction",
    # A regulated-bus identifier (0 = local bus), not a physical fraction.
    ("FACTSControlDevice", "regulated_bus_number") => "Dimensionless",
    ("FACTSControlDevice", "voltage_setpoint") => "Voltage",

    # Complex admittance: real part is conductance, imag part is susceptance,
    # both in the same pu base.
    ("FixedAdmittance", "Y") => "Susceptance",
    ("GenericArcImpedance", "r") => "Resistance",
    ("GenericArcImpedance", "x") => "Reactance",

    # Complex impedance: real part is resistance, imag part is reactance, both
    # in the same pu base.
    ("HybridSystem", "interconnection_impedance") => "Reactance",

    # Same reasoning as EnergyReservoirStorage.conversion_factor above.
    ("HydroPumpTurbine", "conversion_factor") => "Dimensionless",
    ("HydroPumpTurbine", "powerhouse_elevation") => "Elevation",
    ("HydroReservoir", "evaporative_loss") => "Fraction",
    ("HydroReservoir", "initial_level") => "Elevation",
    ("HydroReservoir", "intake_elevation") => "Elevation",
    ("HydroReservoir", "level_targets") => "Elevation",
    # level_data_type=HEAD measures hydraulic head, a height in metres, so it is
    # Elevation (default m) and not Length (default km).
    ("HydroReservoir", "storage_level_limits") => "Elevation",

    # Same reasoning as EnergyReservoirStorage.conversion_factor above.
    ("HydroTurbine", "conversion_factor") => "Dimensionless",
    ("HydroTurbine", "powerhouse_elevation") => "Elevation",

    # Nested discriminator, same shape as TwoTerminalVSCLine.ac_setpoint_from
    # below: "1" (AC_REACTIVE_POWER) is a power factor, "pu" (AC_VOLTAGE +
    # COMPONENT_BASE) is a per-unit voltage — two different target quantities for
    # the two ambiguous units on this one property.
    ("InterconnectingConverter", "ac_setpoint") =>
        Dict("1" => "PowerFactor", "pu" => "Voltage"),
    # dc_setpoint's only ambiguous branch is "pu" (DC_VOLTAGE/DC_VOLTAGE_DROOP +
    # COMPONENT_BASE); "MW" (DC_POWER) is unambiguous.
    ("InterconnectingConverter", "dc_setpoint") => "Voltage",
    # DC-voltage droop gain (dV/dP); modeled on the same pu base as a series
    # resistance, matching the "droop resistance" convention in DC-grid droop
    # control literature.
    ("InterconnectingConverter", "dc_voltage_droop") => "Resistance",
    # Despite the name, this blends active/reactive power reduction (0 = only
    # active power reduced, 1 = ...); it is a weighting Fraction, not a true
    # power factor.
    ("InterconnectingConverter", "power_factor_weighting_fraction") => "Fraction",
    # Participation share of total Mvar contributed by this converter.
    ("InterconnectingConverter", "rmpct") => "Fraction",
    ("InterconnectingConverter", "voltage_limits") => "Voltage",
    ("Line", "b") => "Susceptance",
    ("Line", "g") => "Conductance",
    ("Line", "r") => "Resistance",
    ("Line", "x") => "Reactance",
    ("MonitoredLine", "b") => "Susceptance",
    ("MonitoredLine", "g") => "Conductance",
    ("MonitoredLine", "r") => "Resistance",
    ("MonitoredLine", "x") => "Reactance",
    ("NodalACTransportTechnology", "reactance") => "Reactance",
    ("NodalACTransportTechnology", "resistance") => "Resistance",
    ("NodalHVDCTransportTechnology", "line_loss") => "Fraction",

    # Financial rates are proportional (dimensionless) quantities, closer in
    # kind to Fraction than to a bare Dimensionless multiplier.
    ("PortfolioFinancialData", "discount_rate") => "Fraction",
    ("PortfolioFinancialData", "inflation_rate") => "Fraction",
    ("PortfolioFinancialData", "interest_rate") => "Fraction",
    ("RenewableDispatch", "power_factor") => "PowerFactor",
    ("RenewableNonDispatch", "power_factor") => "PowerFactor",
    ("Source", "R_th") => "Resistance",
    ("Source", "X_th") => "Reactance",
    ("Source", "internal_voltage") => "Voltage",
    ("StorageTechnology", "efficiency") => "Fraction",
    ("StorageTechnology", "losses") => "Fraction",
    ("StorageTechnology", "min_discharge_fraction") => "Fraction",
    ("Substation", "grounding_resistance") => "Resistance",

    # units.json's own Fraction description names "cofire level" as an example.
    ("SupplyTechnology", "cofire_level_limits") => "Fraction",
    ("SupplyTechnology", "cofire_start_limits") => "Fraction",
    ("SupplyTechnology", "min_generation_fraction") => "Fraction",
    ("SupplyTechnology", "outage_factor") => "Fraction",

    # Complex admittance: real part is conductance, imag part is susceptance,
    # both in the same pu base.
    ("SwitchedAdmittance", "Y") => "Susceptance",
    ("SwitchedAdmittance", "Y_increase") => "Susceptance",
    ("SwitchedAdmittance", "admittance_limits") => "Susceptance",
    # A regulated-bus identifier (0 = local bus), not a physical fraction.
    ("SwitchedAdmittance", "regulated_bus_number") => "Dimensionless",

    # Same reasoning as PortfolioFinancialData's rates above.
    ("TechnologyFinancialData", "debt_fraction") => "Fraction",
    ("TechnologyFinancialData", "debt_rate") => "Fraction",
    ("TechnologyFinancialData", "interest_rate") => "Fraction",
    ("TechnologyFinancialData", "return_on_equity") => "Fraction",
    ("TechnologyFinancialData", "tax_rate") => "Fraction",
    ("TModelHVDCLine", "r") => "Resistance",
    # Series inductance in the T-model, expressed on the same pu base as a
    # series reactance.
    ("TModelHVDCLine", "l") => "Reactance",
    # Shunt capacitance in the T-model, expressed on the same pu base as a
    # shunt susceptance.
    ("TModelHVDCLine", "c") => "Susceptance",
    ("ThreeWindingTransformer", "r_12") => "Resistance",
    ("ThreeWindingTransformer", "r_23") => "Resistance",
    ("ThreeWindingTransformer", "r_31") => "Resistance",
    ("ThreeWindingTransformer", "x_12") => "Reactance",
    ("ThreeWindingTransformer", "x_23") => "Reactance",
    ("ThreeWindingTransformer", "x_31") => "Reactance",
    # Complex admittance: real part is conductance, imag part is susceptance,
    # both in the same pu base.
    ("ThreeWindingTransformer", "magnetizing_shunt") => "Susceptance",

    # A control band around a per-unit tap/reactive setpoint (unit "1" on the
    # eight non-angle control_objective branches); same convention as `tap`
    # below, not a bounded [0,1] Fraction.
    ("TransformerCircuit", "control_limits") => "Dimensionless",
    # PSS/E VMA/VMI voltage band; the pu branch of this discriminated property
    # applies only to the voltage-controlled objectives (UNDEFINED,
    # VOLTAGE_DISABLED, FIXED, VOLTAGE) -- the other objectives resolve to
    # ReactivePower/ActivePower on their own MVAr/MW branches.
    ("TransformerCircuit", "controlled_quantity_limits") => "Voltage",
    ("TransformerCircuit", "r") => "Resistance",
    # Normalized tap position (0-2, 1 = nominal); unit "1", not "pu", so it is
    # a bare multiplier rather than a context-dependent voltage-base quantity.
    ("TransformerCircuit", "tap") => "Dimensionless",
    ("TransformerCircuit", "x") => "Reactance",
    ("TwoTerminalLCCLine", "compounding_resistance") => "Resistance",
    ("TwoTerminalLCCLine", "inverter_capacitor_reactance") => "Reactance",
    ("TwoTerminalLCCLine", "inverter_rc") => "Resistance",
    # Same tap-ratio convention as TransformerCircuit.tap above.
    ("TwoTerminalLCCLine", "inverter_tap_limits") => "Dimensionless",
    ("TwoTerminalLCCLine", "inverter_tap_setting") => "Dimensionless",
    ("TwoTerminalLCCLine", "inverter_tap_step") => "Dimensionless",
    ("TwoTerminalLCCLine", "inverter_transformer_ratio") => "Dimensionless",
    ("TwoTerminalLCCLine", "inverter_xc") => "Reactance",
    ("TwoTerminalLCCLine", "min_compounding_voltage") => "Voltage",
    ("TwoTerminalLCCLine", "r") => "Resistance",
    ("TwoTerminalLCCLine", "rectifier_capacitor_reactance") => "Reactance",
    ("TwoTerminalLCCLine", "rectifier_rc") => "Resistance",
    ("TwoTerminalLCCLine", "rectifier_tap_limits") => "Dimensionless",
    ("TwoTerminalLCCLine", "rectifier_tap_setting") => "Dimensionless",
    ("TwoTerminalLCCLine", "rectifier_tap_step") => "Dimensionless",
    ("TwoTerminalLCCLine", "rectifier_transformer_ratio") => "Dimensionless",
    ("TwoTerminalLCCLine", "rectifier_xc") => "Reactance",
    ("TwoTerminalLCCLine", "scheduled_dc_voltage") => "Voltage",
    ("TwoTerminalLCCLine", "switch_mode_voltage") => "Voltage",

    # Nested discriminator with two differently-ambiguous branches: "1"
    # (AC_REACTIVE_POWER) reads as a power factor, "pu" (AC_VOLTAGE +
    # COMPONENT_BASE) reads as a per-unit voltage. One quantity per property is not
    # enough here, so the value is a per-unit-string map instead of a bare name.
    ("TwoTerminalVSCLine", "ac_setpoint_from") =>
        Dict("1" => "PowerFactor", "pu" => "Voltage"),
    ("TwoTerminalVSCLine", "ac_setpoint_to") =>
        Dict("1" => "PowerFactor", "pu" => "Voltage"),
    # dc_setpoint_from/to's only ambiguous branch is "pu" (DC_VOLTAGE/
    # DC_VOLTAGE_DROOP + COMPONENT_BASE); "MW" (DC_POWER) is unambiguous.
    ("TwoTerminalVSCLine", "dc_setpoint_from") => "Voltage",
    ("TwoTerminalVSCLine", "dc_setpoint_to") => "Voltage",
    # DC-voltage droop gain (dV/dP); same convention as
    # InterconnectingConverter.dc_voltage_droop above.
    ("TwoTerminalVSCLine", "dc_voltage_droop_from") => "Resistance",
    ("TwoTerminalVSCLine", "dc_voltage_droop_to") => "Resistance",
    ("TwoTerminalVSCLine", "g") => "Conductance",
    # Same weighting-fraction reasoning as InterconnectingConverter's above.
    ("TwoTerminalVSCLine", "power_factor_weighting_fraction_from") => "Fraction",
    ("TwoTerminalVSCLine", "power_factor_weighting_fraction_to") => "Fraction",
    # Same participation-share reasoning as InterconnectingConverter.rmpct above.
    ("TwoTerminalVSCLine", "rmpct_from") => "Fraction",
    ("TwoTerminalVSCLine", "rmpct_to") => "Fraction",
    ("TwoTerminalVSCLine", "voltage_limits_from") => "Voltage",
    ("TwoTerminalVSCLine", "voltage_limits_to") => "Voltage",

    # Complex admittance: real part is conductance, imag part is susceptance,
    # both in the same pu base.
    ("TwoWindingTransformer", "magnetizing_shunt") => "Susceptance",

    # power-family fields: schemas-0.1.0 added power_units + a COMPONENT_BASE "pu"
    # branch, and units.json now lists "pu" under ActivePower/ReactivePower/
    # ApparentPower too, so each field's own quantity needs stating explicitly.
    ("Area", "peak_active_power") => "ActivePower",
    ("Area", "peak_reactive_power") => "ReactivePower",
    ("AreaInterchange", "active_power_flow") => "ActivePower",
    ("AreaInterchange", "flow_limits") => "ActivePower",
    ("DiscreteControlledACBranch", "active_power_flow") => "ActivePower",
    ("DiscreteControlledACBranch", "rating") => "ApparentPower",
    ("DiscreteControlledACBranch", "reactive_power_flow") => "ReactivePower",
    ("EnergyReservoirStorage", "active_power") => "ActivePower",
    ("EnergyReservoirStorage", "input_active_power_limits") => "ActivePower",
    ("EnergyReservoirStorage", "output_active_power_limits") => "ActivePower",
    ("EnergyReservoirStorage", "rating") => "ApparentPower",
    ("EnergyReservoirStorage", "reactive_power") => "ReactivePower",
    ("EnergyReservoirStorage", "reactive_power_limits") => "ReactivePower",
    ("EnergyReservoirStorage", "standing_loss") => "ActivePower",
    ("ExponentialLoad", "active_power") => "ActivePower",
    ("ExponentialLoad", "max_active_power") => "ActivePower",
    ("ExponentialLoad", "max_reactive_power") => "ReactivePower",
    ("ExponentialLoad", "reactive_power") => "ReactivePower",
    ("FACTSControlDevice", "max_shunt_current") => "ApparentPower",
    ("GenericArcImpedance", "active_power_flow") => "ActivePower",
    ("GenericArcImpedance", "max_flow") => "ActivePower",
    ("GenericArcImpedance", "reactive_power_flow") => "ReactivePower",
    ("HybridSystem", "active_power") => "ActivePower",
    ("HybridSystem", "input_active_power_limits") => "ActivePower",
    ("HybridSystem", "interconnection_rating") => "ApparentPower",
    ("HybridSystem", "output_active_power_limits") => "ActivePower",
    ("HybridSystem", "reactive_power") => "ReactivePower",
    ("HybridSystem", "reactive_power_limits") => "ReactivePower",
    ("HydroDispatch", "active_power") => "ActivePower",
    ("HydroDispatch", "active_power_limits") => "ActivePower",
    ("HydroDispatch", "rating") => "ApparentPower",
    ("HydroDispatch", "reactive_power") => "ReactivePower",
    ("HydroDispatch", "reactive_power_limits") => "ReactivePower",
    ("HydroPumpTurbine", "active_power") => "ActivePower",
    ("HydroPumpTurbine", "active_power_limits") => "ActivePower",
    ("HydroPumpTurbine", "active_power_limits_pump") => "ActivePower",
    ("HydroPumpTurbine", "active_power_pump") => "ActivePower",
    ("HydroPumpTurbine", "rating") => "ApparentPower",
    ("HydroPumpTurbine", "reactive_power") => "ReactivePower",
    ("HydroPumpTurbine", "reactive_power_limits") => "ReactivePower",
    ("HydroTurbine", "active_power") => "ActivePower",
    ("HydroTurbine", "active_power_limits") => "ActivePower",
    ("HydroTurbine", "rating") => "ApparentPower",
    ("HydroTurbine", "reactive_power") => "ReactivePower",
    ("HydroTurbine", "reactive_power_limits") => "ReactivePower",
    ("InterconnectingConverter", "active_power") => "ActivePower",
    ("InterconnectingConverter", "active_power_limits") => "ActivePower",
    ("InterconnectingConverter", "rating") => "ApparentPower",
    ("InterconnectingConverter", "reactive_power_limits") => "ReactivePower",
    ("InterruptiblePowerLoad", "active_power") => "ActivePower",
    ("InterruptiblePowerLoad", "max_active_power") => "ActivePower",
    ("InterruptiblePowerLoad", "max_reactive_power") => "ReactivePower",
    ("InterruptiblePowerLoad", "reactive_power") => "ReactivePower",
    ("InterruptibleStandardLoad", "constant_active_power") => "ActivePower",
    ("InterruptibleStandardLoad", "constant_reactive_power") => "ReactivePower",
    ("InterruptibleStandardLoad", "current_active_power") => "ActivePower",
    ("InterruptibleStandardLoad", "current_reactive_power") => "ReactivePower",
    ("InterruptibleStandardLoad", "impedance_active_power") => "ActivePower",
    ("InterruptibleStandardLoad", "impedance_reactive_power") => "ReactivePower",
    ("InterruptibleStandardLoad", "max_constant_active_power") => "ActivePower",
    ("InterruptibleStandardLoad", "max_constant_reactive_power") => "ReactivePower",
    ("InterruptibleStandardLoad", "max_current_active_power") => "ActivePower",
    ("InterruptibleStandardLoad", "max_current_reactive_power") => "ReactivePower",
    ("InterruptibleStandardLoad", "max_impedance_active_power") => "ActivePower",
    ("InterruptibleStandardLoad", "max_impedance_reactive_power") => "ReactivePower",
    ("Line", "active_power_flow") => "ActivePower",
    ("Line", "rating") => "ApparentPower",
    ("Line", "rating_b") => "ApparentPower",
    ("Line", "rating_c") => "ApparentPower",
    ("Line", "reactive_power_flow") => "ReactivePower",
    ("LoadZone", "peak_active_power") => "ActivePower",
    ("LoadZone", "peak_reactive_power") => "ReactivePower",
    ("MonitoredLine", "active_power_flow") => "ActivePower",
    ("MonitoredLine", "flow_limits") => "ActivePower",
    ("MonitoredLine", "rating") => "ApparentPower",
    ("MonitoredLine", "rating_b") => "ApparentPower",
    ("MonitoredLine", "rating_c") => "ApparentPower",
    ("MonitoredLine", "reactive_power_flow") => "ReactivePower",
    ("MotorLoad", "active_power") => "ActivePower",
    ("MotorLoad", "max_active_power") => "ActivePower",
    ("MotorLoad", "rating") => "ApparentPower",
    ("MotorLoad", "reactive_power") => "ReactivePower",
    ("MotorLoad", "reactive_power_limits") => "ReactivePower",
    ("PowerLoad", "active_power") => "ActivePower",
    ("PowerLoad", "max_active_power") => "ActivePower",
    ("PowerLoad", "max_reactive_power") => "ReactivePower",
    ("PowerLoad", "reactive_power") => "ReactivePower",
    ("RenewableDispatch", "active_power") => "ActivePower",
    ("RenewableDispatch", "rating") => "ApparentPower",
    ("RenewableDispatch", "reactive_power") => "ReactivePower",
    ("RenewableDispatch", "reactive_power_limits") => "ReactivePower",
    ("RenewableNonDispatch", "active_power") => "ActivePower",
    ("RenewableNonDispatch", "rating") => "ApparentPower",
    ("RenewableNonDispatch", "reactive_power") => "ReactivePower",
    ("ShiftablePowerLoad", "active_power") => "ActivePower",
    ("ShiftablePowerLoad", "active_power_limits") => "ActivePower",
    ("ShiftablePowerLoad", "max_active_power") => "ActivePower",
    ("ShiftablePowerLoad", "max_reactive_power") => "ReactivePower",
    ("ShiftablePowerLoad", "reactive_power") => "ReactivePower",
    ("Source", "active_power") => "ActivePower",
    ("Source", "active_power_limits") => "ActivePower",
    ("Source", "reactive_power") => "ReactivePower",
    ("Source", "reactive_power_limits") => "ReactivePower",
    ("StandardLoad", "constant_active_power") => "ActivePower",
    ("StandardLoad", "constant_reactive_power") => "ReactivePower",
    ("StandardLoad", "current_active_power") => "ActivePower",
    ("StandardLoad", "current_reactive_power") => "ReactivePower",
    ("StandardLoad", "impedance_active_power") => "ActivePower",
    ("StandardLoad", "impedance_reactive_power") => "ReactivePower",
    ("StandardLoad", "max_constant_active_power") => "ActivePower",
    ("StandardLoad", "max_constant_reactive_power") => "ReactivePower",
    ("StandardLoad", "max_current_active_power") => "ActivePower",
    ("StandardLoad", "max_current_reactive_power") => "ReactivePower",
    ("StandardLoad", "max_impedance_active_power") => "ActivePower",
    ("StandardLoad", "max_impedance_reactive_power") => "ReactivePower",
    ("SynchronousCondenser", "active_power_losses") => "ActivePower",
    ("SynchronousCondenser", "rating") => "ApparentPower",
    ("SynchronousCondenser", "reactive_power") => "ReactivePower",
    ("SynchronousCondenser", "reactive_power_limits") => "ReactivePower",
    ("ThermalMultiStart", "active_power") => "ActivePower",
    ("ThermalMultiStart", "active_power_limits") => "ActivePower",
    ("ThermalMultiStart", "power_trajectory") => "ActivePower",
    ("ThermalMultiStart", "rating") => "ApparentPower",
    ("ThermalMultiStart", "reactive_power") => "ReactivePower",
    ("ThermalMultiStart", "reactive_power_limits") => "ReactivePower",
    ("ThermalStandard", "active_power") => "ActivePower",
    ("ThermalStandard", "active_power_limits") => "ActivePower",
    ("ThermalStandard", "rating") => "ApparentPower",
    ("ThermalStandard", "reactive_power") => "ReactivePower",
    ("ThermalStandard", "reactive_power_limits") => "ReactivePower",
    ("TransformerCircuit", "active_power_flow") => "ActivePower",
    ("TransformerCircuit", "rating") => "ApparentPower",
    ("TransformerCircuit", "rating_b") => "ApparentPower",
    ("TransformerCircuit", "rating_c") => "ApparentPower",
    ("TransformerCircuit", "reactive_power_flow") => "ReactivePower",
    ("TransmissionInterface", "active_power_flow_limits") => "ActivePower",
    ("TwoTerminalGenericHVDCLine", "active_power_flow") => "ActivePower",
    ("TwoTerminalGenericHVDCLine", "active_power_limits_from") => "ActivePower",
    ("TwoTerminalGenericHVDCLine", "active_power_limits_to") => "ActivePower",
    ("TwoTerminalGenericHVDCLine", "reactive_power_limits_from") => "ReactivePower",
    ("TwoTerminalGenericHVDCLine", "reactive_power_limits_to") => "ReactivePower",
    ("TwoTerminalLCCLine", "active_power_flow") => "ActivePower",
    ("TwoTerminalLCCLine", "active_power_limits_from") => "ActivePower",
    ("TwoTerminalLCCLine", "active_power_limits_to") => "ActivePower",
    ("TwoTerminalLCCLine", "reactive_power_limits_from") => "ReactivePower",
    ("TwoTerminalLCCLine", "reactive_power_limits_to") => "ReactivePower",
    ("TwoTerminalVSCLine", "active_power_flow") => "ActivePower",
    ("TwoTerminalVSCLine", "active_power_limits_from") => "ActivePower",
    ("TwoTerminalVSCLine", "active_power_limits_to") => "ActivePower",
    ("TwoTerminalVSCLine", "rating") => "ApparentPower",
    ("TwoTerminalVSCLine", "rating_from") => "ApparentPower",
    ("TwoTerminalVSCLine", "rating_to") => "ApparentPower",
    ("TwoTerminalVSCLine", "reactive_power_from") => "ReactivePower",
    ("TwoTerminalVSCLine", "reactive_power_limits_from") => "ReactivePower",
    ("TwoTerminalVSCLine", "reactive_power_limits_to") => "ReactivePower",
    ("TwoTerminalVSCLine", "reactive_power_to") => "ReactivePower",
)

_is_convertible(::Nothing) = false
_is_convertible(factor::Real) = !iszero(factor)

"""
Read Core/units.json into a `(quantity_type, unit) => factor` map plus a
`unit => [quantity_type]` index used to resolve a property's quantity.
"""
function load_unit_vocabulary(units_path)
    raw = JSON.parsefile(units_path)
    factors = Dict{Tuple{String, String}, Float64}()
    by_unit = Dict{String, Vector{String}}()
    for entry in raw["allowed_units"]
        quantity = String(entry["quantity_type"])
        unit = String(entry["unit"])
        factor = entry["to_default"]
        push!(get!(by_unit, unit, String[]), quantity)
        if _is_convertible(factor)
            factors[(quantity, unit)] = Float64(factor)
        end
    end
    return factors, by_unit
end

function resolve_quantity(by_unit, type_name, prop, unit)
    if !haskey(by_unit, unit)
        error("$type_name.$prop declares x-unit=\"$unit\", which is absent from units.json")
    end
    quantities = unique(by_unit[unit])
    if length(quantities) == 1
        return quantities[1]
    end
    # More than one quantity is registered for this unit. A shared conversion
    # factor would make the arithmetic work out the same either way, but it
    # does not make the label correct, so it is not grounds for a guess here --
    # only QUANTITY_OVERRIDES may pick the quantity. A discriminated property
    # has one entry per branch unit, and the other branches resolve on their
    # own.
    key = (String(type_name), String(prop))
    if haskey(QUANTITY_OVERRIDES, key)
        return resolve_override(QUANTITY_OVERRIDES[key], type_name, prop, unit)
    end
    error(
        "$type_name.$prop declares ambiguous x-unit=\"$unit\" across quantities " *
        "[$(join(quantities, ", "))]. " *
        "Add (\"$type_name\", \"$prop\") to QUANTITY_OVERRIDES.",
    )
end

"""
A `QUANTITY_OVERRIDES` entry is either a single quantity name — every ambiguous
unit on that property means the same quantity — or a unit-to-quantity `Dict`,
for a property whose branches disagree: a VSC setpoint reads as a power factor
on one control mode and a per-unit voltage on another.
"""
function resolve_override(override::AbstractString, type_name, prop, unit)
    return override
end

function resolve_override(override::AbstractDict, type_name, prop, unit)
    if haskey(override, unit)
        return override[unit]
    end
    error(
        "$type_name.$prop declares ambiguous x-unit=\"$unit\" with no override entry " *
        "for that unit (existing entries cover $(join(sort(collect(keys(override))), ", "))).",
    )
end

function emit_vocabulary(io, factors)
    println(io, "const UNIT_VOCABULARY = Dict{Tuple{String, String}, Float64}(")
    for key in sort!(collect(keys(factors)))
        println(io, "    (\"", key[1], "\", \"", key[2], "\") => ", factors[key], ",")
    end
    println(io, ")")
    println(io)
    println(
        io,
        "has_conversion_factor(q::AbstractString, u::AbstractString) = " *
        "haskey(UNIT_VOCABULARY, (String(q), String(u)))",
    )
    println(
        io,
        "conversion_factor(q::AbstractString, u::AbstractString) = " *
        "UNIT_VOCABULARY[(String(q), String(u))]",
    )
    println(io)
    return
end

function emit_fallbacks(io)
    println(io, "has_declared_unit(::Type{<:OpenAPI.APIModel}, ::Val) = false")
    println(io, "has_unit_base(::Type{<:OpenAPI.APIModel}, ::Val) = false")
    println(
        io,
        "has_declared_unit(o::T, v::Val) where {T <: OpenAPI.APIModel} = has_declared_unit(T, v)",
    )
    println(io)
    # The accessors need a generic method in Core even though it only ever
    # throws: the domain packages extend them by qualified name, which requires
    # the binding to already exist here. Guard with the has_* predicate.
    for (accessor, subject) in (
        ("declared_unit", "no declared unit"),
        ("declared_quantity", "no declared quantity"),
        ("unit_base", "no unit base"),
    )
        println(
            io,
            "function $accessor(::Type{T}, ::Val{P}) where {T <: OpenAPI.APIModel, P}",
        )
        println(io, "    error(\"\$(nameof(T)).\$P has $subject\")")
        println(io, "end")
    end
    println(io)
    for accessor in ("declared_unit", "declared_quantity", "unit_base")
        println(
            io,
            "$accessor(o::T, v::Val) where {T <: OpenAPI.APIModel} = $accessor(T, v)",
        )
    end
    println(io)
    return
end

function emit_fixed(io, prefix, type_name, prop, unit, quantity)
    println(io, "$(prefix)has_declared_unit(::Type{$type_name}, ::Val{:$prop}) = true")
    println(io, "$(prefix)declared_unit(::Type{$type_name}, ::Val{:$prop}) = \"$unit\"")
    println(
        io,
        "$(prefix)declared_quantity(::Type{$type_name}, ::Val{:$prop}) = \"$quantity\"",
    )
    return
end

"""
One resolved `x-units` branch that bottoms out at a concrete unit/quantity
pair, keyed by its own discriminator value. With `NestedBranch` below, this
lets the walk resolve an `x-units` map to any depth, not just the two levels
every property uses today.
"""
struct LeafBranch
    key::String
    unit::String
    quantity::String
end

"""
One resolved `x-units` branch whose value is itself a nested
`{x-unit-discriminator, x-units}` object rather than a leaf unit string — the
VSC converter setpoints being the schema's current example, where control mode
selects a further `voltage_units` discriminator on its voltage-control branches.
"""
struct NestedBranch
    key::String
    discriminator::String
    branches::Vector{Any}
end

build_branch(by_unit, type_name, prop, key, unit::AbstractString) =
    LeafBranch(key, String(unit), resolve_quantity(by_unit, type_name, prop, String(unit)))

function build_branch(by_unit, type_name, prop, key, nested::AbstractDict)
    disc = nested["x-unit-discriminator"]
    return NestedBranch(
        key,
        disc,
        build_branches(by_unit, type_name, prop, nested["x-units"]),
    )
end

function build_branches(by_unit, type_name, prop, xunits)
    branches = Any[]
    for (key, value) in pairs(xunits)
        push!(branches, build_branch(by_unit, type_name, prop, String(key), value))
    end
    return branches
end

leaf_value(b::LeafBranch, ::Val{:unit}) = b.unit
leaf_value(b::LeafBranch, ::Val{:quantity}) = b.quantity

function emit_branch_interior(io, type_name, prop, b::LeafBranch, kind, level)
    pad = "    "^level
    println(io, "$(pad)return \"$(leaf_value(b, kind))\"")
    return
end

function emit_branch_interior(io, type_name, prop, b::NestedBranch, kind, level)
    emit_branches(io, type_name, prop, b.branches, b.discriminator, kind, level)
    pad = "    "^level
    println(
        io,
        "$(pad)error(\"$type_name.$prop: no unit declared for $(b.discriminator)=\$(o.$(b.discriminator))\")",
    )
    return
end

function emit_branches(io, type_name, prop, branches, disc, kind, level)
    pad = "    "^level
    for b in branches
        println(io, "$(pad)if string(o.$disc) == \"$(b.key)\"")
        emit_branch_interior(io, type_name, prop, b, kind, level + 1)
        println(io, "$(pad)end")
    end
    return
end

"""
Emit instance-dispatched unit and quantity accessors for an `x-units`
property, recursing through any nested discriminators. TransformerCircuit's
controlled_quantity_limits (flat) maps pu / MVAr / MW to Voltage,
ReactivePower and ActivePower; a VSC converter setpoint (nested) additionally
resolves an inner voltage-basis discriminator for its voltage-control
branches.
"""
function emit_discriminated(io, prefix, by_unit, type_name, prop, spec)
    disc = spec["x-unit-discriminator"]
    branches = build_branches(by_unit, type_name, prop, spec["x-units"])
    if isempty(branches)
        return false
    end

    println(io, "$(prefix)has_declared_unit(::Type{$type_name}, ::Val{:$prop}) = true")
    for (accessor, kind) in
        (("declared_unit", Val(:unit)), ("declared_quantity", Val(:quantity)))
        println(io, "function $(prefix)$(accessor)(o::$type_name, ::Val{:$prop})")
        emit_branches(io, type_name, prop, branches, disc, kind, 1)
        println(
            io,
            "    error(\"$type_name.$prop: no unit declared for $disc=\$(o.$disc)\")",
        )
        println(io, "end")
    end
    return true
end

function emit_type(io, prefix, by_unit, type_name, schema)
    properties = get(schema, "properties", nothing)
    if isnothing(properties)
        return
    end
    for (prop, spec) in pairs(properties)
        if !(spec isa AbstractDict)
            continue
        end
        discriminated = false
        if haskey(spec, "x-units") && haskey(spec, "x-unit-discriminator")
            discriminated = emit_discriminated(io, prefix, by_unit, type_name, prop, spec)
        end
        if !discriminated && haskey(spec, "x-unit") && spec["x-unit"] isa AbstractString
            unit = String(spec["x-unit"])
            emit_fixed(
                io,
                prefix,
                type_name,
                prop,
                unit,
                resolve_quantity(by_unit, type_name, prop, unit),
            )
        end
        if haskey(spec, "x-unit-base")
            println(io, "$(prefix)has_unit_base(::Type{$type_name}, ::Val{:$prop}) = true")
            println(
                io,
                "$(prefix)unit_base(::Type{$type_name}, ::Val{:$prop}) = :$(spec["x-unit-base"])",
            )
        end
    end
    return
end

"""
Write `<package>/src/units.jl` for one domain. Returns true if a file was written.
"""
function emit_units_for(domain, dest_dir, schema_dir, factors, by_unit)
    bundle = joinpath(schema_dir, "dist", "openapi-$domain-bundled.json")
    if !isfile(bundle)
        @warn "No bundled spec for $domain at $bundle; skipping unit emission"
        return false
    end
    spec = JSON.parsefile(bundle)
    prefix = ""
    if domain != "core"
        prefix = "PowerCoreOpenAPIModels."
    end
    open(joinpath(dest_dir, "units.jl"), "w") do io
        println(io, "# Generated from SiennaSchemas x-unit annotations. Do not edit.")
        println(io)
        if domain == "core"
            emit_vocabulary(io, factors)
            emit_fallbacks(io)
        end
        for (type_name, schema) in pairs(spec["components"]["schemas"])
            emit_type(io, prefix, by_unit, type_name, schema)
        end
    end
    return true
end

"""
Standalone entry point: emit units.jl for every domain without running codegen.
"""
function emit_units(schema_dir, repo_root)
    factors, by_unit = load_unit_vocabulary(joinpath(schema_dir, "Core", "units.json"))
    for (domain, pkg) in DOMAIN_TO_PKG
        dest = joinpath(repo_root, pkg, "src")
        isdir(dest) || continue
        if emit_units_for(domain, dest, schema_dir, factors, by_unit)
            @info "Wrote $(joinpath(dest, "units.jl"))"
        end
    end
    return
end
