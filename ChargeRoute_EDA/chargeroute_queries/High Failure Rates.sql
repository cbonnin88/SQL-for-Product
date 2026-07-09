-- Product Question: Which specific stations are failing the most often ?

WITH StationReliability AS (
  SELECT
    station_id,
    COUNT(charge_event_id) AS total_attempts,
    COUNTIF(is_successful=false) AS failed_attempts
  FROM `product-analytics-494706.dbt_chargeroute.stg_charge_events`
  GROUP BY
    station_id
)

SELECT
  s.country,
  sr.station_id,
  sr.failed_attempts,
  ROUND((sr.failed_attempts / sr.total_attempts)* 100,1) AS failure_rate_pct
FROM StationReliability AS sr
INNER JOIN `product-analytics-494706.dbt_chargeroute.stg_stations` AS s
  ON sr.station_id = s.station_id
WHERE sr.total_attempts > 10
  AND (sr.failed_attempts / sr.total_attempts) >= 0.10
ORDER BY
  failure_rate_pct DESC;