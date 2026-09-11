# VoltageUnitBasis

Unit basis a voltage setpoint is stored in. NATURAL_UNITS: kilovolts. COMPONENT_BASE: per-unit on the component's own base voltage (the connected bus's base voltage for AC setpoints — PSS/E RAW native for FACTS VSET — and the device voltage base PSS/E supplies for DC-line converters and CZ=2 transformer windings). There is no separate system-base option: bus-base per-unit is the device base for voltage.

## Allowed values
- `NATURAL_UNITS`
- `COMPONENT_BASE`
