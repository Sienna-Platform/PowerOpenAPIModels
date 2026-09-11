# ReserveDirection

Direction a reserve product is procured in. `UP` increases generation or reduces load when demand exceeds its expected level; `DOWN` decreases generation or increases load when demand falls below it; `SYMMETRIC` procures the same quantity in both directions. Upstream this distinction is a type parameter on the reserve; here it is flattened into a property.

## Allowed values
- `UP`
- `DOWN`
- `SYMMETRIC`
