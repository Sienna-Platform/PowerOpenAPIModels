# Generated from SiennaSchemas x-unit annotations. Do not edit.

InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{DiscreteControlledACBranch},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:x},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:x},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:x},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:r},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:r},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:r},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:reactive_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{DiscreteControlledACBranch},
    ::Val{:reactive_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:reactive_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:reactive_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:reactive_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:reactive_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:operational_flow_limit},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{DiscreteControlledACBranch},
    ::Val{:operational_flow_limit},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:active_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{DiscreteControlledACBranch},
    ::Val{:active_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{DiscreteControlledACBranch},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{DiscreteControlledACBranch},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ExponentialLoad},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:max_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ExponentialLoad},
    ::Val{:max_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:max_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ExponentialLoad},
    ::Val{:max_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ExponentialLoad},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ExponentialLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ExponentialLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{OnlineReserve},
    ::Val{:requirement},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{OnlineReserve},
    ::Val{:requirement},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{OnlineReserve},
    ::Val{:requirement},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{OnlineReserve},
    ::Val{:sustained_time},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{OnlineReserve},
    ::Val{:sustained_time},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{OnlineReserve},
    ::Val{:sustained_time},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{OnlineReserve},
    ::Val{:time_frame},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{OnlineReserve},
    ::Val{:time_frame},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{OnlineReserve},
    ::Val{:time_frame},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:base_power}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{MotorLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:rating}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{MotorLoad}, ::Val{:rating}) =
    :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{MotorLoad}, ::Val{:active_power}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{MotorLoad},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{MotorLoad},
    ::Val{:max_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{MotorLoad},
    ::Val{:max_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{MotorLoad},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{MotorLoad},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{MotorLoad},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{MotorLoad},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{MotorLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{MotorLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_reactive_power},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_reactive_power},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:voltage_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{VoltageDroopControl},
    ::Val{:voltage_limits},
) = :voltage_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:voltage_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VoltageDroopControl},
    ::Val{:voltage_limits},
    ::Val{:COMPONENT_BASE},
) = "Voltage"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:voltage_limits},
    ::Val{:NATURAL_UNITS},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VoltageDroopControl},
    ::Val{:voltage_limits},
    ::Val{:NATURAL_UNITS},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:reactive_power_limits},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VoltageDroopControl},
    ::Val{:reactive_power_limits},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_voltage_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_voltage_limits},
) = :voltage_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_voltage_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_voltage_limits},
    ::Val{:COMPONENT_BASE},
) = "Voltage"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_voltage_limits},
    ::Val{:NATURAL_UNITS},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VoltageDroopControl},
    ::Val{:deadband_voltage_limits},
    ::Val{:NATURAL_UNITS},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroDispatch},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroDispatch}, ::Val{:rating}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{HydroDispatch}, ::Val{:rating}) =
    :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroDispatch},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroDispatch},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroDispatch},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroDispatch},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroDispatch},
    ::Val{:time_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:time_limits},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:time_limits},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroDispatch},
    ::Val{:ramp_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroDispatch},
    ::Val{:ramp_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "pu/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "MW/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroDispatch},
    ::Val{:time_at_status},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:time_at_status},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:time_at_status},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroDispatch},
    ::Val{:active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroDispatch},
    ::Val{:active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroDispatch},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroDispatch},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroDispatch},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroDispatch},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
) = :level_data_type
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
    ::Val{:USABLE_VOLUME},
) = "m3"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
    ::Val{:USABLE_VOLUME},
) = "Volume"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
    ::Val{:TOTAL_VOLUME},
) = "m3"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
    ::Val{:TOTAL_VOLUME},
) = "Volume"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
    ::Val{:HEAD},
) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
    ::Val{:HEAD},
) = "Elevation"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
    ::Val{:ENERGY},
) = "MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:storage_level_limits},
    ::Val{:ENERGY},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
) = :level_data_type
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
    ::Val{:USABLE_VOLUME},
) = "m3"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
    ::Val{:USABLE_VOLUME},
) = "Volume"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
    ::Val{:TOTAL_VOLUME},
) = "m3"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
    ::Val{:TOTAL_VOLUME},
) = "Volume"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
    ::Val{:HEAD},
) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
    ::Val{:HEAD},
) = "Elevation"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
    ::Val{:ENERGY},
) = "MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:initial_level},
    ::Val{:ENERGY},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroReservoir},
    ::Val{:evaporative_loss},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:evaporative_loss},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:evaporative_loss},
) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
) = :level_data_type
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
    ::Val{:USABLE_VOLUME},
) = "m3"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
    ::Val{:USABLE_VOLUME},
) = "Volume"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
    ::Val{:TOTAL_VOLUME},
) = "m3"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
    ::Val{:TOTAL_VOLUME},
) = "Volume"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
    ::Val{:HEAD},
) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
    ::Val{:HEAD},
) = "Elevation"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
    ::Val{:ENERGY},
) = "MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:level_targets},
    ::Val{:ENERGY},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
) = :level_data_type
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
    ::Val{:USABLE_VOLUME},
) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
    ::Val{:USABLE_VOLUME},
) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
    ::Val{:TOTAL_VOLUME},
) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
    ::Val{:TOTAL_VOLUME},
) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
    ::Val{:HEAD},
) = "m/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
    ::Val{:HEAD},
) = "HeadRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
    ::Val{:ENERGY},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:spillage_limits},
    ::Val{:ENERGY},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroReservoir},
    ::Val{:intake_elevation},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:intake_elevation},
) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:intake_elevation},
) = "Elevation"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:inflow}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{HydroReservoir}, ::Val{:inflow}) =
    :level_data_type
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:inflow},
    ::Val{:USABLE_VOLUME},
) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:inflow},
    ::Val{:USABLE_VOLUME},
) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:inflow},
    ::Val{:TOTAL_VOLUME},
) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:inflow},
    ::Val{:TOTAL_VOLUME},
) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:inflow},
    ::Val{:HEAD},
) = "m/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:inflow},
    ::Val{:HEAD},
) = "HeadRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:inflow},
    ::Val{:ENERGY},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:inflow},
    ::Val{:ENERGY},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroReservoir}, ::Val{:outflow}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroReservoir},
    ::Val{:outflow},
) = :level_data_type
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:outflow},
    ::Val{:USABLE_VOLUME},
) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:outflow},
    ::Val{:USABLE_VOLUME},
) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:outflow},
    ::Val{:TOTAL_VOLUME},
) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:outflow},
    ::Val{:TOTAL_VOLUME},
) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:outflow},
    ::Val{:HEAD},
) = "m/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:outflow},
    ::Val{:HEAD},
) = "HeadRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroReservoir},
    ::Val{:outflow},
    ::Val{:ENERGY},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroReservoir},
    ::Val{:outflow},
    ::Val{:ENERGY},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{GroupReserve},
    ::Val{:requirement},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GroupReserve},
    ::Val{:requirement},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GroupReserve},
    ::Val{:requirement},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{FixedAdmittance}, ::Val{:y}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{FixedAdmittance}, ::Val{:y}) =
    :admittance_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FixedAdmittance},
    ::Val{:y},
    ::Val{:COMPONENT_MVAR},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FixedAdmittance},
    ::Val{:y},
    ::Val{:COMPONENT_MVAR},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FixedAdmittance},
    ::Val{:y},
    ::Val{:NATURAL_UNITS},
) = "S"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FixedAdmittance},
    ::Val{:y},
    ::Val{:NATURAL_UNITS},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{FixedAdmittance},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FixedAdmittance},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FixedAdmittance},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{SynchronousCondenser},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:active_power_losses},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{SynchronousCondenser},
    ::Val{:active_power_losses},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:active_power_losses},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:active_power_losses},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:active_power_losses},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:active_power_losses},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SynchronousCondenser},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{ThermalStandard}, ::Val{:rating}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalStandard},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:switching_times},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:switching_times},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:switching_times},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalStandard},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalStandard},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:time_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:time_limits},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:time_limits},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:ramp_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalStandard},
    ::Val{:ramp_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "pu/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "MW/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:time_at_status},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:time_at_status},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:time_at_status},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalStandard},
    ::Val{:active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalStandard},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalStandard},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalStandard},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalStandard},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{BilateralTransaction},
    ::Val{:max_active_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{BilateralTransaction},
    ::Val{:max_active_power},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{BilateralTransaction},
    ::Val{:max_active_power},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterconnectingConverter},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_voltage_setpoint},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_voltage_setpoint},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:dc_voltage_setpoint},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_voltage_droop},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_voltage_droop},
) = "kV/MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:dc_voltage_droop},
) = "VoltagePerPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterconnectingConverter},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:ac_voltage_setpoint},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:ac_voltage_setpoint},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:ac_voltage_setpoint},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterconnectingConverter},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_current},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_current},
) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:dc_current},
) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_power_setpoint},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterconnectingConverter},
    ::Val{:dc_power_setpoint},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_power_setpoint},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:dc_power_setpoint},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:dc_power_setpoint},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:dc_power_setpoint},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:voltage_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:voltage_limits},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:voltage_limits},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterconnectingConverter},
    ::Val{:active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:max_dc_current},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:max_dc_current},
) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:max_dc_current},
) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:power_factor_setpoint},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:power_factor_setpoint},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:power_factor_setpoint},
) = "PowerFactor"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:power_factor_weighting_fraction},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterconnectingConverter},
    ::Val{:power_factor_weighting_fraction},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterconnectingConverter},
    ::Val{:power_factor_weighting_fraction},
) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:travel_time},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:travel_time},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:travel_time},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{HydroTurbine}, ::Val{:rating}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{HydroTurbine}, ::Val{:rating}) =
    :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:outflow_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:outflow_limits},
) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:outflow_limits},
) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroTurbine},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:powerhouse_elevation},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:powerhouse_elevation},
) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:powerhouse_elevation},
) = "Elevation"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroTurbine},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:time_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:time_limits},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:time_limits},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:conversion_factor},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:conversion_factor},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:conversion_factor},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:ramp_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroTurbine},
    ::Val{:ramp_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "pu/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "MW/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:time_at_status},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:time_at_status},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:time_at_status},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroTurbine},
    ::Val{:active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroTurbine},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroTurbine},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroTurbine},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroTurbine},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TModelHVDCLine},
    ::Val{:active_power_flow},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TModelHVDCLine},
    ::Val{:active_power_flow},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TModelHVDCLine},
    ::Val{:active_power_flow},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:c}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:c}) = "F"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TModelHVDCLine},
    ::Val{:c},
) = "Capacitance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TModelHVDCLine},
    ::Val{:base_current},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TModelHVDCLine},
    ::Val{:base_current},
) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TModelHVDCLine},
    ::Val{:base_current},
) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TModelHVDCLine},
    ::Val{:operational_flow_limit},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TModelHVDCLine},
    ::Val{:operational_flow_limit},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TModelHVDCLine},
    ::Val{:operational_flow_limit},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:r}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:r}) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TModelHVDCLine},
    ::Val{:r},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TModelHVDCLine}, ::Val{:l}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TModelHVDCLine}, ::Val{:l}) = "H"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TModelHVDCLine},
    ::Val{:l},
) = "Inductance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:voltage_setpoint},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{FACTSControlDevice},
    ::Val{:voltage_setpoint},
) = :voltage_setpoint_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:voltage_setpoint},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:voltage_setpoint},
    ::Val{:COMPONENT_BASE},
) = "Voltage"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:voltage_setpoint},
    ::Val{:NATURAL_UNITS},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:voltage_setpoint},
    ::Val{:NATURAL_UNITS},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:regulated_bus_number},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:regulated_bus_number},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:regulated_bus_number},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:max_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{FACTSControlDevice},
    ::Val{:max_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:reactive_power_required},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:reactive_power_required},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:reactive_power_required},
) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:max_shunt_current},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{FACTSControlDevice},
    ::Val{:max_shunt_current},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:max_shunt_current},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:max_shunt_current},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{FACTSControlDevice},
    ::Val{:max_shunt_current},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{FACTSControlDevice},
    ::Val{:max_shunt_current},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_constant_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:max_constant_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_constant_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_constant_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_constant_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_constant_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_current_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:max_current_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_current_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_current_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_current_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_current_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:constant_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:constant_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:constant_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:constant_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:constant_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:constant_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:current_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:current_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:current_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:current_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:current_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:current_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:current_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:current_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:current_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:current_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:current_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:current_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_constant_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:max_constant_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_constant_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_constant_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_constant_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_constant_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_current_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:max_current_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_current_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_current_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_current_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_current_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:impedance_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:impedance_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:impedance_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:impedance_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:impedance_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:impedance_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:impedance_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:impedance_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:impedance_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:impedance_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:impedance_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:impedance_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_impedance_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:max_impedance_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_impedance_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_impedance_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_impedance_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_impedance_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:constant_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:constant_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:constant_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:constant_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:constant_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:constant_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_impedance_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{StandardLoad},
    ::Val{:max_impedance_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_impedance_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_impedance_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{StandardLoad},
    ::Val{:max_impedance_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{StandardLoad},
    ::Val{:max_impedance_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{Substation},
    ::Val{:grounding_resistance},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Substation},
    ::Val{:grounding_resistance},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Substation},
    ::Val{:grounding_resistance},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ShiftablePowerLoad},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ShiftablePowerLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ShiftablePowerLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:controlled_reactive_power_flow_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransformerCircuit},
    ::Val{:controlled_reactive_power_flow_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:controlled_reactive_power_flow_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:controlled_reactive_power_flow_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:controlled_reactive_power_flow_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:controlled_reactive_power_flow_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransformerCircuit},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:x}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{TransformerCircuit}, ::Val{:x}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:x},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:x},
    ::Val{:COMPONENT_BASE},
) = "Reactance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:x},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:x},
    ::Val{:NATURAL_UNITS},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:r}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{TransformerCircuit}, ::Val{:r}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:r},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:r},
    ::Val{:COMPONENT_BASE},
) = "Resistance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:r},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:r},
    ::Val{:NATURAL_UNITS},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating_c},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransformerCircuit},
    ::Val{:rating_c},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating_c},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:rating_c},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating_c},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:rating_c},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating_b},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransformerCircuit},
    ::Val{:rating_b},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating_b},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:rating_b},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:rating_b},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:rating_b},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:controlled_voltage_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:controlled_voltage_limits},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:controlled_voltage_limits},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:reactive_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransformerCircuit},
    ::Val{:reactive_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:reactive_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:reactive_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:reactive_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:reactive_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:base_voltage_primary},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:base_voltage_primary},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:base_voltage_primary},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:alpha},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:alpha},
) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:alpha},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:operational_flow_limit},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransformerCircuit},
    ::Val{:operational_flow_limit},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:tap_ratio_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:tap_ratio_limits},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:tap_ratio_limits},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:controlled_active_power_flow_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransformerCircuit},
    ::Val{:controlled_active_power_flow_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:controlled_active_power_flow_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:controlled_active_power_flow_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:controlled_active_power_flow_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:controlled_active_power_flow_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:active_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransformerCircuit},
    ::Val{:active_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:phase_angle_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:phase_angle_limits},
) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:phase_angle_limits},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:base_voltage_secondary},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransformerCircuit},
    ::Val{:base_voltage_secondary},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:base_voltage_secondary},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TransformerCircuit}, ::Val{:tap}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TransformerCircuit}, ::Val{:tap}) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransformerCircuit},
    ::Val{:tap},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{RenewableDispatch},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:power_factor},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:power_factor},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:power_factor},
) = "PowerFactor"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{RenewableDispatch},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableDispatch},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_from},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_from},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_from},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_from},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_from},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_from},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_from},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_from},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:operational_flow_limit},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:operational_flow_limit},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:active_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:active_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_to},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_to},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_to},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_to},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_to},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:rating_to},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_to},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_to},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalGenericHVDCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{OfflineReserve},
    ::Val{:requirement},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{OfflineReserve},
    ::Val{:requirement},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{OfflineReserve},
    ::Val{:requirement},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{OfflineReserve},
    ::Val{:time_frame},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{OfflineReserve},
    ::Val{:time_frame},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{OfflineReserve},
    ::Val{:time_frame},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{OfflineReserve},
    ::Val{:sustained_time},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{OfflineReserve},
    ::Val{:sustained_time},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{OfflineReserve},
    ::Val{:sustained_time},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_from},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_from},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_setpoint_from},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_setpoint_from},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_setpoint_from},
) = "PowerFactor"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:max_dc_current_from},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:max_dc_current_from},
) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:max_dc_current_from},
) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:max_dc_current_to},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:max_dc_current_to},
) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:max_dc_current_to},
) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_to},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_to},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:ac_voltage_setpoint_from},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:ac_voltage_setpoint_from},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:ac_voltage_setpoint_from},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:voltage_limits_from},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:voltage_limits_from},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:voltage_limits_from},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_from},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_from},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_from},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_from},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_from},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_from},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_weighting_fraction_from},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_weighting_fraction_from},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_weighting_fraction_from},
) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_to},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_to},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_to},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_to},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_to},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_to},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_ac_voltage_from},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_ac_voltage_from},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_ac_voltage_from},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_to},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_to},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_to},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_to},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_to},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_to},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_weighting_fraction_to},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_weighting_fraction_to},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_weighting_fraction_to},
) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_setpoint_to},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_setpoint_to},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_setpoint_to},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_dc_voltage},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_dc_voltage},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_dc_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:g}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalVSCLine}, ::Val{:g}) = "S"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:g},
) = "Conductance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:operational_flow_limit},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:operational_flow_limit},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:active_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:active_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_droop_to},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_droop_to},
) = "kV/MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_droop_to},
) = "VoltagePerPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_droop_from},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_droop_from},
) = "kV/MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_droop_from},
) = "VoltagePerPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_from},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_from},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_from},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_from},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_from},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:reactive_power_from},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:ac_voltage_setpoint_to},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:ac_voltage_setpoint_to},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:ac_voltage_setpoint_to},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_ac_voltage_to},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_ac_voltage_to},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rated_ac_voltage_to},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:voltage_limits_to},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:voltage_limits_to},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:voltage_limits_to},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_setpoint_from},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_setpoint_from},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_voltage_setpoint_from},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_current},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_current},
) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_current},
) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_from},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_from},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_from},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_from},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_from},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:dc_power_setpoint_from},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_to},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_to},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_to},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_to},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_to},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:rating_to},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_setpoint_to},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_setpoint_to},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalVSCLine},
    ::Val{:power_factor_setpoint_to},
) = "PowerFactor"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Line}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:rating}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Line}, ::Val{:rating}) =
    :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:x}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Line}, ::Val{:x}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:x},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:x},
    ::Val{:COMPONENT_BASE},
) = "Reactance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:x},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:x},
    ::Val{:NATURAL_UNITS},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:b}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Line}, ::Val{:b}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:b},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:b},
    ::Val{:COMPONENT_BASE},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:b},
    ::Val{:NATURAL_UNITS},
) = "S"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:b},
    ::Val{:NATURAL_UNITS},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:r}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Line}, ::Val{:r}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:r},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:r},
    ::Val{:COMPONENT_BASE},
) = "Resistance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:r},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:r},
    ::Val{:NATURAL_UNITS},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:rating_c}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Line}, ::Val{:rating_c}) =
    :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:rating_c},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:rating_c},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:rating_c},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:rating_c},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:rating_b}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Line}, ::Val{:rating_b}) =
    :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:rating_b},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:rating_b},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:rating_b},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:rating_b},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{Line},
    ::Val{:reactive_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{Line},
    ::Val{:reactive_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:reactive_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:reactive_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:reactive_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:reactive_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:g}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Line}, ::Val{:g}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:g},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:g},
    ::Val{:COMPONENT_BASE},
) = "Conductance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:g},
    ::Val{:NATURAL_UNITS},
) = "S"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:g},
    ::Val{:NATURAL_UNITS},
) = "Conductance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{Line},
    ::Val{:operational_flow_limit},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{Line},
    ::Val{:operational_flow_limit},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:active_power_flow}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{Line},
    ::Val{:active_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Line},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Line}, ::Val{:angle_limits}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Line}, ::Val{:angle_limits}) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Line},
    ::Val{:angle_limits},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoWindingTransformer},
    ::Val{:magnetizing_shunt},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoWindingTransformer},
    ::Val{:magnetizing_shunt},
) = :admittance_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:COMPONENT_BASE},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:COMPONENT_MVAR},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:COMPONENT_MVAR},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:NATURAL_UNITS},
) = "S"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:NATURAL_UNITS},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{VoltageControlAssociation},
    ::Val{:weight},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VoltageControlAssociation},
    ::Val{:weight},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VoltageControlAssociation},
    ::Val{:weight},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:base_power}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Source}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{Source},
    ::Val{:internal_voltage},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:internal_voltage},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:internal_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_unit_base(::Type{Source}, ::Val{:internal_voltage}) =
    true
