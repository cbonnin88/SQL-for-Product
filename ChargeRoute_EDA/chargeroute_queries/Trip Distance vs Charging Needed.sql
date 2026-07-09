-- Product Question: Do longer trips result in hight KWh charges ?

SELECT 
  CASE
    WHEN t.distance_km < 50 THEN 'Short (<50km)'
    WHEN t.distance_km BETWEEN 50 AND 200 THEN 'Medium (50-200km)'
    ELSE 'Long (<200km)'
  END AS trip_distance_bucket,
  ROUND(AVG(c.kwh_charged),2) AS avg_kwh_charged
FROM `product-analytics-494706.dbt_chargeroute.stg_trips` AS t
INNER JOIN `product-analytics-494706.dbt_chargeroute.stg_charge_events` AS c
  ON t.trip_id = c.trip_id
WHERE c.is_successful = TRUE
GROUP BY
  trip_distance_bucket
ORDER BY
  avg_kwh_charged DESC;