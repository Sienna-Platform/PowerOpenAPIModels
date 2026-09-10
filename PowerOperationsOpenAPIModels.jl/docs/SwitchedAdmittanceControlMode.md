# SwitchedAdmittanceControlMode

Control mode of a switched shunt admittance. `UNDEFINED` leaves the mode unspecified. `FIXED` holds the admittance at a constant value. `DISCRETE_VOLTAGE` switches blocks in discrete steps to control voltage. `CONTINUOUS_VOLTAGE` adjusts the admittance continuously to control voltage. `DISCRETE_REACTIVE_PLANT` switches blocks in discrete steps to control reactive power from a plant. `DISCRETE_REACTIVE_VSC` switches blocks in discrete steps to control reactive power from a voltage-source-converter terminal. `DISCRETE_ADMITTANCE_REMOTE` switches blocks in discrete steps to control a remote bus's admittance.

## Allowed values
- `UNDEFINED`
- `FIXED`
- `DISCRETE_VOLTAGE`
- `CONTINUOUS_VOLTAGE`
- `DISCRETE_REACTIVE_PLANT`
- `DISCRETE_REACTIVE_VSC`
- `DISCRETE_ADMITTANCE_REMOTE`
