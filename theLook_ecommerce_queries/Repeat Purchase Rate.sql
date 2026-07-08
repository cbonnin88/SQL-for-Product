-- Repeat Purchase Rate

WITH user_orders AS (
  SELECT
    user_id,
    COUNT(DISTINCT order_id) AS order_count
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE
    status NOT IN ('Cancelled','Returned')
  GROUP BY
    user_id
)

SELECT
  COUNTIF(user_orders.order_count > 1) / COUNT(user_id) AS repeat_purchase_rate
FROM user_orders;