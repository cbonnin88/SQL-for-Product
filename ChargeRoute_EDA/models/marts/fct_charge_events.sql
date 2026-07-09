{{config(materialized='table')}}

WITH charge_events AS (
    SELECT * FROM {{ref('stg_charge_events')}}
),

trips AS (
    SELECT * FROM {{ref('stg_trips')}}
),

users AS (
    SELECT * FROM {{ref('stg_users')}}
),

stations AS (
    SELECT * FROM {{ref('stg_stations')}}
)

SELECT
    -- Keys
    ce.charge_event_id,
    ce.trip_id,
    ce.station_id,
    t.user_id,
    -- Event Telemetry & Metrics
    ce.kwh_charged,
    ce.cost_eur,
    t.distance_km AS associate_trip_distance_km,
    t.started_at AS trip_started_at,
    -- User Context
    u.signup_at AS user_signup_at,
    u.country AS user_home_country,
    u.gender AS user_gender,
    u.age AS user_age,
    u.subscription_tier,
    u.subscription_price_eur,
    -- Derived User Segmentations
    CASE
        WHEN u.age < 25 THEN 'Under 25'
        WHEN u.age BETWEEN 25 AND 39 THEN '25-39'
        WHEN u.age BETWEEN 40 AND 54 THEN '40-54'
        ELSE '55+'
    END AS user_age_group,
    -- Station Context
    s.country AS station_country,
    s.latitude AS station_latitude,
    s.longitude AS station_longitude,
    s.plug_count AS station_plug_count,
    -- Analytical Flag
    CASE
        WHEN u.country = s.country THEN true
        ELSE false
    END AS is_domestic_charging
FROM charge_events AS ce
LEFT JOIN trips AS t
    ON ce.trip_id = t.trip_id
LEFT JOIN users AS u
    ON t.user_id = u.user_id
LEFT JOIN stations AS s
    ON ce.station_id = s.station_id