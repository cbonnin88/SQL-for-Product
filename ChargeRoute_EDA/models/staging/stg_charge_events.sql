WITH source AS (
    SELECT * FROM {{source('chargeroute_raw','charge_events')}}
)

SELECT
    CAST(event_id AS INT64) AS charge_event_id,
    CAST(trip_id AS INT64) AS trip_id,
    CAST(station_id AS INT64) AS station_id,
    CAST(kwh_charged AS FLOAT64) AS kwh_charged,
    CAST(cost_eur AS FLOAT64) as cost_eur,
    CAST(is_successful AS BOOL) AS is_successful
FROM source 