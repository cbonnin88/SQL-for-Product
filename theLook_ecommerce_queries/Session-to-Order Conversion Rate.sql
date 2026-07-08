-- Session-to-Order Conversion Rate

SELECT
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN session_id END) / COUNT(DISTINCT session_id) AS conversion_rate  
FROM `bigquery-public-data.thelook_ecommerce.events`;