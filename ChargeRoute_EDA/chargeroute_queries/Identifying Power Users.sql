-- Product Question: Who are the top 10% of our users based on total energy consumed ?

WITH UserEnergy AS (
  SELECT
    user_id,
    SUM(kwh_charged) AS total_lifetime_kwh
  FROM `product-analytics-494706.dbt_chargeroute.fct_charge_events`
  WHERE is_successful = TRUE
  GROUP BY
    user_id
),

UserDeciles AS (
  SELECT
    user_id,
    total_lifetime_kwh,
    NTILE(10) OVER(ORDER BY total_lifetime_kwh DESC) AS energy_decile
  FROM UserEnergy
)

SELECT
  u.user_id,
  u.country,
  u.subscription_tier,
  d.total_lifetime_kwh
FROM UserDeciles AS d
INNER JOIN `product-analytics-494706.dbt_chargeroute.stg_users` AS u
  ON d.user_id = u.user_id
WHERE d.energy_decile = 1
ORDER BY
  d.total_lifetime_kwh DESC;