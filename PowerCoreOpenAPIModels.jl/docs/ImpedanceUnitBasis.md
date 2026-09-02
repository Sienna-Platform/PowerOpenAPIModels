# ImpedanceUnitBasis

Unit basis a branch/injection impedance is stored in. NATURAL_UNITS: physical ohms (PSS/E RAW native for DC-line impedances). COMPONENT_BASE: per-unit on the component's own base (base_power MVA and voltage base); components whose per-unit data was historically on the system base record that system base in base_power, so there is no separate system-base option. PSS/E supplies device base for DC-line converters and CZ=2 transformer windings. A branch's shunt admittance halves (b, g) share the branch's one basis: NATURAL_UNITS stores them in siemens.

## Allowed values
- `NATURAL_UNITS`
- `COMPONENT_BASE`
