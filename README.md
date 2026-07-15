# SQL For Product

Various projects using SQL (and dbt) for Product Analysis and Product Management

## [TheLook Product Insights](https://github.com/cbonnin88/SQL-for-Product/tree/main/theLook_ecommerce_queries)
**Description:** A BigQuery SQL project that extracts and analyzes core e-commerce metrics to drive data-informed product management decisions.

**Tools:** BigQuery, Google Cloud Platform

**Key Implementations:**
- **Data Source:** Queries Google's public thelook_ecommerce dataset, seamlessly joining user, event, and transactional tables without the need for manual data loading.
- **Metric Calculation:** Calculating 10 critical product KPIs, mathematically translating raw data into metrics like Session-to-Order Conversion, Cart Abandonment Rate, and Customer Lifetime Value (LTV).
- **Actionable Output:** The queries generate clear, aggregated tables designed to immediately highlight user friction, identify top-grossing categories, and inform feature prioritization during product strategy meetings.


## [ChargeRoute:](https://datastudio.google.com/s/r6JiiduhnF4) End-to-End Product Analytics Pipeline
**Description:** A BigQuery and dbt SQL project that extracts and analyzes core EV charging application metrics to drive data-informed product management decisions.

**Tools:** Fivetran, Google Cloud Storage, Google BigQuery, dbt Cloud, Looker Studio

**Key Implementations:**
- **Data Source:** Ingests raw telemetry data (users, trips, stations, charge_events) from Google Cloud Storage using Fivetran, seamlessly cleaning and joining them in BigQuery via dbt without the need for manual data loading.
- **Metric Calculation:** Calculating 10 critical product KPIs, mathematically translating raw data into metrics like Monthly Active Users (MAU), Charge Success Rate, and Average Revenue Per User (ARPU).
- **Actionable Output:** The queries and dbt models generate clear, aggregated fact tables designed to immediately highlight user friction (failed charges), identify top-grossing stations, and inform feature prioritization during product strategy meetings via an interactive Looker Studio dashboard.
