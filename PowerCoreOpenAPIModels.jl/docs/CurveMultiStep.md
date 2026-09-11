# CurveMultiStep

Multi-step block indicator for a bid: 0 = SINGLE_STEP (default; each step of the bid clears independently); 1 = MULTI_STEP (the bid must be awarded as one block across every step it covers). Counted in model steps so it applies at any resolution. Independent of curve style: curve style is the quantity structure, this is the time structure, and they compose.

## Allowed values
- `0`
- `1`
