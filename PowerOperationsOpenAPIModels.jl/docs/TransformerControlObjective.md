# TransformerControlObjective

Control objective of a transformer tap changer or phase shifter: a fixed tap position with no automatic adjustment (`FIXED`), or regulation of voltage magnitude at the controlled bus, reactive power flow, active power flow, asymmetric active power flow, or a DC line. Each regulating objective has a paired `_DISABLED` value naming the same control block while it is out of service, and `UNDEFINED` means no control objective is stated.

## Allowed values
- `UNDEFINED`
- `VOLTAGE_DISABLED`
- `REACTIVE_POWER_FLOW_DISABLED`
- `ACTIVE_POWER_FLOW_DISABLED`
- `CONTROL_OF_DC_LINE_DISABLED`
- `ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED`
- `FIXED`
- `VOLTAGE`
- `REACTIVE_POWER_FLOW`
- `ACTIVE_POWER_FLOW`
- `CONTROL_OF_DC_LINE`
- `ASYMMETRIC_ACTIVE_POWER_FLOW`
