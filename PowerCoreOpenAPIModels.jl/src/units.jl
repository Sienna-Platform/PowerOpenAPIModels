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
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{LoadZone},
    ::Val{:peak_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{LoadZone},
    ::Val{:peak_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{LoadZone},
    ::Val{:peak_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{LoadZone},
    ::Val{:peak_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{LoadZone},
    ::Val{:peak_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{LoadZone},
    ::Val{:peak_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{LoadZone},
    ::Val{:peak_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{LoadZone},
    ::Val{:peak_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{LoadZone},
    ::Val{:peak_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{LoadZone},
    ::Val{:peak_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{LoadZone},
    ::Val{:peak_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
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
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
) = :mass_unit
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
    ::Val{:LB},
) = "lb"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
    ::Val{:LB},
) = "Mass"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
    ::Val{:SHORT_TON},
) = "ston"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
    ::Val{:SHORT_TON},
) = "Mass"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
    ::Val{:METRIC_TON},
) = "t"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
    ::Val{:METRIC_TON},
) = "Mass"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
    ::Val{:KG},
) = "kg"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EmissionsData},
    ::Val{:start_up_adder},
    ::Val{:KG},
) = "Mass"
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
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{Area},
    ::Val{:peak_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Area},
    ::Val{:peak_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Area},
    ::Val{:peak_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Area},
    ::Val{:peak_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Area},
    ::Val{:peak_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{Area},
    ::Val{:peak_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{Area},
    ::Val{:peak_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Area},
    ::Val{:peak_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Area},
    ::Val{:peak_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Area},
    ::Val{:peak_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Area},
    ::Val{:peak_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
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
