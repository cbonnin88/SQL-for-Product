WITH source AS (
    SELECT * FROM {{source('chargeroute_raw','stations')}}
)

SELECT
    CAST(station_id AS INT64) AS station_id,
    CAST(country AS STRING) AS country,
    CAST(latitude AS FLOAT64) AS latitude,
    CAST(longitude AS FLOAT64) AS longitude,
    CAST(plug_count AS INT64) AS plug_count
FROM source 