InfrastructureCoreOpenAPIModels.unit_base(::Type{Source}, ::Val{:internal_voltage}) =
    :base_voltage
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:base_voltage}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{Source}, ::Val{:base_voltage}) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:base_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:internal_angle}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:internal_angle},
) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:internal_angle},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:active_power}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Source}, ::Val{:active_power}) =
    :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{Source},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{Source},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:x_th}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Source}, ::Val{:x_th}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:x_th},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:x_th},
    ::Val{:COMPONENT_BASE},
) = "Reactance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:x_th},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:x_th},
    ::Val{:NATURAL_UNITS},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:r_th}) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Source}, ::Val{:r_th}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:r_th},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:r_th},
    ::Val{:COMPONENT_BASE},
) = "Resistance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:r_th},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:r_th},
    ::Val{:NATURAL_UNITS},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{Source},
    ::Val{:active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{Source},
    ::Val{:active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{Source}, ::Val{:reactive_power}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{Source}, ::Val{:reactive_power}) =
    :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{Source},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{Source},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{GeometricDistributionForcedOutage},
    ::Val{:mean_time_to_recovery},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GeometricDistributionForcedOutage},
    ::Val{:mean_time_to_recovery},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GeometricDistributionForcedOutage},
    ::Val{:mean_time_to_recovery},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ImpedanceCorrectionData},
    ::Val{:phase_angle_correction_curve},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ImpedanceCorrectionData},
    ::Val{:phase_angle_correction_curve},
) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ImpedanceCorrectionData},
    ::Val{:phase_angle_correction_curve},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ImpedanceCorrectionData},
    ::Val{:tap_ratio_correction_curve},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ImpedanceCorrectionData},
    ::Val{:tap_ratio_correction_curve},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ImpedanceCorrectionData},
    ::Val{:tap_ratio_correction_curve},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{PointToPointBid},
    ::Val{:max_active_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PointToPointBid},
    ::Val{:max_active_power},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PointToPointBid},
    ::Val{:max_active_power},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{PointToPointBid},
    ::Val{:price_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PointToPointBid},
    ::Val{:price_limits},
) = "USD/MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PointToPointBid},
    ::Val{:price_limits},
) = "CostPerEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{AGC}, ::Val{:bias}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{AGC}, ::Val{:bias}) = "MW/Hz"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{AGC},
    ::Val{:bias},
) = "PowerPerFrequency"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{AGC}, ::Val{:delta_t}) = true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{AGC}, ::Val{:delta_t}) = "s"
InfrastructureCoreOpenAPIModels.declared_quantity(::Type{AGC}, ::Val{:delta_t}) = "Duration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableNonDispatch},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{RenewableNonDispatch},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableNonDispatch},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableNonDispatch},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:power_factor},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:power_factor},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableNonDispatch},
    ::Val{:power_factor},
) = "PowerFactor"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{RenewableNonDispatch},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableNonDispatch},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableNonDispatch},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{RenewableNonDispatch},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableNonDispatch},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{RenewableNonDispatch},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{RenewableNonDispatch},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransmissionInterface},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransmissionInterface},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransmissionInterface},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TransmissionInterface},
    ::Val{:active_power_flow_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TransmissionInterface},
    ::Val{:active_power_flow_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransmissionInterface},
    ::Val{:active_power_flow_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransmissionInterface},
    ::Val{:active_power_flow_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TransmissionInterface},
    ::Val{:active_power_flow_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TransmissionInterface},
    ::Val{:active_power_flow_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GenericArcImpedance}, ::Val{:x}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{GenericArcImpedance}, ::Val{:x}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:x},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:x},
    ::Val{:COMPONENT_BASE},
) = "Reactance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:x},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:x},
    ::Val{:NATURAL_UNITS},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{GenericArcImpedance}, ::Val{:r}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(::Type{GenericArcImpedance}, ::Val{:r}) =
    :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:r},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:r},
    ::Val{:COMPONENT_BASE},
) = "Resistance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:r},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:r},
    ::Val{:NATURAL_UNITS},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:reactive_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{GenericArcImpedance},
    ::Val{:reactive_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:reactive_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:reactive_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:reactive_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:reactive_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:operational_flow_limit},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{GenericArcImpedance},
    ::Val{:operational_flow_limit},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:active_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{GenericArcImpedance},
    ::Val{:active_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{GenericArcImpedance},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{GenericArcImpedance},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:current_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_constant_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_current_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:impedance_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:constant_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptibleStandardLoad},
    ::Val{:max_impedance_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HybridSystem},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HybridSystem},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HybridSystem},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HybridSystem},
    ::Val{:input_active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HybridSystem},
    ::Val{:input_active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:input_active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:input_active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:input_active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:input_active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HybridSystem},
    ::Val{:interconnection_impedance},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:interconnection_impedance},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:interconnection_impedance},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HybridSystem},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HybridSystem},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HybridSystem},
    ::Val{:output_active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HybridSystem},
    ::Val{:output_active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:output_active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:output_active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:output_active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:output_active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HybridSystem},
    ::Val{:interconnection_rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HybridSystem},
    ::Val{:interconnection_rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:interconnection_rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:interconnection_rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:interconnection_rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:interconnection_rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HybridSystem},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HybridSystem},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HybridSystem},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HybridSystem},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_12},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_12},
) = :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_12},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_12},
    ::Val{:COMPONENT_BASE},
) = "Reactance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_12},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_12},
    ::Val{:NATURAL_UNITS},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_12},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_12},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_12},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_23},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_23},
) = :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_23},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_23},
    ::Val{:COMPONENT_BASE},
) = "Reactance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_23},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_23},
    ::Val{:NATURAL_UNITS},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_31},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_31},
) = :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_31},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_31},
    ::Val{:COMPONENT_BASE},
) = "Resistance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_31},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_31},
    ::Val{:NATURAL_UNITS},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_31},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_31},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_31},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_23},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_23},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:base_power_23},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_31},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_31},
) = :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_31},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_31},
    ::Val{:COMPONENT_BASE},
) = "Reactance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_31},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:x_31},
    ::Val{:NATURAL_UNITS},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_12},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_12},
) = :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_12},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_12},
    ::Val{:COMPONENT_BASE},
) = "Resistance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_12},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_12},
    ::Val{:NATURAL_UNITS},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_23},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_23},
) = :parameter_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_23},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_23},
    ::Val{:COMPONENT_BASE},
) = "Resistance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_23},
    ::Val{:NATURAL_UNITS},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:r_23},
    ::Val{:NATURAL_UNITS},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:magnetizing_shunt},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThreeWindingTransformer},
    ::Val{:magnetizing_shunt},
) = :admittance_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:COMPONENT_BASE},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:COMPONENT_MVAR},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:COMPONENT_MVAR},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThreeWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:NATURAL_UNITS},
) = "S"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThreeWindingTransformer},
    ::Val{:magnetizing_shunt},
    ::Val{:NATURAL_UNITS},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{VirtualParticipant},
    ::Val{:max_demand},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VirtualParticipant},
    ::Val{:max_demand},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VirtualParticipant},
    ::Val{:max_demand},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{VirtualParticipant},
    ::Val{:max_supply},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{VirtualParticipant},
    ::Val{:max_supply},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{VirtualParticipant},
    ::Val{:max_supply},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalMultiStart},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:switching_times},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:switching_times},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:switching_times},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:power_trajectory},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalMultiStart},
    ::Val{:power_trajectory},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:power_trajectory},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:power_trajectory},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:power_trajectory},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:power_trajectory},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalMultiStart},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:start_time_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:start_time_limits},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:start_time_limits},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:time_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:time_limits},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:time_limits},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:ramp_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalMultiStart},
    ::Val{:ramp_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "pu/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "MW/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:time_at_status},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:time_at_status},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:time_at_status},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalMultiStart},
    ::Val{:active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{ThermalMultiStart},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptiblePowerLoad},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{InterruptiblePowerLoad},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{InterruptiblePowerLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{InterruptiblePowerLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_base_voltage},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_base_voltage},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_base_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_from},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_from},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_from},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:r}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{TwoTerminalLCCLine}, ::Val{:r}) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:r},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_extinction_angle},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_extinction_angle},
) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_extinction_angle},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:power_transfer_setpoint},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalLCCLine},
    ::Val{:power_transfer_setpoint},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:power_transfer_setpoint},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:power_transfer_setpoint},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:power_transfer_setpoint},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:power_transfer_setpoint},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_transformer_ratio},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_transformer_ratio},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_transformer_ratio},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_rc},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_rc},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_rc},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_capacitor_reactance},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_capacitor_reactance},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_capacitor_reactance},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_limits},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_limits},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_to},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_to},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:reactive_power_limits_to},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_extinction_angle_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_extinction_angle_limits},
) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_extinction_angle_limits},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_from},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_from},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_from},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_from},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_from},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_from},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_limits},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_limits},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_xc},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_xc},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_xc},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:min_compounding_voltage},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:min_compounding_voltage},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:min_compounding_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_rc},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_rc},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_rc},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_transformer_ratio},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_transformer_ratio},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_transformer_ratio},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:compounding_resistance},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:compounding_resistance},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:compounding_resistance},
) = "Resistance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:switch_mode_voltage},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:switch_mode_voltage},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:switch_mode_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_xc},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_xc},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_xc},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_capacitor_reactance},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_capacitor_reactance},
) = "ohm"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_capacitor_reactance},
) = "Reactance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_setting},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_setting},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_setting},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_delay_angle},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_delay_angle},
) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_delay_angle},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:operational_flow_limit},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalLCCLine},
    ::Val{:operational_flow_limit},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:operational_flow_limit},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:operational_flow_limit},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_step},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_step},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_step},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:active_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalLCCLine},
    ::Val{:active_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_delay_angle_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_delay_angle_limits},
) = "rad"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_delay_angle_limits},
) = "Angle"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:scheduled_dc_voltage},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:scheduled_dc_voltage},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:scheduled_dc_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_base_voltage},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_base_voltage},
) = "kV"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_base_voltage},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_step},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_step},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rectifier_tap_step},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_setting},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_setting},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:inverter_tap_setting},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_to},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_to},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_to},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_to},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_to},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:rating_to},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:current_transfer_setpoint},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{TwoTerminalLCCLine},
    ::Val{:current_transfer_setpoint},
) = "A"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{TwoTerminalLCCLine},
    ::Val{:current_transfer_setpoint},
) = "CurrentFlow"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PowerLoad}, ::Val{:base_power}) =
    true
