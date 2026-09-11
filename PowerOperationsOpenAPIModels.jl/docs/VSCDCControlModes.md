# VSCDCControlModes

DC-side control mode of a voltage-source-converter (VSC) terminal. DC_POWER: converter controls active power transferred to the DC side. DC_VOLTAGE: converter controls the DC-side voltage. DC_VOLTAGE_DROOP: P-Vdc droop, V_dc = dc_setpoint - droop_gain * P_c.

## Allowed values
- `DC_POWER`
- `DC_VOLTAGE`
- `DC_VOLTAGE_DROOP`
