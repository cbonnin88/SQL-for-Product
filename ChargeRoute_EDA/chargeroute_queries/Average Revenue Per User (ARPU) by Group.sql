-- Which age demographic generates the most charging revenue for ChargeRoute ?

SELECT 
  user_age_group,
  COUNT(DISTINCT user_id) AS unique_chargers,
  ROUND(SUM(cost_eur) / COUNT(DISTINCT user_id),2) AS arpu_charging_eur
FROM `product-analytics-494706.dbt_chargeroute.fct_charge_events`
WHERE is_successful = True
GROUP BY
  user_age_group
ORDER BY
  arpu_charging_eur DESC;