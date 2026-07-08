-- Top 5 Highest Grossing Products

SELECT
  p.name AS product_name,
  p.category,
  ROUND(SUM(oi.sale_price),2) AS total_revenue  
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE
  oi.status NOT IN ('Cancelled','Returned')
GROUP BY
  product_name,
  p.category
ORDER BY
  total_revenue DESC
LIMIT 5;