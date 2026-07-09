-- Product Question: Which countries have the most ChargeRoute stations and total available plugs ?

SELECT
  country,
  COUNT(station_id) AS total_stations,
  SUM(plug_count) AS total_plugs  
FROM `product-analytics-494706.dbt_chargeroute.stg_stations`
GROUP BY
  country
ORDER BY
  total_stations DESC;