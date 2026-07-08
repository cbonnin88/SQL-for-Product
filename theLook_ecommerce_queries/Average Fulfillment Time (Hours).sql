-- Average Fulfillment Time (hours)

SELECT
  EXTRACT(YEAR FROM created_at) AS year,
  EXTRACT(MONTh FROM created_at) AS month,
  AVG(TIMESTAMP_DIFF(shipped_at,created_at, HOUR)) AS avg_hours_to_ship  
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE 
  shipped_at IS NOT NULL
GROUP BY
  year,
  month
ORDER BY
  year DESC,
  month DESC;