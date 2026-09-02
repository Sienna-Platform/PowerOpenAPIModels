# ShuntAdmittanceUnitBasis

Subset of AdmittanceUnitBasis for fixed and switched shunts: omits COMPONENT_BASE because a shunt has no device MVA rating to per-unitize against. NATURAL_UNITS: physical siemens. COMPONENT_MVAR: reactive power at unity voltage (Mvar for susceptance, MW for conductance) — PSS/E RAW native for shunts.

## Allowed values
- `NATURAL_UNITS`
- `COMPONENT_MVAR`
