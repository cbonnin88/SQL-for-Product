-- Product Question: How many dyas go by between a users consecutive trips ?

WITH TripTimeline AS (
  SELECT
    user_id,
    trip_id,
    started_at,
    LAG(started_at) OVER(PARTITION BY user_id ORDER BY started_at) AS previous_trip_time
  FROM `product-analytics-494706.dbt_chargeroute.stg_trips`
)

SELECT
  user_id,
  ROUND(AVG(TIMESTAMP_DIFF(started_at, previous_trip_time, HOUR) / 24.0),2) AS avg_days_between_trips
FROM TripTimeline
WHERE previous_trip_time IS NOT NULL
GROUP BY
  user_id
ORDER BY
  avg_days_between_trips ASC
LIMIT 20;