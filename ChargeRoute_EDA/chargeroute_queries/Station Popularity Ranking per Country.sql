-- What are the top 3 most popular stations in each country based on successful charges ?

WITH StationUsage AS (
  SELECT
    station_country,
    station_id,
    COUNT(charge_event_id) AS successful_charges
  FROM `product-analytics-494706.dbt_chargeroute.fct_charge_events`
  WHERE is_successful = TRUE
  GROUP BY
    station_country,
    station_id
),

RankedStations AS (
  SELECT
    station_country,
    station_id,
    successful_charges,
    RANK() OVER(PARTITION BY station_country ORDER BY successful_charges DESC) AS popularity_rank
  FROM StationUsage
)

SELECT * FROM RankedStations
WHERE popularity_rank <=3
ORDER BY 
  station_country,
  popularity_rank;