-- Monthly Active Users (MAU)
SELECT 
  EXTRACT(YEAR FROM created_at) AS year,
  EXTRACT(MONTH FROM created_at) AS MONTH,
  COUNT(DISTINCT user_id) AS monthly_active_users
FROM `bigquery-public-data.thelook_ecommerce.events`
GROUP BY
  1,2
ORDER BY
  1 DESC,
  2 DESC;
