-- Return Rate by Product Category

SELECT
  p.category,
  COUNTIF(oi.status='Returned') / COUNT(oi.id) AS return_rate,
  COUNT(oi.id) AS total_items_sold  
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
GROUP BY
  p.category
HAVING total_items_sold > 100
ORDER BY
  return_rate DESC;