# VirtualParticipant

A virtual (convergence) market participant. Supply offers map to incremental offer curves; demand bids map to decremental offer curves. Settles at a settlement point or at trading hubs, carried as TradingHubAssociation rows.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the participant is available for market clearing (`true`) or not (`false`). | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_demand`** | **`Float64`** | Maximum envelope for the decremental (demand) side. Units: MW. | [required]
**`max_supply`** | **`Float64`** | Maximum envelope for the incremental (supply) side. Units: MW. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`operation_cost`** | **`VirtualParticipantOperationCost`** | Bid curves as an offer-curve operating cost. | [required]
**`settlement_point_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the location this participant settles at — a bus, area, or load zone. `null` when the participant settles at trading hubs instead. | [optional]
