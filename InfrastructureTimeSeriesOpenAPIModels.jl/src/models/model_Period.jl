"""
    Period

A time period as an ISO-8601 duration string, used for resolution, horizon, and interval. Fixed spans (PT1H, down to a millisecond floor) and calendar spans (P1M, P1Y) are never equal even when their spans coincide.
"""
const Period = String
