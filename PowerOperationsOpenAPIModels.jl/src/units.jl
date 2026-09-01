# Generated from SiennaSchemas x-unit annotations. Do not edit.

InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ACBus}, ::Val{:angle}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ACBus}, ::Val{:angle}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ACBus}, ::Val{:angle}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ACBus}, ::Val{:magnitude}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ACBus}, ::Val{:magnitude}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ACBus}, ::Val{:magnitude}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{ACBus}, ::Val{:magnitude}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{ACBus}, ::Val{:magnitude}) = :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ACBus}, ::Val{:voltage_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ACBus}, ::Val{:voltage_limits}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ACBus}, ::Val{:voltage_limits}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{ACBus}, ::Val{:voltage_limits}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{ACBus}, ::Val{:voltage_limits}) = :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ACBus}, ::Val{:base_voltage}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ACBus}, ::Val{:base_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ACBus}, ::Val{:base_voltage}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{AGC}, ::Val{:bias}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{AGC}, ::Val{:bias}) = "MW/Hz"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{AGC}, ::Val{:bias}) = "PowerPerFrequency"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{AGC}, ::Val{:delta_t}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{AGC}, ::Val{:delta_t}) = "s"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{AGC}, ::Val{:delta_t}) = "Duration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Area}, ::Val{:peak_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Area, ::Val{:peak_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Area.peak_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Area, ::Val{:peak_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("Area.peak_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Area}, ::Val{:peak_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Area, ::Val{:peak_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Area.peak_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Area, ::Val{:peak_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("Area.peak_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Area}, ::Val{:load_response}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Area}, ::Val{:load_response}) = "MW/Hz"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Area}, ::Val{:load_response}) = "PowerPerFrequency"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Area}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Area}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Area}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{AreaInterchange}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::AreaInterchange, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("AreaInterchange.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::AreaInterchange, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("AreaInterchange.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{AreaInterchange}, ::Val{:flow_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::AreaInterchange, ::Val{:flow_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("AreaInterchange.flow_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::AreaInterchange, ::Val{:flow_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("AreaInterchange.flow_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{AreaInterchange}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{AreaInterchange}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{AreaInterchange}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{BilateralTransaction}, ::Val{:max_active_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{BilateralTransaction}, ::Val{:max_active_power}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{BilateralTransaction}, ::Val{:max_active_power}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DCBus}, ::Val{:base_voltage}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DCBus}, ::Val{:base_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{DCBus}, ::Val{:base_voltage}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DCBus}, ::Val{:magnitude}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DCBus}, ::Val{:magnitude}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{DCBus}, ::Val{:magnitude}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{DCBus}, ::Val{:magnitude}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{DCBus}, ::Val{:magnitude}) = :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DCBus}, ::Val{:voltage_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DCBus}, ::Val{:voltage_limits}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{DCBus}, ::Val{:voltage_limits}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{DCBus}, ::Val{:voltage_limits}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{DCBus}, ::Val{:voltage_limits}) = :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::DiscreteControlledACBranch, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("DiscreteControlledACBranch.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::DiscreteControlledACBranch, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("DiscreteControlledACBranch.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:reactive_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::DiscreteControlledACBranch, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("DiscreteControlledACBranch.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::DiscreteControlledACBranch, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("DiscreteControlledACBranch.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{DiscreteControlledACBranch}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:r}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:r}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{DiscreteControlledACBranch}, ::Val{:r}) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:x}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:x}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{DiscreteControlledACBranch}, ::Val{:x}) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DiscreteControlledACBranch}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::DiscreteControlledACBranch, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("DiscreteControlledACBranch.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::DiscreteControlledACBranch, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("DiscreteControlledACBranch.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EmissionsData}, ::Val{:start_up_adder}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EmissionsData, ::Val{:start_up_adder})
    if string(o.mass_unit) == "KG"
        return "kg"
    end
    if string(o.mass_unit) == "LB"
        return "lb"
    end
    if string(o.mass_unit) == "SHORT_TON"
        return "ston"
    end
    if string(o.mass_unit) == "METRIC_TON"
        return "t"
    end
    error("EmissionsData.start_up_adder: no unit declared for mass_unit=$(o.mass_unit)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EmissionsData, ::Val{:start_up_adder})
    if string(o.mass_unit) == "KG"
        return "Mass"
    end
    if string(o.mass_unit) == "LB"
        return "Mass"
    end
    if string(o.mass_unit) == "SHORT_TON"
        return "Mass"
    end
    if string(o.mass_unit) == "METRIC_TON"
        return "Mass"
    end
    error("EmissionsData.start_up_adder: no unit declared for mass_unit=$(o.mass_unit)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EmissionsData}, ::Val{:gwp}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{EmissionsData}, ::Val{:gwp}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{EmissionsData}, ::Val{:gwp}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:storage_capacity}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:storage_capacity})
    if string(o.energy_units) == "MWH"
        return "MWh"
    end
    if string(o.energy_units) == "MWMIN"
        return "MWmin"
    end
    error("EnergyReservoirStorage.storage_capacity: no unit declared for energy_units=$(o.energy_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:storage_capacity})
    if string(o.energy_units) == "MWH"
        return "ElectricalEnergy"
    end
    if string(o.energy_units) == "MWMIN"
        return "ElectricalEnergy"
    end
    error("EnergyReservoirStorage.storage_capacity: no unit declared for energy_units=$(o.energy_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:initial_storage_capacity_level}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{EnergyReservoirStorage}, ::Val{:initial_storage_capacity_level}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{EnergyReservoirStorage}, ::Val{:initial_storage_capacity_level}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("EnergyReservoirStorage.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("EnergyReservoirStorage.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("EnergyReservoirStorage.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("EnergyReservoirStorage.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:input_active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:input_active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("EnergyReservoirStorage.input_active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:input_active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("EnergyReservoirStorage.input_active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:output_active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:output_active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("EnergyReservoirStorage.output_active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:output_active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("EnergyReservoirStorage.output_active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("EnergyReservoirStorage.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("EnergyReservoirStorage.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("EnergyReservoirStorage.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("EnergyReservoirStorage.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{EnergyReservoirStorage}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{EnergyReservoirStorage}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:conversion_factor}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{EnergyReservoirStorage}, ::Val{:conversion_factor}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{EnergyReservoirStorage}, ::Val{:conversion_factor}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:storage_target}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{EnergyReservoirStorage}, ::Val{:storage_target}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{EnergyReservoirStorage}, ::Val{:storage_target}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:cycle_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{EnergyReservoirStorage}, ::Val{:cycle_limits}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{EnergyReservoirStorage}, ::Val{:cycle_limits}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:ramp_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW/min"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu/min"
    end
    error("EnergyReservoirStorage.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePowerChangeRate"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePowerChangeRate"
    end
    error("EnergyReservoirStorage.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:self_discharge}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{EnergyReservoirStorage}, ::Val{:self_discharge}) = "1/min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{EnergyReservoirStorage}, ::Val{:self_discharge}) = "FractionPerTime"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EnergyReservoirStorage}, ::Val{:standing_loss}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::EnergyReservoirStorage, ::Val{:standing_loss})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("EnergyReservoirStorage.standing_loss: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::EnergyReservoirStorage, ::Val{:standing_loss})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("EnergyReservoirStorage.standing_loss: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ExponentialLoad}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ExponentialLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ExponentialLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ExponentialLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ExponentialLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ExponentialLoad}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ExponentialLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ExponentialLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ExponentialLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("ExponentialLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ExponentialLoad}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ExponentialLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ExponentialLoad}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ExponentialLoad}, ::Val{:max_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ExponentialLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ExponentialLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ExponentialLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ExponentialLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ExponentialLoad}, ::Val{:max_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ExponentialLoad, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ExponentialLoad.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ExponentialLoad, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("ExponentialLoad.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FACTSControlDevice}, ::Val{:voltage_setpoint}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::FACTSControlDevice, ::Val{:voltage_setpoint})
    if string(o.voltage_setpoint_units) == "NATURAL_UNITS"
        return "kV"
    end
    if string(o.voltage_setpoint_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("FACTSControlDevice.voltage_setpoint: no unit declared for voltage_setpoint_units=$(o.voltage_setpoint_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::FACTSControlDevice, ::Val{:voltage_setpoint})
    if string(o.voltage_setpoint_units) == "NATURAL_UNITS"
        return "Voltage"
    end
    if string(o.voltage_setpoint_units) == "COMPONENT_BASE"
        return "Voltage"
    end
    error("FACTSControlDevice.voltage_setpoint: no unit declared for voltage_setpoint_units=$(o.voltage_setpoint_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FACTSControlDevice}, ::Val{:max_shunt_current}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::FACTSControlDevice, ::Val{:max_shunt_current})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("FACTSControlDevice.max_shunt_current: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::FACTSControlDevice, ::Val{:max_shunt_current})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("FACTSControlDevice.max_shunt_current: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FACTSControlDevice}, ::Val{:reactive_power_required}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{FACTSControlDevice}, ::Val{:reactive_power_required}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{FACTSControlDevice}, ::Val{:reactive_power_required}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FACTSControlDevice}, ::Val{:max_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::FACTSControlDevice, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("FACTSControlDevice.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::FACTSControlDevice, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("FACTSControlDevice.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FACTSControlDevice}, ::Val{:regulated_bus_number}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{FACTSControlDevice}, ::Val{:regulated_bus_number}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{FACTSControlDevice}, ::Val{:regulated_bus_number}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FACTSControlDevice}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{FACTSControlDevice}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{FACTSControlDevice}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FixedAdmittance}, ::Val{:Y}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::FixedAdmittance, ::Val{:Y})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "MVAr"
    end
    error("FixedAdmittance.Y: no unit declared for admittance_units=$(o.admittance_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::FixedAdmittance, ::Val{:Y})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "Susceptance"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "ReactivePower"
    end
    error("FixedAdmittance.Y: no unit declared for admittance_units=$(o.admittance_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FixedAdmittance}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{FixedAdmittance}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{FixedAdmittance}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GroupReserve}, ::Val{:requirement}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{GroupReserve}, ::Val{:requirement}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{GroupReserve}, ::Val{:requirement}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GenericArcImpedance}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::GenericArcImpedance, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("GenericArcImpedance.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::GenericArcImpedance, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("GenericArcImpedance.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GenericArcImpedance}, ::Val{:reactive_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::GenericArcImpedance, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("GenericArcImpedance.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::GenericArcImpedance, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("GenericArcImpedance.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GenericArcImpedance}, ::Val{:max_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::GenericArcImpedance, ::Val{:max_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("GenericArcImpedance.max_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::GenericArcImpedance, ::Val{:max_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("GenericArcImpedance.max_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GenericArcImpedance}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{GenericArcImpedance}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{GenericArcImpedance}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GenericArcImpedance}, ::Val{:r}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::GenericArcImpedance, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("GenericArcImpedance.r: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::GenericArcImpedance, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("GenericArcImpedance.r: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GenericArcImpedance}, ::Val{:x}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::GenericArcImpedance, ::Val{:x})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("GenericArcImpedance.x: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::GenericArcImpedance, ::Val{:x})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("GenericArcImpedance.x: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GeometricDistributionForcedOutage}, ::Val{:mean_time_to_recovery}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{GeometricDistributionForcedOutage}, ::Val{:mean_time_to_recovery}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{GeometricDistributionForcedOutage}, ::Val{:mean_time_to_recovery}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HybridSystem}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HybridSystem, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HybridSystem.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HybridSystem, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HybridSystem.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HybridSystem}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HybridSystem, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HybridSystem.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HybridSystem, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("HybridSystem.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HybridSystem}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HybridSystem}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HybridSystem}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HybridSystem}, ::Val{:interconnection_impedance}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HybridSystem}, ::Val{:interconnection_impedance}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HybridSystem}, ::Val{:interconnection_impedance}) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HybridSystem}, ::Val{:interconnection_rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HybridSystem, ::Val{:interconnection_rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HybridSystem.interconnection_rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HybridSystem, ::Val{:interconnection_rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("HybridSystem.interconnection_rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HybridSystem}, ::Val{:input_active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HybridSystem, ::Val{:input_active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HybridSystem.input_active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HybridSystem, ::Val{:input_active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HybridSystem.input_active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HybridSystem}, ::Val{:output_active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HybridSystem, ::Val{:output_active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HybridSystem.output_active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HybridSystem, ::Val{:output_active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HybridSystem.output_active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HybridSystem}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HybridSystem, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HybridSystem.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HybridSystem, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("HybridSystem.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroDispatch, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroDispatch.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroDispatch, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HydroDispatch.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroDispatch, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroDispatch.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroDispatch, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("HydroDispatch.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroDispatch, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroDispatch.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroDispatch, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("HydroDispatch.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroDispatch, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroDispatch.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroDispatch, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HydroDispatch.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroDispatch, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroDispatch.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroDispatch, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("HydroDispatch.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:ramp_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroDispatch, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW/min"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu/min"
    end
    error("HydroDispatch.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroDispatch, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePowerChangeRate"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePowerChangeRate"
    end
    error("HydroDispatch.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:time_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroDispatch}, ::Val{:time_limits}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroDispatch}, ::Val{:time_limits}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroDispatch}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroDispatch}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:time_at_status}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroDispatch}, ::Val{:time_at_status}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroDispatch}, ::Val{:time_at_status}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroPumpTurbine, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroPumpTurbine.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroPumpTurbine, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HydroPumpTurbine.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroPumpTurbine, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroPumpTurbine.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroPumpTurbine, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("HydroPumpTurbine.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroPumpTurbine, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroPumpTurbine.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroPumpTurbine, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("HydroPumpTurbine.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroPumpTurbine, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroPumpTurbine.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroPumpTurbine, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HydroPumpTurbine.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroPumpTurbine, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroPumpTurbine.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroPumpTurbine, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("HydroPumpTurbine.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:active_power_limits_pump}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroPumpTurbine, ::Val{:active_power_limits_pump})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroPumpTurbine.active_power_limits_pump: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroPumpTurbine, ::Val{:active_power_limits_pump})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HydroPumpTurbine.active_power_limits_pump: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:outflow_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:outflow_limits}) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:outflow_limits}) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:powerhouse_elevation}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:powerhouse_elevation}) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:powerhouse_elevation}) = "Elevation"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:ramp_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroPumpTurbine, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW/min"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu/min"
    end
    error("HydroPumpTurbine.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroPumpTurbine, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePowerChangeRate"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePowerChangeRate"
    end
    error("HydroPumpTurbine.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:time_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:time_limits}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:time_limits}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:time_at_status}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:time_at_status}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:time_at_status}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:active_power_pump}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroPumpTurbine, ::Val{:active_power_pump})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroPumpTurbine.active_power_pump: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroPumpTurbine, ::Val{:active_power_pump})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HydroPumpTurbine.active_power_pump: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:transition_time}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:transition_time}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:transition_time}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:minimum_time}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:minimum_time}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:minimum_time}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:travel_time}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:travel_time}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:travel_time}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroPumpTurbine}, ::Val{:conversion_factor}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroPumpTurbine}, ::Val{:conversion_factor}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroPumpTurbine}, ::Val{:conversion_factor}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:storage_level_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroReservoir, ::Val{:storage_level_limits})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "m3"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "m3"
    end
    if string(o.level_data_type) == "HEAD"
        return "m"
    end
    if string(o.level_data_type) == "ENERGY"
        return "MWh"
    end
    error("HydroReservoir.storage_level_limits: no unit declared for level_data_type=$(o.level_data_type)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroReservoir, ::Val{:storage_level_limits})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "Volume"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "Volume"
    end
    if string(o.level_data_type) == "HEAD"
        return "Elevation"
    end
    if string(o.level_data_type) == "ENERGY"
        return "ElectricalEnergy"
    end
    error("HydroReservoir.storage_level_limits: no unit declared for level_data_type=$(o.level_data_type)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:initial_level}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroReservoir, ::Val{:initial_level})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "m3"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "m3"
    end
    if string(o.level_data_type) == "HEAD"
        return "m"
    end
    if string(o.level_data_type) == "ENERGY"
        return "MWh"
    end
    error("HydroReservoir.initial_level: no unit declared for level_data_type=$(o.level_data_type)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroReservoir, ::Val{:initial_level})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "Volume"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "Volume"
    end
    if string(o.level_data_type) == "HEAD"
        return "Elevation"
    end
    if string(o.level_data_type) == "ENERGY"
        return "ElectricalEnergy"
    end
    error("HydroReservoir.initial_level: no unit declared for level_data_type=$(o.level_data_type)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:spillage_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroReservoir, ::Val{:spillage_limits})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "m3/s"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "m3/s"
    end
    if string(o.level_data_type) == "HEAD"
        return "m/s"
    end
    if string(o.level_data_type) == "ENERGY"
        return "MW"
    end
    error("HydroReservoir.spillage_limits: no unit declared for level_data_type=$(o.level_data_type)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroReservoir, ::Val{:spillage_limits})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "VolumeFlowRate"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "VolumeFlowRate"
    end
    if string(o.level_data_type) == "HEAD"
        return "HeadRate"
    end
    if string(o.level_data_type) == "ENERGY"
        return "ActivePower"
    end
    error("HydroReservoir.spillage_limits: no unit declared for level_data_type=$(o.level_data_type)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:inflow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroReservoir, ::Val{:inflow})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "m3/s"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "m3/s"
    end
    if string(o.level_data_type) == "HEAD"
        return "m/s"
    end
    if string(o.level_data_type) == "ENERGY"
        return "MW"
    end
    error("HydroReservoir.inflow: no unit declared for level_data_type=$(o.level_data_type)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroReservoir, ::Val{:inflow})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "VolumeFlowRate"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "VolumeFlowRate"
    end
    if string(o.level_data_type) == "HEAD"
        return "HeadRate"
    end
    if string(o.level_data_type) == "ENERGY"
        return "ActivePower"
    end
    error("HydroReservoir.inflow: no unit declared for level_data_type=$(o.level_data_type)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:outflow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroReservoir, ::Val{:outflow})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "m3/s"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "m3/s"
    end
    if string(o.level_data_type) == "HEAD"
        return "m/s"
    end
    if string(o.level_data_type) == "ENERGY"
        return "MW"
    end
    error("HydroReservoir.outflow: no unit declared for level_data_type=$(o.level_data_type)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroReservoir, ::Val{:outflow})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "VolumeFlowRate"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "VolumeFlowRate"
    end
    if string(o.level_data_type) == "HEAD"
        return "HeadRate"
    end
    if string(o.level_data_type) == "ENERGY"
        return "ActivePower"
    end
    error("HydroReservoir.outflow: no unit declared for level_data_type=$(o.level_data_type)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:level_targets}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroReservoir, ::Val{:level_targets})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "m3"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "m3"
    end
    if string(o.level_data_type) == "HEAD"
        return "m"
    end
    if string(o.level_data_type) == "ENERGY"
        return "MWh"
    end
    error("HydroReservoir.level_targets: no unit declared for level_data_type=$(o.level_data_type)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroReservoir, ::Val{:level_targets})
    if string(o.level_data_type) == "USABLE_VOLUME"
        return "Volume"
    end
    if string(o.level_data_type) == "TOTAL_VOLUME"
        return "Volume"
    end
    if string(o.level_data_type) == "HEAD"
        return "Elevation"
    end
    if string(o.level_data_type) == "ENERGY"
        return "ElectricalEnergy"
    end
    error("HydroReservoir.level_targets: no unit declared for level_data_type=$(o.level_data_type)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:intake_elevation}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroReservoir}, ::Val{:intake_elevation}) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroReservoir}, ::Val{:intake_elevation}) = "Elevation"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:evaporative_loss}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroReservoir}, ::Val{:evaporative_loss}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroReservoir}, ::Val{:evaporative_loss}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroTurbine, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroTurbine.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroTurbine, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HydroTurbine.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroTurbine, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroTurbine.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroTurbine, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("HydroTurbine.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroTurbine, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroTurbine.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroTurbine, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("HydroTurbine.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroTurbine, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroTurbine.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroTurbine, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("HydroTurbine.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroTurbine, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("HydroTurbine.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroTurbine, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("HydroTurbine.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroTurbine}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroTurbine}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:powerhouse_elevation}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroTurbine}, ::Val{:powerhouse_elevation}) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroTurbine}, ::Val{:powerhouse_elevation}) = "Elevation"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:ramp_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::HydroTurbine, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW/min"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu/min"
    end
    error("HydroTurbine.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::HydroTurbine, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePowerChangeRate"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePowerChangeRate"
    end
    error("HydroTurbine.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:time_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroTurbine}, ::Val{:time_limits}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroTurbine}, ::Val{:time_limits}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:outflow_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroTurbine}, ::Val{:outflow_limits}) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroTurbine}, ::Val{:outflow_limits}) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:conversion_factor}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroTurbine}, ::Val{:conversion_factor}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroTurbine}, ::Val{:conversion_factor}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:travel_time}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{HydroTurbine}, ::Val{:travel_time}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{HydroTurbine}, ::Val{:travel_time}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterconnectingConverter, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterconnectingConverter.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterconnectingConverter, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterconnectingConverter.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterconnectingConverter, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterconnectingConverter.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterconnectingConverter, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("InterconnectingConverter.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterconnectingConverter, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterconnectingConverter.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterconnectingConverter, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterconnectingConverter.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterconnectingConverter}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterconnectingConverter}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterconnectingConverter, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterconnectingConverter.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterconnectingConverter, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterconnectingConverter.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:dc_current}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterconnectingConverter}, ::Val{:dc_current}) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterconnectingConverter}, ::Val{:dc_current}) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:max_dc_current}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterconnectingConverter}, ::Val{:max_dc_current}) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterconnectingConverter}, ::Val{:max_dc_current}) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:dc_setpoint}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterconnectingConverter, ::Val{:dc_setpoint})
    if string(o.dc_control) == "DC_POWER"
        return "MW"
    end
    if string(o.dc_control) == "DC_VOLTAGE"
        if string(o.voltage_setpoint_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.voltage_setpoint_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("InterconnectingConverter.dc_setpoint: no unit declared for voltage_setpoint_units=$(o.voltage_setpoint_units)")
    end
    if string(o.dc_control) == "DC_VOLTAGE_DROOP"
        if string(o.voltage_setpoint_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.voltage_setpoint_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("InterconnectingConverter.dc_setpoint: no unit declared for voltage_setpoint_units=$(o.voltage_setpoint_units)")
    end
    error("InterconnectingConverter.dc_setpoint: no unit declared for dc_control=$(o.dc_control)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterconnectingConverter, ::Val{:dc_setpoint})
    if string(o.dc_control) == "DC_POWER"
        return "ActivePower"
    end
    if string(o.dc_control) == "DC_VOLTAGE"
        if string(o.voltage_setpoint_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.voltage_setpoint_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("InterconnectingConverter.dc_setpoint: no unit declared for voltage_setpoint_units=$(o.voltage_setpoint_units)")
    end
    if string(o.dc_control) == "DC_VOLTAGE_DROOP"
        if string(o.voltage_setpoint_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.voltage_setpoint_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("InterconnectingConverter.dc_setpoint: no unit declared for voltage_setpoint_units=$(o.voltage_setpoint_units)")
    end
    error("InterconnectingConverter.dc_setpoint: no unit declared for dc_control=$(o.dc_control)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:ac_setpoint}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterconnectingConverter, ::Val{:ac_setpoint})
    if string(o.ac_control) == "AC_REACTIVE_POWER"
        return "1"
    end
    if string(o.ac_control) == "AC_VOLTAGE"
        if string(o.voltage_setpoint_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.voltage_setpoint_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("InterconnectingConverter.ac_setpoint: no unit declared for voltage_setpoint_units=$(o.voltage_setpoint_units)")
    end
    error("InterconnectingConverter.ac_setpoint: no unit declared for ac_control=$(o.ac_control)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterconnectingConverter, ::Val{:ac_setpoint})
    if string(o.ac_control) == "AC_REACTIVE_POWER"
        return "PowerFactor"
    end
    if string(o.ac_control) == "AC_VOLTAGE"
        if string(o.voltage_setpoint_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.voltage_setpoint_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("InterconnectingConverter.ac_setpoint: no unit declared for voltage_setpoint_units=$(o.voltage_setpoint_units)")
    end
    error("InterconnectingConverter.ac_setpoint: no unit declared for ac_control=$(o.ac_control)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:dc_voltage_droop}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterconnectingConverter}, ::Val{:dc_voltage_droop}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterconnectingConverter}, ::Val{:dc_voltage_droop}) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:rmpct}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterconnectingConverter}, ::Val{:rmpct}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterconnectingConverter}, ::Val{:rmpct}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:power_factor_weighting_fraction}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterconnectingConverter}, ::Val{:power_factor_weighting_fraction}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterconnectingConverter}, ::Val{:power_factor_weighting_fraction}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterconnectingConverter}, ::Val{:voltage_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterconnectingConverter}, ::Val{:voltage_limits}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterconnectingConverter}, ::Val{:voltage_limits}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptiblePowerLoad}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptiblePowerLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptiblePowerLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptiblePowerLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterruptiblePowerLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptiblePowerLoad}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptiblePowerLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptiblePowerLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptiblePowerLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterruptiblePowerLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptiblePowerLoad}, ::Val{:max_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptiblePowerLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptiblePowerLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptiblePowerLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterruptiblePowerLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptiblePowerLoad}, ::Val{:max_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptiblePowerLoad, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptiblePowerLoad.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptiblePowerLoad, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterruptiblePowerLoad.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptiblePowerLoad}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterruptiblePowerLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterruptiblePowerLoad}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{InterruptibleStandardLoad}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:constant_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:constant_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.constant_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:constant_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterruptibleStandardLoad.constant_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:constant_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:constant_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.constant_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:constant_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterruptibleStandardLoad.constant_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:impedance_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:impedance_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.impedance_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:impedance_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterruptibleStandardLoad.impedance_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:impedance_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:impedance_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.impedance_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:impedance_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterruptibleStandardLoad.impedance_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:current_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:current_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.current_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:current_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterruptibleStandardLoad.current_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:current_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:current_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.current_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:current_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterruptibleStandardLoad.current_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:max_constant_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:max_constant_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.max_constant_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:max_constant_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterruptibleStandardLoad.max_constant_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:max_constant_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:max_constant_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.max_constant_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:max_constant_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterruptibleStandardLoad.max_constant_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:max_impedance_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:max_impedance_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.max_impedance_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:max_impedance_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterruptibleStandardLoad.max_impedance_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:max_impedance_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:max_impedance_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.max_impedance_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:max_impedance_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterruptibleStandardLoad.max_impedance_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:max_current_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:max_current_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.max_current_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:max_current_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("InterruptibleStandardLoad.max_current_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{InterruptibleStandardLoad}, ::Val{:max_current_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::InterruptibleStandardLoad, ::Val{:max_current_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("InterruptibleStandardLoad.max_current_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::InterruptibleStandardLoad, ::Val{:max_current_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("InterruptibleStandardLoad.max_current_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("Line.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:reactive_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("Line.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:r}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.r: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("Line.r: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:x}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:x})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.x: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:x})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("Line.x: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Line}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Line}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:b}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:b})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.b: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:b})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Susceptance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Susceptance"
    end
    error("Line.b: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("Line.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:rating_b}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:rating_b})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.rating_b: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:rating_b})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("Line.rating_b: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:rating_c}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:rating_c})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.rating_c: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:rating_c})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("Line.rating_c: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:angle_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Line}, ::Val{:angle_limits}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Line}, ::Val{:angle_limits}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:g}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Line, ::Val{:g})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Line.g: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Line, ::Val{:g})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Conductance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Conductance"
    end
    error("Line.g: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{LoadZone}, ::Val{:peak_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::LoadZone, ::Val{:peak_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("LoadZone.peak_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::LoadZone, ::Val{:peak_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("LoadZone.peak_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{LoadZone}, ::Val{:peak_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::LoadZone, ::Val{:peak_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("LoadZone.peak_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::LoadZone, ::Val{:peak_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("LoadZone.peak_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{LoadZone}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{LoadZone}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{LoadZone}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("MonitoredLine.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:reactive_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("MonitoredLine.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:r}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.r: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("MonitoredLine.r: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:x}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:x})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.x: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:x})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("MonitoredLine.x: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{MonitoredLine}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{MonitoredLine}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:b}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:b})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.b: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:b})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Susceptance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Susceptance"
    end
    error("MonitoredLine.b: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:flow_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:flow_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.flow_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:flow_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("MonitoredLine.flow_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("MonitoredLine.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:rating_b}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:rating_b})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.rating_b: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:rating_b})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("MonitoredLine.rating_b: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:rating_c}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:rating_c})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.rating_c: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:rating_c})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("MonitoredLine.rating_c: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:angle_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{MonitoredLine}, ::Val{:angle_limits}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{MonitoredLine}, ::Val{:angle_limits}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MonitoredLine}, ::Val{:g}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MonitoredLine, ::Val{:g})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MonitoredLine.g: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MonitoredLine, ::Val{:g})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Conductance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Conductance"
    end
    error("MonitoredLine.g: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MotorLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MotorLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MotorLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("MotorLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MotorLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MotorLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MotorLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("MotorLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{MotorLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{MotorLoad}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MotorLoad, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MotorLoad.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MotorLoad, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("MotorLoad.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:max_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MotorLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MotorLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MotorLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("MotorLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::MotorLoad, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("MotorLoad.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::MotorLoad, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("MotorLoad.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{OfflineReserve}, ::Val{:time_frame}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{OfflineReserve}, ::Val{:time_frame}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{OfflineReserve}, ::Val{:time_frame}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{OfflineReserve}, ::Val{:requirement}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{OfflineReserve}, ::Val{:requirement}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{OfflineReserve}, ::Val{:requirement}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{OfflineReserve}, ::Val{:sustained_time}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{OfflineReserve}, ::Val{:sustained_time}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{OfflineReserve}, ::Val{:sustained_time}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{OnlineReserve}, ::Val{:time_frame}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{OnlineReserve}, ::Val{:time_frame}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{OnlineReserve}, ::Val{:time_frame}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{OnlineReserve}, ::Val{:requirement}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{OnlineReserve}, ::Val{:requirement}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{OnlineReserve}, ::Val{:requirement}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{OnlineReserve}, ::Val{:sustained_time}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{OnlineReserve}, ::Val{:sustained_time}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{OnlineReserve}, ::Val{:sustained_time}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PointToPointBid}, ::Val{:max_active_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{PointToPointBid}, ::Val{:max_active_power}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{PointToPointBid}, ::Val{:max_active_power}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PointToPointBid}, ::Val{:price_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{PointToPointBid}, ::Val{:price_limits}) = "USD/MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{PointToPointBid}, ::Val{:price_limits}) = "CostPerEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PowerLoad}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::PowerLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("PowerLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::PowerLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("PowerLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PowerLoad}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::PowerLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("PowerLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::PowerLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("PowerLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PowerLoad}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{PowerLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{PowerLoad}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PowerLoad}, ::Val{:max_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::PowerLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("PowerLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::PowerLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("PowerLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PowerLoad}, ::Val{:max_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::PowerLoad, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("PowerLoad.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::PowerLoad, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("PowerLoad.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableDispatch}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::RenewableDispatch, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("RenewableDispatch.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::RenewableDispatch, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("RenewableDispatch.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableDispatch}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::RenewableDispatch, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("RenewableDispatch.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::RenewableDispatch, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("RenewableDispatch.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableDispatch}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::RenewableDispatch, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("RenewableDispatch.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::RenewableDispatch, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("RenewableDispatch.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableDispatch}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::RenewableDispatch, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("RenewableDispatch.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::RenewableDispatch, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("RenewableDispatch.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableDispatch}, ::Val{:power_factor}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{RenewableDispatch}, ::Val{:power_factor}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{RenewableDispatch}, ::Val{:power_factor}) = "PowerFactor"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableDispatch}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{RenewableDispatch}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{RenewableDispatch}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableNonDispatch}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::RenewableNonDispatch, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("RenewableNonDispatch.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::RenewableNonDispatch, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("RenewableNonDispatch.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableNonDispatch}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::RenewableNonDispatch, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("RenewableNonDispatch.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::RenewableNonDispatch, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("RenewableNonDispatch.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableNonDispatch}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::RenewableNonDispatch, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("RenewableNonDispatch.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::RenewableNonDispatch, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("RenewableNonDispatch.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableNonDispatch}, ::Val{:power_factor}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{RenewableNonDispatch}, ::Val{:power_factor}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{RenewableNonDispatch}, ::Val{:power_factor}) = "PowerFactor"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{RenewableNonDispatch}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{RenewableNonDispatch}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{RenewableNonDispatch}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ShiftablePowerLoad}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ShiftablePowerLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ShiftablePowerLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ShiftablePowerLoad, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ShiftablePowerLoad.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ShiftablePowerLoad}, ::Val{:active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ShiftablePowerLoad, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ShiftablePowerLoad.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ShiftablePowerLoad, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ShiftablePowerLoad.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ShiftablePowerLoad}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ShiftablePowerLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ShiftablePowerLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ShiftablePowerLoad, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("ShiftablePowerLoad.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ShiftablePowerLoad}, ::Val{:max_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ShiftablePowerLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ShiftablePowerLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ShiftablePowerLoad, ::Val{:max_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ShiftablePowerLoad.max_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ShiftablePowerLoad}, ::Val{:max_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ShiftablePowerLoad, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ShiftablePowerLoad.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ShiftablePowerLoad, ::Val{:max_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("ShiftablePowerLoad.max_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ShiftablePowerLoad}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ShiftablePowerLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ShiftablePowerLoad}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Source, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Source.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Source, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("Source.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Source, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Source.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Source, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("Source.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Source, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Source.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Source, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("Source.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Source, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Source.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Source, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("Source.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:R_th}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Source, ::Val{:R_th})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Source.R_th: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Source, ::Val{:R_th})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("Source.R_th: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:X_th}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Source, ::Val{:X_th})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("Source.X_th: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::Source, ::Val{:X_th})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("Source.X_th: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:internal_voltage}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Source}, ::Val{:internal_voltage}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Source}, ::Val{:internal_voltage}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{Source}, ::Val{:internal_voltage}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{Source}, ::Val{:internal_voltage}) = :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:internal_angle}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Source}, ::Val{:internal_angle}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Source}, ::Val{:internal_angle}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:base_voltage}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Source}, ::Val{:base_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Source}, ::Val{:base_voltage}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Source}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Source}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{StandardLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{StandardLoad}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:constant_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:constant_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.constant_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:constant_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("StandardLoad.constant_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:constant_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:constant_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.constant_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:constant_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("StandardLoad.constant_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:impedance_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:impedance_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.impedance_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:impedance_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("StandardLoad.impedance_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:impedance_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:impedance_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.impedance_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:impedance_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("StandardLoad.impedance_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:current_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:current_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.current_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:current_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("StandardLoad.current_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:current_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:current_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.current_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:current_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("StandardLoad.current_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:max_constant_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:max_constant_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.max_constant_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:max_constant_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("StandardLoad.max_constant_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:max_constant_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:max_constant_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.max_constant_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:max_constant_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("StandardLoad.max_constant_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:max_impedance_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:max_impedance_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.max_impedance_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:max_impedance_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("StandardLoad.max_impedance_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:max_impedance_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:max_impedance_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.max_impedance_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:max_impedance_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("StandardLoad.max_impedance_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:max_current_active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:max_current_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.max_current_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:max_current_active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("StandardLoad.max_current_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{StandardLoad}, ::Val{:max_current_reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::StandardLoad, ::Val{:max_current_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("StandardLoad.max_current_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::StandardLoad, ::Val{:max_current_reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("StandardLoad.max_current_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Substation}, ::Val{:grounding_resistance}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Substation}, ::Val{:grounding_resistance}) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{Substation}, ::Val{:grounding_resistance}) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SwitchedAdmittance}, ::Val{:Y}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::SwitchedAdmittance, ::Val{:Y})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "MVAr"
    end
    error("SwitchedAdmittance.Y: no unit declared for admittance_units=$(o.admittance_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::SwitchedAdmittance, ::Val{:Y})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "Susceptance"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "ReactivePower"
    end
    error("SwitchedAdmittance.Y: no unit declared for admittance_units=$(o.admittance_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SwitchedAdmittance}, ::Val{:Y_increase}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::SwitchedAdmittance, ::Val{:Y_increase})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "MVAr"
    end
    error("SwitchedAdmittance.Y_increase: no unit declared for admittance_units=$(o.admittance_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::SwitchedAdmittance, ::Val{:Y_increase})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "Susceptance"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "ReactivePower"
    end
    error("SwitchedAdmittance.Y_increase: no unit declared for admittance_units=$(o.admittance_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SwitchedAdmittance}, ::Val{:admittance_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::SwitchedAdmittance, ::Val{:admittance_limits})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "MVAr"
    end
    error("SwitchedAdmittance.admittance_limits: no unit declared for admittance_units=$(o.admittance_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::SwitchedAdmittance, ::Val{:admittance_limits})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "Susceptance"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "ReactivePower"
    end
    error("SwitchedAdmittance.admittance_limits: no unit declared for admittance_units=$(o.admittance_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SwitchedAdmittance}, ::Val{:regulated_bus_number}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{SwitchedAdmittance}, ::Val{:regulated_bus_number}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{SwitchedAdmittance}, ::Val{:regulated_bus_number}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SynchronousCondenser}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::SynchronousCondenser, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("SynchronousCondenser.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::SynchronousCondenser, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("SynchronousCondenser.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SynchronousCondenser}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::SynchronousCondenser, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("SynchronousCondenser.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::SynchronousCondenser, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("SynchronousCondenser.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SynchronousCondenser}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::SynchronousCondenser, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("SynchronousCondenser.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::SynchronousCondenser, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("SynchronousCondenser.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SynchronousCondenser}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{SynchronousCondenser}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{SynchronousCondenser}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{SynchronousCondenser}, ::Val{:active_power_losses}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::SynchronousCondenser, ::Val{:active_power_losses})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("SynchronousCondenser.active_power_losses: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::SynchronousCondenser, ::Val{:active_power_losses})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("SynchronousCondenser.active_power_losses: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:active_power_flow}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:active_power_flow}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TModelHVDCLine}, ::Val{:active_power_flow}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:base_current}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:base_current}) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TModelHVDCLine}, ::Val{:base_current}) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:r}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TModelHVDCLine, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TModelHVDCLine.r: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TModelHVDCLine, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("TModelHVDCLine.r: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:l}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:l}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TModelHVDCLine}, ::Val{:l}) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:c}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:c}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TModelHVDCLine}, ::Val{:c}) = "Susceptance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:active_power_limits_from}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:active_power_limits_from}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TModelHVDCLine}, ::Val{:active_power_limits_from}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:active_power_limits_to}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:active_power_limits_to}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TModelHVDCLine}, ::Val{:active_power_limits_to}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalMultiStart, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalMultiStart.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalMultiStart, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ThermalMultiStart.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalMultiStart, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalMultiStart.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalMultiStart, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("ThermalMultiStart.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalMultiStart, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalMultiStart.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalMultiStart, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("ThermalMultiStart.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalMultiStart, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalMultiStart.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalMultiStart, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ThermalMultiStart.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalMultiStart, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalMultiStart.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalMultiStart, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("ThermalMultiStart.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:ramp_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalMultiStart, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW/min"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu/min"
    end
    error("ThermalMultiStart.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalMultiStart, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePowerChangeRate"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePowerChangeRate"
    end
    error("ThermalMultiStart.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:power_trajectory}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalMultiStart, ::Val{:power_trajectory})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalMultiStart.power_trajectory: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalMultiStart, ::Val{:power_trajectory})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ThermalMultiStart.power_trajectory: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:time_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThermalMultiStart}, ::Val{:time_limits}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThermalMultiStart}, ::Val{:time_limits}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:start_time_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThermalMultiStart}, ::Val{:start_time_limits}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThermalMultiStart}, ::Val{:start_time_limits}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThermalMultiStart}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThermalMultiStart}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalMultiStart}, ::Val{:time_at_status}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThermalMultiStart}, ::Val{:time_at_status}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThermalMultiStart}, ::Val{:time_at_status}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:active_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalStandard, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalStandard.active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalStandard, ::Val{:active_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ThermalStandard.active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:reactive_power}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalStandard, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalStandard.reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalStandard, ::Val{:reactive_power})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("ThermalStandard.reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalStandard, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalStandard.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalStandard, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("ThermalStandard.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:active_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalStandard, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalStandard.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalStandard, ::Val{:active_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("ThermalStandard.active_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:reactive_power_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalStandard, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThermalStandard.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalStandard, ::Val{:reactive_power_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("ThermalStandard.reactive_power_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:ramp_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThermalStandard, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW/min"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu/min"
    end
    error("ThermalStandard.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThermalStandard, ::Val{:ramp_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePowerChangeRate"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePowerChangeRate"
    end
    error("ThermalStandard.ramp_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThermalStandard}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThermalStandard}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:time_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThermalStandard}, ::Val{:time_limits}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThermalStandard}, ::Val{:time_limits}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:time_at_status}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThermalStandard}, ::Val{:time_at_status}) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThermalStandard}, ::Val{:time_at_status}) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:r_12}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThreeWindingTransformer, ::Val{:r_12})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThreeWindingTransformer.r_12: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThreeWindingTransformer, ::Val{:r_12})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("ThreeWindingTransformer.r_12: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:x_12}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThreeWindingTransformer, ::Val{:x_12})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThreeWindingTransformer.x_12: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThreeWindingTransformer, ::Val{:x_12})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("ThreeWindingTransformer.x_12: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:r_23}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThreeWindingTransformer, ::Val{:r_23})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThreeWindingTransformer.r_23: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThreeWindingTransformer, ::Val{:r_23})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("ThreeWindingTransformer.r_23: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:x_23}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThreeWindingTransformer, ::Val{:x_23})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThreeWindingTransformer.x_23: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThreeWindingTransformer, ::Val{:x_23})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("ThreeWindingTransformer.x_23: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:r_31}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThreeWindingTransformer, ::Val{:r_31})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThreeWindingTransformer.r_31: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThreeWindingTransformer, ::Val{:r_31})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("ThreeWindingTransformer.r_31: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:x_31}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThreeWindingTransformer, ::Val{:x_31})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThreeWindingTransformer.x_31: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThreeWindingTransformer, ::Val{:x_31})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("ThreeWindingTransformer.x_31: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:base_power_12}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThreeWindingTransformer}, ::Val{:base_power_12}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThreeWindingTransformer}, ::Val{:base_power_12}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:base_power_23}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThreeWindingTransformer}, ::Val{:base_power_23}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThreeWindingTransformer}, ::Val{:base_power_23}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:base_power_31}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ThreeWindingTransformer}, ::Val{:base_power_31}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ThreeWindingTransformer}, ::Val{:base_power_31}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThreeWindingTransformer}, ::Val{:magnetizing_shunt}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::ThreeWindingTransformer, ::Val{:magnetizing_shunt})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "MVAr"
    end
    if string(o.admittance_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("ThreeWindingTransformer.magnetizing_shunt: no unit declared for admittance_units=$(o.admittance_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::ThreeWindingTransformer, ::Val{:magnetizing_shunt})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "Susceptance"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "ReactivePower"
    end
    if string(o.admittance_units) == "COMPONENT_BASE"
        return "Susceptance"
    end
    error("ThreeWindingTransformer.magnetizing_shunt: no unit declared for admittance_units=$(o.admittance_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:tap}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TransformerCircuit}, ::Val{:tap}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TransformerCircuit}, ::Val{:tap}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:alpha}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TransformerCircuit}, ::Val{:alpha}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TransformerCircuit}, ::Val{:alpha}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:r}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TransformerCircuit.r: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("TransformerCircuit.r: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:x}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:x})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TransformerCircuit.x: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:x})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("TransformerCircuit.x: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:control_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:control_limits})
    if string(o.control_objective) == "UNDEFINED"
        return "1"
    end
    if string(o.control_objective) == "VOLTAGE_DISABLED"
        return "1"
    end
    if string(o.control_objective) == "REACTIVE_POWER_FLOW_DISABLED"
        return "1"
    end
    if string(o.control_objective) == "ACTIVE_POWER_FLOW_DISABLED"
        return "rad"
    end
    if string(o.control_objective) == "CONTROL_OF_DC_LINE_DISABLED"
        return "1"
    end
    if string(o.control_objective) == "ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED"
        return "rad"
    end
    if string(o.control_objective) == "FIXED"
        return "1"
    end
    if string(o.control_objective) == "VOLTAGE"
        return "1"
    end
    if string(o.control_objective) == "REACTIVE_POWER_FLOW"
        return "1"
    end
    if string(o.control_objective) == "ACTIVE_POWER_FLOW"
        return "rad"
    end
    if string(o.control_objective) == "CONTROL_OF_DC_LINE"
        return "1"
    end
    if string(o.control_objective) == "ASYMMETRIC_ACTIVE_POWER_FLOW"
        return "rad"
    end
    error("TransformerCircuit.control_limits: no unit declared for control_objective=$(o.control_objective)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:control_limits})
    if string(o.control_objective) == "UNDEFINED"
        return "Dimensionless"
    end
    if string(o.control_objective) == "VOLTAGE_DISABLED"
        return "Dimensionless"
    end
    if string(o.control_objective) == "REACTIVE_POWER_FLOW_DISABLED"
        return "Dimensionless"
    end
    if string(o.control_objective) == "ACTIVE_POWER_FLOW_DISABLED"
        return "Angle"
    end
    if string(o.control_objective) == "CONTROL_OF_DC_LINE_DISABLED"
        return "Dimensionless"
    end
    if string(o.control_objective) == "ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED"
        return "Angle"
    end
    if string(o.control_objective) == "FIXED"
        return "Dimensionless"
    end
    if string(o.control_objective) == "VOLTAGE"
        return "Dimensionless"
    end
    if string(o.control_objective) == "REACTIVE_POWER_FLOW"
        return "Dimensionless"
    end
    if string(o.control_objective) == "ACTIVE_POWER_FLOW"
        return "Angle"
    end
    if string(o.control_objective) == "CONTROL_OF_DC_LINE"
        return "Dimensionless"
    end
    if string(o.control_objective) == "ASYMMETRIC_ACTIVE_POWER_FLOW"
        return "Angle"
    end
    error("TransformerCircuit.control_limits: no unit declared for control_objective=$(o.control_objective)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:controlled_quantity_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:controlled_quantity_limits})
    if string(o.control_objective) == "UNDEFINED"
        return "pu"
    end
    if string(o.control_objective) == "VOLTAGE_DISABLED"
        return "pu"
    end
    if string(o.control_objective) == "REACTIVE_POWER_FLOW_DISABLED"
        return "MVAr"
    end
    if string(o.control_objective) == "ACTIVE_POWER_FLOW_DISABLED"
        return "MW"
    end
    if string(o.control_objective) == "CONTROL_OF_DC_LINE_DISABLED"
        return "MW"
    end
    if string(o.control_objective) == "ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED"
        return "MW"
    end
    if string(o.control_objective) == "FIXED"
        return "pu"
    end
    if string(o.control_objective) == "VOLTAGE"
        return "pu"
    end
    if string(o.control_objective) == "REACTIVE_POWER_FLOW"
        return "MVAr"
    end
    if string(o.control_objective) == "ACTIVE_POWER_FLOW"
        return "MW"
    end
    if string(o.control_objective) == "CONTROL_OF_DC_LINE"
        return "MW"
    end
    if string(o.control_objective) == "ASYMMETRIC_ACTIVE_POWER_FLOW"
        return "MW"
    end
    error("TransformerCircuit.controlled_quantity_limits: no unit declared for control_objective=$(o.control_objective)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:controlled_quantity_limits})
    if string(o.control_objective) == "UNDEFINED"
        return "Voltage"
    end
    if string(o.control_objective) == "VOLTAGE_DISABLED"
        return "Voltage"
    end
    if string(o.control_objective) == "REACTIVE_POWER_FLOW_DISABLED"
        return "ReactivePower"
    end
    if string(o.control_objective) == "ACTIVE_POWER_FLOW_DISABLED"
        return "ActivePower"
    end
    if string(o.control_objective) == "CONTROL_OF_DC_LINE_DISABLED"
        return "ActivePower"
    end
    if string(o.control_objective) == "ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED"
        return "ActivePower"
    end
    if string(o.control_objective) == "FIXED"
        return "Voltage"
    end
    if string(o.control_objective) == "VOLTAGE"
        return "Voltage"
    end
    if string(o.control_objective) == "REACTIVE_POWER_FLOW"
        return "ReactivePower"
    end
    if string(o.control_objective) == "ACTIVE_POWER_FLOW"
        return "ActivePower"
    end
    if string(o.control_objective) == "CONTROL_OF_DC_LINE"
        return "ActivePower"
    end
    if string(o.control_objective) == "ASYMMETRIC_ACTIVE_POWER_FLOW"
        return "ActivePower"
    end
    error("TransformerCircuit.controlled_quantity_limits: no unit declared for control_objective=$(o.control_objective)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TransformerCircuit.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("TransformerCircuit.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:rating_b}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:rating_b})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TransformerCircuit.rating_b: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:rating_b})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("TransformerCircuit.rating_b: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:rating_c}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:rating_c})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TransformerCircuit.rating_c: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:rating_c})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("TransformerCircuit.rating_c: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TransformerCircuit.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TransformerCircuit.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:reactive_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransformerCircuit, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TransformerCircuit.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransformerCircuit, ::Val{:reactive_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TransformerCircuit.reactive_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TransformerCircuit}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TransformerCircuit}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:base_voltage_primary}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TransformerCircuit}, ::Val{:base_voltage_primary}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TransformerCircuit}, ::Val{:base_voltage_primary}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:base_voltage_secondary}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TransformerCircuit}, ::Val{:base_voltage_secondary}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TransformerCircuit}, ::Val{:base_voltage_secondary}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransmissionInterface}, ::Val{:active_power_flow_limits}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TransmissionInterface, ::Val{:active_power_flow_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TransmissionInterface.active_power_flow_limits: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TransmissionInterface, ::Val{:active_power_flow_limits})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TransmissionInterface.active_power_flow_limits: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransmissionInterface}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TransmissionInterface}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TransmissionInterface}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalGenericHVDCLine}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalGenericHVDCLine, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalGenericHVDCLine.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalGenericHVDCLine, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalGenericHVDCLine.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalGenericHVDCLine}, ::Val{:active_power_limits_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalGenericHVDCLine, ::Val{:active_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalGenericHVDCLine.active_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalGenericHVDCLine, ::Val{:active_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalGenericHVDCLine.active_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalGenericHVDCLine}, ::Val{:active_power_limits_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalGenericHVDCLine, ::Val{:active_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalGenericHVDCLine.active_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalGenericHVDCLine, ::Val{:active_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalGenericHVDCLine.active_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalGenericHVDCLine}, ::Val{:reactive_power_limits_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalGenericHVDCLine, ::Val{:reactive_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalGenericHVDCLine.reactive_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalGenericHVDCLine, ::Val{:reactive_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TwoTerminalGenericHVDCLine.reactive_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalGenericHVDCLine}, ::Val{:reactive_power_limits_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalGenericHVDCLine, ::Val{:reactive_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalGenericHVDCLine.reactive_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalGenericHVDCLine, ::Val{:reactive_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TwoTerminalGenericHVDCLine.reactive_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalGenericHVDCLine}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalGenericHVDCLine}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalGenericHVDCLine}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalLCCLine.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:r}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.r: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:r})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("TwoTerminalLCCLine.r: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:transfer_setpoint}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:transfer_setpoint})
    if string(o.power_mode) == "true"
        return "MW"
    end
    if string(o.power_mode) == "false"
        return "A"
    end
    error("TwoTerminalLCCLine.transfer_setpoint: no unit declared for power_mode=$(o.power_mode)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:transfer_setpoint})
    if string(o.power_mode) == "true"
        return "ActivePower"
    end
    if string(o.power_mode) == "false"
        return "CurrentFlow"
    end
    error("TwoTerminalLCCLine.transfer_setpoint: no unit declared for power_mode=$(o.power_mode)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:scheduled_dc_voltage}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:scheduled_dc_voltage})
    if string(o.dc_voltage_units) == "NATURAL_UNITS"
        return "kV"
    end
    if string(o.dc_voltage_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.scheduled_dc_voltage: no unit declared for dc_voltage_units=$(o.dc_voltage_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:scheduled_dc_voltage})
    if string(o.dc_voltage_units) == "NATURAL_UNITS"
        return "Voltage"
    end
    if string(o.dc_voltage_units) == "COMPONENT_BASE"
        return "Voltage"
    end
    error("TwoTerminalLCCLine.scheduled_dc_voltage: no unit declared for dc_voltage_units=$(o.dc_voltage_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_delay_angle_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_delay_angle_limits}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_delay_angle_limits}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_rc}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:rectifier_rc})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.rectifier_rc: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:rectifier_rc})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("TwoTerminalLCCLine.rectifier_rc: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_xc}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:rectifier_xc})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.rectifier_xc: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:rectifier_xc})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("TwoTerminalLCCLine.rectifier_xc: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_base_voltage}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_base_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_base_voltage}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_extinction_angle_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_extinction_angle_limits}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:inverter_extinction_angle_limits}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_rc}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:inverter_rc})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.inverter_rc: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:inverter_rc})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("TwoTerminalLCCLine.inverter_rc: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_xc}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:inverter_xc})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.inverter_xc: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:inverter_xc})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("TwoTerminalLCCLine.inverter_xc: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_base_voltage}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_base_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:inverter_base_voltage}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:switch_mode_voltage}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:switch_mode_voltage})
    if string(o.dc_voltage_units) == "NATURAL_UNITS"
        return "kV"
    end
    if string(o.dc_voltage_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.switch_mode_voltage: no unit declared for dc_voltage_units=$(o.dc_voltage_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:switch_mode_voltage})
    if string(o.dc_voltage_units) == "NATURAL_UNITS"
        return "Voltage"
    end
    if string(o.dc_voltage_units) == "COMPONENT_BASE"
        return "Voltage"
    end
    error("TwoTerminalLCCLine.switch_mode_voltage: no unit declared for dc_voltage_units=$(o.dc_voltage_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:compounding_resistance}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:compounding_resistance})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.compounding_resistance: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:compounding_resistance})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Resistance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Resistance"
    end
    error("TwoTerminalLCCLine.compounding_resistance: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:min_compounding_voltage}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:min_compounding_voltage})
    if string(o.dc_voltage_units) == "NATURAL_UNITS"
        return "kV"
    end
    if string(o.dc_voltage_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.min_compounding_voltage: no unit declared for dc_voltage_units=$(o.dc_voltage_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:min_compounding_voltage})
    if string(o.dc_voltage_units) == "NATURAL_UNITS"
        return "Voltage"
    end
    if string(o.dc_voltage_units) == "COMPONENT_BASE"
        return "Voltage"
    end
    error("TwoTerminalLCCLine.min_compounding_voltage: no unit declared for dc_voltage_units=$(o.dc_voltage_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_transformer_ratio}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_transformer_ratio}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_transformer_ratio}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_setting}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_setting}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_setting}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_limits}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_limits}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_step}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_step}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_tap_step}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_delay_angle}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_delay_angle}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_delay_angle}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:rectifier_capacitor_reactance}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:rectifier_capacitor_reactance})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.rectifier_capacitor_reactance: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:rectifier_capacitor_reactance})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("TwoTerminalLCCLine.rectifier_capacitor_reactance: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_transformer_ratio}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_transformer_ratio}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:inverter_transformer_ratio}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_setting}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_setting}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_setting}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_limits}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_limits}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_step}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_step}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:inverter_tap_step}) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_extinction_angle}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_extinction_angle}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:inverter_extinction_angle}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:inverter_capacitor_reactance}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:inverter_capacitor_reactance})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "ohm"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.inverter_capacitor_reactance: no unit declared for parameter_units=$(o.parameter_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:inverter_capacitor_reactance})
    if string(o.parameter_units) == "NATURAL_UNITS"
        return "Reactance"
    end
    if string(o.parameter_units) == "COMPONENT_BASE"
        return "Reactance"
    end
    error("TwoTerminalLCCLine.inverter_capacitor_reactance: no unit declared for parameter_units=$(o.parameter_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:active_power_limits_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:active_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.active_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:active_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalLCCLine.active_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:active_power_limits_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:active_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.active_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:active_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalLCCLine.active_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:reactive_power_limits_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:reactive_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.reactive_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:reactive_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TwoTerminalLCCLine.reactive_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:reactive_power_limits_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalLCCLine, ::Val{:reactive_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalLCCLine.reactive_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalLCCLine, ::Val{:reactive_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TwoTerminalLCCLine.reactive_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalLCCLine}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:active_power_flow}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:active_power_flow})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalVSCLine.active_power_flow: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rating}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.rating: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:rating})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("TwoTerminalVSCLine.rating: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:active_power_limits_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:active_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.active_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:active_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalVSCLine.active_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:active_power_limits_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:active_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.active_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:active_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    error("TwoTerminalVSCLine.active_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:g}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:g})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "MW"
    end
    if string(o.admittance_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.g: no unit declared for admittance_units=$(o.admittance_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:g})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "Conductance"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "ActivePower"
    end
    if string(o.admittance_units) == "COMPONENT_BASE"
        return "Conductance"
    end
    error("TwoTerminalVSCLine.g: no unit declared for admittance_units=$(o.admittance_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:dc_current}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:dc_current}) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:dc_current}) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:reactive_power_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:reactive_power_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.reactive_power_from: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:reactive_power_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TwoTerminalVSCLine.reactive_power_from: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:dc_setpoint_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:dc_setpoint_from})
    if string(o.dc_control_from) == "DC_POWER"
        return "MW"
    end
    if string(o.dc_control_from) == "DC_VOLTAGE"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("TwoTerminalVSCLine.dc_setpoint_from: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    if string(o.dc_control_from) == "DC_VOLTAGE_DROOP"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("TwoTerminalVSCLine.dc_setpoint_from: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    error("TwoTerminalVSCLine.dc_setpoint_from: no unit declared for dc_control_from=$(o.dc_control_from)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:dc_setpoint_from})
    if string(o.dc_control_from) == "DC_POWER"
        return "ActivePower"
    end
    if string(o.dc_control_from) == "DC_VOLTAGE"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("TwoTerminalVSCLine.dc_setpoint_from: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    if string(o.dc_control_from) == "DC_VOLTAGE_DROOP"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("TwoTerminalVSCLine.dc_setpoint_from: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    error("TwoTerminalVSCLine.dc_setpoint_from: no unit declared for dc_control_from=$(o.dc_control_from)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:ac_setpoint_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:ac_setpoint_from})
    if string(o.ac_control_from) == "AC_REACTIVE_POWER"
        return "1"
    end
    if string(o.ac_control_from) == "AC_VOLTAGE"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("TwoTerminalVSCLine.ac_setpoint_from: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    error("TwoTerminalVSCLine.ac_setpoint_from: no unit declared for ac_control_from=$(o.ac_control_from)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:ac_setpoint_from})
    if string(o.ac_control_from) == "AC_REACTIVE_POWER"
        return "PowerFactor"
    end
    if string(o.ac_control_from) == "AC_VOLTAGE"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("TwoTerminalVSCLine.ac_setpoint_from: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    error("TwoTerminalVSCLine.ac_setpoint_from: no unit declared for ac_control_from=$(o.ac_control_from)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rated_ac_voltage_from}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rated_ac_voltage_from}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:rated_ac_voltage_from}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:max_dc_current_from}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:max_dc_current_from}) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:max_dc_current_from}) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rating_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:rating_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.rating_from: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:rating_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("TwoTerminalVSCLine.rating_from: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:reactive_power_limits_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:reactive_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.reactive_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:reactive_power_limits_from})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TwoTerminalVSCLine.reactive_power_limits_from: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:power_factor_weighting_fraction_from}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:power_factor_weighting_fraction_from}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:power_factor_weighting_fraction_from}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:voltage_limits_from}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:voltage_limits_from})
    if string(o.voltage_units) == "NATURAL_UNITS"
        return "kV"
    end
    if string(o.voltage_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.voltage_limits_from: no unit declared for voltage_units=$(o.voltage_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:voltage_limits_from})
    if string(o.voltage_units) == "NATURAL_UNITS"
        return "Voltage"
    end
    if string(o.voltage_units) == "COMPONENT_BASE"
        return "Voltage"
    end
    error("TwoTerminalVSCLine.voltage_limits_from: no unit declared for voltage_units=$(o.voltage_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:dc_voltage_droop_from}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:dc_voltage_droop_from}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:dc_voltage_droop_from}) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:reactive_power_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:reactive_power_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.reactive_power_to: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:reactive_power_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TwoTerminalVSCLine.reactive_power_to: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:dc_setpoint_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:dc_setpoint_to})
    if string(o.dc_control_to) == "DC_POWER"
        return "MW"
    end
    if string(o.dc_control_to) == "DC_VOLTAGE"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("TwoTerminalVSCLine.dc_setpoint_to: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    if string(o.dc_control_to) == "DC_VOLTAGE_DROOP"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("TwoTerminalVSCLine.dc_setpoint_to: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    error("TwoTerminalVSCLine.dc_setpoint_to: no unit declared for dc_control_to=$(o.dc_control_to)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:dc_setpoint_to})
    if string(o.dc_control_to) == "DC_POWER"
        return "ActivePower"
    end
    if string(o.dc_control_to) == "DC_VOLTAGE"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("TwoTerminalVSCLine.dc_setpoint_to: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    if string(o.dc_control_to) == "DC_VOLTAGE_DROOP"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("TwoTerminalVSCLine.dc_setpoint_to: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    error("TwoTerminalVSCLine.dc_setpoint_to: no unit declared for dc_control_to=$(o.dc_control_to)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:ac_setpoint_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:ac_setpoint_to})
    if string(o.ac_control_to) == "AC_REACTIVE_POWER"
        return "1"
    end
    if string(o.ac_control_to) == "AC_VOLTAGE"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "kV"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "pu"
        end
        error("TwoTerminalVSCLine.ac_setpoint_to: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    error("TwoTerminalVSCLine.ac_setpoint_to: no unit declared for ac_control_to=$(o.ac_control_to)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:ac_setpoint_to})
    if string(o.ac_control_to) == "AC_REACTIVE_POWER"
        return "PowerFactor"
    end
    if string(o.ac_control_to) == "AC_VOLTAGE"
        if string(o.setpoint_voltage_units) == "NATURAL_UNITS"
            return "Voltage"
        end
        if string(o.setpoint_voltage_units) == "COMPONENT_BASE"
            return "Voltage"
        end
        error("TwoTerminalVSCLine.ac_setpoint_to: no unit declared for setpoint_voltage_units=$(o.setpoint_voltage_units)")
    end
    error("TwoTerminalVSCLine.ac_setpoint_to: no unit declared for ac_control_to=$(o.ac_control_to)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rated_ac_voltage_to}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rated_ac_voltage_to}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:rated_ac_voltage_to}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:max_dc_current_to}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:max_dc_current_to}) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:max_dc_current_to}) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rating_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:rating_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVA"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.rating_to: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:rating_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ApparentPower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ApparentPower"
    end
    error("TwoTerminalVSCLine.rating_to: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:reactive_power_limits_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:reactive_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.reactive_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:reactive_power_limits_to})
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    error("TwoTerminalVSCLine.reactive_power_limits_to: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:power_factor_weighting_fraction_to}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:power_factor_weighting_fraction_to}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:power_factor_weighting_fraction_to}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:voltage_limits_to}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoTerminalVSCLine, ::Val{:voltage_limits_to})
    if string(o.voltage_units) == "NATURAL_UNITS"
        return "kV"
    end
    if string(o.voltage_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoTerminalVSCLine.voltage_limits_to: no unit declared for voltage_units=$(o.voltage_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoTerminalVSCLine, ::Val{:voltage_limits_to})
    if string(o.voltage_units) == "NATURAL_UNITS"
        return "Voltage"
    end
    if string(o.voltage_units) == "COMPONENT_BASE"
        return "Voltage"
    end
    error("TwoTerminalVSCLine.voltage_limits_to: no unit declared for voltage_units=$(o.voltage_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:dc_voltage_droop_to}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:dc_voltage_droop_to}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:dc_voltage_droop_to}) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rated_dc_voltage}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rated_dc_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:rated_dc_voltage}) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rmpct_from}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rmpct_from}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:rmpct_from}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rmpct_to}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:rmpct_to}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:rmpct_to}) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{TwoTerminalVSCLine}, ::Val{:base_power}) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoWindingTransformer}, ::Val{:magnetizing_shunt}) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::TwoWindingTransformer, ::Val{:magnetizing_shunt})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "S"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "MVAr"
    end
    if string(o.admittance_units) == "COMPONENT_BASE"
        return "pu"
    end
    error("TwoWindingTransformer.magnetizing_shunt: no unit declared for admittance_units=$(o.admittance_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(o::TwoWindingTransformer, ::Val{:magnetizing_shunt})
    if string(o.admittance_units) == "NATURAL_UNITS"
        return "Susceptance"
    end
    if string(o.admittance_units) == "COMPONENT_MVAR"
        return "ReactivePower"
    end
    if string(o.admittance_units) == "COMPONENT_BASE"
        return "Susceptance"
    end
    error("TwoWindingTransformer.magnetizing_shunt: no unit declared for admittance_units=$(o.admittance_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{VirtualParticipant}, ::Val{:max_supply}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{VirtualParticipant}, ::Val{:max_supply}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{VirtualParticipant}, ::Val{:max_supply}) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{VirtualParticipant}, ::Val{:max_demand}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{VirtualParticipant}, ::Val{:max_demand}) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{VirtualParticipant}, ::Val{:max_demand}) = "ActivePower"
