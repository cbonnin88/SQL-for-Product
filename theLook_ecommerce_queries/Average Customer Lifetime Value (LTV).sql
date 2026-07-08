-- Average Customer Lifetime Value (LTV) Proxy
SELECT
  ROUND(SUM(sale_price) / COUNT(DISTINCT user_id),2) AS average_lifetime_value
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE
  status NOT IN ('Cancelled','Returned');