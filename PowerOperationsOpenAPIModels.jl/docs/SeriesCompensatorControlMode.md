# SeriesCompensatorControlMode

Control mode of a series compensator. `FIXED` holds the series impedance constant (a series capacitor; PSS/E FACTS MODE 3). `BYPASSED` shorts the compensator into a zero-impedance tie (PSS/E FACTS MODE 2). `DISPATCHABLE` makes the series reactance a decision within `reactance_limits`. `ACTIVE_POWER_FLOW` sets the series reactance to hold `active_power_flow_setpoint`.

## Allowed values
- `FIXED`
- `BYPASSED`
- `DISPATCHABLE`
- `ACTIVE_POWER_FLOW`
