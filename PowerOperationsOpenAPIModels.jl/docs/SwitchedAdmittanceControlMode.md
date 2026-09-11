# SwitchedAdmittanceControlMode

Control mode of a switched shunt admittance. `UNDEFINED` leaves the mode unspecified; `FIXED` holds the admittance at a constant value; `CONTINUOUS_VOLTAGE` adjusts it continuously to control voltage. The `DISCRETE_*` modes switch blocks in discrete steps to control voltage, a plant's reactive power, a voltage-source-converter terminal's reactive power, or a remote bus's admittance, respectively.

## Allowed values
- `UNDEFINED`
- `FIXED`
- `DISCRETE_VOLTAGE`
- `CONTINUOUS_VOLTAGE`
- `DISCRETE_REACTIVE_PLANT`
- `DISCRETE_REACTIVE_VSC`
- `DISCRETE_ADMITTANCE_REMOTE`
