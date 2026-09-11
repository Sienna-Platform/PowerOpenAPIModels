# AdmittanceUnitBasis

Unit basis a shunt admittance is stored in. NATURAL_UNITS: physical siemens. COMPONENT_MVAR: reactive power at unity voltage (Mvar for susceptance, MW for conductance). COMPONENT_BASE: per-unit on the component's own base (base_power MVA and voltage base) — a per-unit base, not a power at unity voltage, and not an alternative spelling of COMPONENT_MVAR; components whose per-unit data was historically on the system base record that system base in base_power. Fixed and switched shunts use ShuntAdmittanceUnitBasis instead, which omits COMPONENT_BASE because a shunt has no device MVA rating.

## Allowed values
- `NATURAL_UNITS`
- `COMPONENT_MVAR`
- `COMPONENT_BASE`
