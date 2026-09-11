# OwnerCategory

Whether a time series' owner is a component or a supplemental attribute. The producing data layer allocates both kinds of id from one stream, so an owner_id never names one of each; the category is required regardless, because the store's catalog contract still supports independent streams from other producers and remains the store's disambiguator. These are the display and serde spellings; the store's catalog holds them as the integer codes 0 and 1.

## Allowed values
- `Component`
- `SupplementalAttribute`
