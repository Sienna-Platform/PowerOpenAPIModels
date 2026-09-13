# Generated from SiennaSchemas x-unit annotations. Do not edit.

InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{LoadZone}, ::Val{:base_power}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{LoadZone}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{LoadZone},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{LoadZone},
    ::Val{:peak_active_power},
) = true
function InfrastructureCoreOpenAPIModels.declared_unit(
    o::LoadZone,
    ::Val{:peak_active_power},
)
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    error("LoadZone.peak_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(
    o::LoadZone,
    ::Val{:peak_active_power},
)
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    error("LoadZone.peak_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{LoadZone},
    ::Val{:peak_reactive_power},
) = true
function InfrastructureCoreOpenAPIModels.declared_unit(
    o::LoadZone,
    ::Val{:peak_reactive_power},
)
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    error("LoadZone.peak_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(
    o::LoadZone,
    ::Val{:peak_reactive_power},
)
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    error("LoadZone.peak_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ACBus}, ::Val{:base_voltage}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ACBus}, ::Val{:base_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ACBus},
    ::Val{:base_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ACBus}, ::Val{:angle}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ACBus}, ::Val{:angle}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{ACBus}, ::Val{:angle}) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ACBus}, ::Val{:magnitude}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ACBus}, ::Val{:magnitude}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ACBus},
    ::Val{:magnitude},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{ACBus}, ::Val{:magnitude}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{ACBus}, ::Val{:magnitude}) = :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ACBus}, ::Val{:voltage_limits}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{ACBus}, ::Val{:voltage_limits}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ACBus},
    ::Val{:voltage_limits},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{ACBus}, ::Val{:voltage_limits}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{ACBus}, ::Val{:voltage_limits}) =
    :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{EmissionsData}, ::Val{:gwp}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{EmissionsData}, ::Val{:gwp}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EmissionsData},
    ::Val{:gwp},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
) = true
function InfrastructureCoreOpenAPIModels.declared_unit(
    o::EmissionsData,
    ::Val{:start_up_adder},
)
    if string(o.mass_unit) == "LB"
        return "lb"
    end
    if string(o.mass_unit) == "SHORT_TON"
        return "ston"
    end
    if string(o.mass_unit) == "METRIC_TON"
        return "t"
    end
    if string(o.mass_unit) == "KG"
        return "kg"
    end
    error("EmissionsData.start_up_adder: no unit declared for mass_unit=$(o.mass_unit)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(
    o::EmissionsData,
    ::Val{:start_up_adder},
)
    if string(o.mass_unit) == "LB"
        return "Mass"
    end
    if string(o.mass_unit) == "SHORT_TON"
        return "Mass"
    end
    if string(o.mass_unit) == "METRIC_TON"
        return "Mass"
    end
    if string(o.mass_unit) == "KG"
        return "Mass"
    end
    error("EmissionsData.start_up_adder: no unit declared for mass_unit=$(o.mass_unit)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ImportExportTimeSeriesCost},
    ::Val{:energy_import_weekly_limit},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ImportExportTimeSeriesCost},
    ::Val{:energy_import_weekly_limit},
) = "MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ImportExportTimeSeriesCost},
    ::Val{:energy_import_weekly_limit},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ImportExportTimeSeriesCost},
    ::Val{:energy_export_weekly_limit},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ImportExportTimeSeriesCost},
    ::Val{:energy_export_weekly_limit},
) = "MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ImportExportTimeSeriesCost},
    ::Val{:energy_export_weekly_limit},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ImportExportCost},
    ::Val{:energy_import_weekly_limit},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ImportExportCost},
    ::Val{:energy_import_weekly_limit},
) = "MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ImportExportCost},
    ::Val{:energy_import_weekly_limit},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ImportExportCost},
    ::Val{:energy_export_weekly_limit},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ImportExportCost},
    ::Val{:energy_export_weekly_limit},
) = "MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ImportExportCost},
    ::Val{:energy_export_weekly_limit},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Area}, ::Val{:load_response}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Area}, ::Val{:load_response}) = "MW/Hz"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Area},
    ::Val{:load_response},
) = "PowerPerFrequency"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Area}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Area}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Area},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Area}, ::Val{:peak_active_power}) =
    true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Area, ::Val{:peak_active_power})
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    if string(o.power_units) == "NATURAL_UNITS"
        return "MW"
    end
    error("Area.peak_active_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(
    o::Area,
    ::Val{:peak_active_power},
)
    if string(o.power_units) == "COMPONENT_BASE"
        return "ActivePower"
    end
    if string(o.power_units) == "NATURAL_UNITS"
        return "ActivePower"
    end
    error("Area.peak_active_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{Area},
    ::Val{:peak_reactive_power},
) = true
function InfrastructureCoreOpenAPIModels.declared_unit(o::Area, ::Val{:peak_reactive_power})
    if string(o.power_units) == "COMPONENT_BASE"
        return "pu"
    end
    if string(o.power_units) == "NATURAL_UNITS"
        return "MVAr"
    end
    error("Area.peak_reactive_power: no unit declared for power_units=$(o.power_units)")
end
function InfrastructureCoreOpenAPIModels.declared_quantity(
    o::Area,
    ::Val{:peak_reactive_power},
)
    if string(o.power_units) == "COMPONENT_BASE"
        return "ReactivePower"
    end
    if string(o.power_units) == "NATURAL_UNITS"
        return "ReactivePower"
    end
    error("Area.peak_reactive_power: no unit declared for power_units=$(o.power_units)")
end
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DCBus}, ::Val{:base_voltage}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DCBus}, ::Val{:base_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DCBus},
    ::Val{:base_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DCBus}, ::Val{:voltage_limits}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DCBus}, ::Val{:voltage_limits}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DCBus},
    ::Val{:voltage_limits},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{DCBus}, ::Val{:voltage_limits}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{DCBus}, ::Val{:voltage_limits}) =
    :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{DCBus}, ::Val{:magnitude}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{DCBus}, ::Val{:magnitude}) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DCBus},
    ::Val{:magnitude},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{DCBus}, ::Val{:magnitude}) = true
InfrastructureCoreOpenAPIModels.unit_base(::Type{DCBus}, ::Val{:magnitude}) = :base_voltage
