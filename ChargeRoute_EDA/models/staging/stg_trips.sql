WITH source AS (
    SELECT * FROM {{source('chargeroute_raw','trips')}}
)

SELECT
    CAST(trip_id AS INT64) AS trip_id,
    CAST(user_id AS INT64) AS user_id,
    CAST(start_time AS TIMESTAMP) AS started_at,
    CAST(distance_km AS FLOAT64) AS distance_km
FROM source