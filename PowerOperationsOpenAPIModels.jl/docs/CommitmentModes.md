# CommitmentModes

Why a committable unit is (or would be) committed, orthogonal to its operational state. UNCOMMITTED: not committed, offline but available. COMMITTED: committed by the scheduling process (a planning model's commitment decision or a cleared schedule). SELF_SCHEDULED: scheduled by its owner rather than by the scheduling process. RELIABILITY: committed by the system operator for reliability rather than by the scheduling process. MUST_RUN: required to run by contract or operating constraint.

## Allowed values
- `UNCOMMITTED`
- `COMMITTED`
- `SELF_SCHEDULED`
- `RELIABILITY`
- `MUST_RUN`
