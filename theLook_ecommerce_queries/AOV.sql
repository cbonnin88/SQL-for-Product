-- Average Order Value by Month
SELECT
  EXTRACT(YEAR FROM created_at) AS year,
  EXTRACT(MONTH FROM created_at) AS month,
  ROUND(SUM(sale_price) / COUNT(DISTINCT order_id),2) AS average_order_value  
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE
  status NOT IN ('Cancelled','Returned')
GROUP BY  
  year,
  month
ORDER BY
  year DESC,
  month DESC;