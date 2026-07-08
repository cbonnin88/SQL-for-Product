-- Cart Abandonment Rate

WITH session_events AS (
  SELECT
    session_id,
    LOGICAL_OR(event_type = 'cart') AS added_to_cart,
    LOGICAL_OR(event_type = 'purchase') AS purchased
  FROM `bigquery-public-data.thelook_ecommerce.events`
  GROUP BY
    session_id
)
SELECT
  COUNTIF(session_events.added_to_cart AND NOT purchased) / NULLIF(COUNTIF(added_to_cart),0) AS cart_abandonment_rate
FROM session_events;