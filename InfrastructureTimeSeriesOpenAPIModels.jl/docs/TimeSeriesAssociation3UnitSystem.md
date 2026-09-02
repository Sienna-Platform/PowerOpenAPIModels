# TimeSeriesAssociation3UnitSystem

Basis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS.

## Allowed values
- `COMPONENT_BASE`
- `NATURAL_UNITS`
