WITH source AS (
    SELECT * FROM {{source('chargeroute_raw','users')}}
)

SELECT 
    CAST(user_id AS INT64) AS user_id,
    CAST(signup_date AS TIMESTAMP) AS signup_at,
    CAST(country AS STRING) AS country,
    CAST(gender AS STRING) AS gender,
    CAST(age AS INT64) AS age,
    CAST(subscription_tier AS STING) AS subscription_tier,
    CAST(subscription_price AS FLOAT64) AS subscription_price_eur
FROM source