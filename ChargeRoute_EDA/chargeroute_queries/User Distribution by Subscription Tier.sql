-- Product Question: What is the breakdown of our user base across Free, Basic, and Premium tiers ?

SELECT
  subscription_tier,
  COUNT(user_id) AS total_users,
  ROUND(SUM(subscription_price_eur),2) AS totaly_monthly_recurring_revenue  
FROM `product-analytics-494706.dbt_chargeroute.stg_users`
GROUP BY
  subscription_tier
ORDER BY
  total_users DESC;