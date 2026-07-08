-- Revenue by Traffic Source

SELECT
  u.traffic_source,
  ROUND(SUM(oi.sale_price),2) AS total_revenue,
  COUNT(DISTINCT u.id) AS unique_purchasing_customers  
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON u.id = oi.user_id
WHERE
  oi.status NOT IN ('Cancelled','Return')
GROUP BY
  u.traffic_source
ORDER BY
  total_revenue DESC;