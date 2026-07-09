-- How many unique users are taking trips each month?

SELECT
  DATE_TRUNC(DATE(started_at),MONTH) AS trip_month,
  COUNT(DISTINCT user_id) AS monthly_active_users,
  COUNT(trip_id) AS total_trips_taken 
FROM `product-analytics-494706.dbt_chargeroute.stg_trips`
GROUP BY
  trip_month
ORDER BY
  trip_month ASC;