InfrastructureCoreOpenAPIModels.declared_unit(::Type{PowerLoad}, ::Val{:base_power}) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(::Type{PowerLoad}, ::Val{:active_power}) =
    true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{PowerLoad},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PowerLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PowerLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{PowerLoad},
    ::Val{:max_active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{PowerLoad},
    ::Val{:max_active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PowerLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:max_active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PowerLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:max_active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{PowerLoad},
    ::Val{:max_reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{PowerLoad},
    ::Val{:max_reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:max_reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{PowerLoad},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{PowerLoad},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PowerLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{PowerLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{PowerLoad},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:travel_time},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:travel_time},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:travel_time},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroPumpTurbine},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:outflow_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:outflow_limits},
) = "m3/s"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:outflow_limits},
) = "VolumeFlowRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_pump},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_pump},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_pump},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_pump},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_pump},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_pump},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:powerhouse_elevation},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:powerhouse_elevation},
) = "m"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:powerhouse_elevation},
) = "Elevation"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits_pump},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits_pump},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits_pump},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits_pump},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits_pump},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits_pump},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:transition_time},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:transition_time},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:transition_time},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:time_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:time_limits},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:time_limits},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:conversion_factor},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:conversion_factor},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:conversion_factor},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:ramp_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroPumpTurbine},
    ::Val{:ramp_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "pu/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "MW/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:time_at_status},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:time_at_status},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:time_at_status},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:minimum_time},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{HydroPumpTurbine},
    ::Val{:minimum_time},
) = "min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{HydroPumpTurbine},
    ::Val{:minimum_time},
) = "OperationalDuration"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{AreaInterchange},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{AreaInterchange},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{AreaInterchange},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{AreaInterchange},
    ::Val{:active_power_flow},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{AreaInterchange},
    ::Val{:active_power_flow},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{AreaInterchange},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{AreaInterchange},
    ::Val{:active_power_flow},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{AreaInterchange},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{AreaInterchange},
    ::Val{:active_power_flow},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{AreaInterchange},
    ::Val{:flow_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{AreaInterchange},
    ::Val{:flow_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{AreaInterchange},
    ::Val{:flow_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{AreaInterchange},
    ::Val{:flow_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{AreaInterchange},
    ::Val{:flow_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{AreaInterchange},
    ::Val{:flow_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:base_power},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:base_power},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:base_power},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:rating},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:rating},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:rating},
    ::Val{:COMPONENT_BASE},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "MVA"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:rating},
    ::Val{:NATURAL_UNITS},
) = "ApparentPower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:self_discharge},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:self_discharge},
) = "1/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:self_discharge},
) = "FractionPerTime"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:active_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:active_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:active_power},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:active_power},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_target},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_target},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_target},
) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:input_active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:input_active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:input_active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:input_active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:input_active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:input_active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:initial_storage_capacity_level},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:initial_storage_capacity_level},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:initial_storage_capacity_level},
) = "Fraction"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:standing_loss},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:standing_loss},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:standing_loss},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:standing_loss},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:standing_loss},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:standing_loss},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:output_active_power_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:output_active_power_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:output_active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:output_active_power_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:output_active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "MW"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:output_active_power_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:conversion_factor},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:conversion_factor},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:conversion_factor},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_capacity},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_capacity},
) = :energy_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_capacity},
    ::Val{:MWMIN},
) = "MWmin"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_capacity},
    ::Val{:MWMIN},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_capacity},
    ::Val{:MWH},
) = "MWh"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:storage_capacity},
    ::Val{:MWH},
) = "ElectricalEnergy"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:ramp_limits},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:ramp_limits},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "pu/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:ramp_limits},
    ::Val{:COMPONENT_BASE},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "MW/min"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:ramp_limits},
    ::Val{:NATURAL_UNITS},
) = "ActivePowerChangeRate"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power},
) = :power_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power},
    ::Val{:COMPONENT_BASE},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:reactive_power},
    ::Val{:NATURAL_UNITS},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:cycle_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{EnergyReservoirStorage},
    ::Val{:cycle_limits},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{EnergyReservoirStorage},
    ::Val{:cycle_limits},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:regulated_bus_number},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:regulated_bus_number},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SwitchedAdmittance},
    ::Val{:regulated_bus_number},
) = "Dimensionless"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:solved_admittance},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{SwitchedAdmittance},
    ::Val{:solved_admittance},
) = :admittance_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:solved_admittance},
    ::Val{:COMPONENT_MVAR},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SwitchedAdmittance},
    ::Val{:solved_admittance},
    ::Val{:COMPONENT_MVAR},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:solved_admittance},
    ::Val{:NATURAL_UNITS},
) = "S"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SwitchedAdmittance},
    ::Val{:solved_admittance},
    ::Val{:NATURAL_UNITS},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:y_increase},
) = true
InfrastructureCoreOpenAPIModels.unit_discriminator(
    ::Type{SwitchedAdmittance},
    ::Val{:y_increase},
) = :admittance_units
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:y_increase},
    ::Val{:COMPONENT_MVAR},
) = "MVAr"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SwitchedAdmittance},
    ::Val{:y_increase},
    ::Val{:COMPONENT_MVAR},
) = "ReactivePower"
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:y_increase},
    ::Val{:NATURAL_UNITS},
) = "S"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SwitchedAdmittance},
    ::Val{:y_increase},
    ::Val{:NATURAL_UNITS},
) = "Susceptance"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:voltage_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:voltage_limits},
) = "pu"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SwitchedAdmittance},
    ::Val{:voltage_limits},
) = "Voltage"
InfrastructureCoreOpenAPIModels.has_declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:reactive_power_range_limits},
) = true
InfrastructureCoreOpenAPIModels.declared_unit(
    ::Type{SwitchedAdmittance},
    ::Val{:reactive_power_range_limits},
) = "1"
InfrastructureCoreOpenAPIModels.declared_quantity(
    ::Type{SwitchedAdmittance},
    ::Val{:reactive_power_range_limits},
) = "Fraction"
