-- Product Questions: Are users actually able to charge their cars when they arrive at a station ?. A low success rate is a massive product red flag.

SELECT 
  COUNT(charge_event_id) AS total_attempts,
  COUNTIF(is_successful = TRUE) AS successful_charges,
  ROUND(SAFE_DIVIDE(COUNTIF(is_successful = TRUE), COUNT(charge_event_id)) * 100, 2) AS success_rate_percentage
FROM `product-analytics-494706.dbt_chargeroute.stg_charge_events`