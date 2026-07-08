# SQL For Product

Various projects using SQL (and dbt) for Product Analysis and Product Management

## TheLook Product Insights
**Description:** A BigQuery SQL project that extracts and analyzes core e-commerce metrics to drive data-informed product management decisions.

**Tools:** BigQuery, Google Cloud Platform

**Key Implementations:**
- **Data Source:** Queries Google's public thelook_ecommerce dataset, seamlessly joining user, event, and transactional tables without the need for manual data loading.
- **Metric Calculation:** Calculating 10 critical product KPIs, mathematically translating raw data into metrics like Session-to-Order Conversion, Cart Abandonment Rate, and Customer Lifetime Value (LTV).
- **Actionable Output:** The queries generate clear, aggregated tables designed to immediately highlight user friction, identify top-grossing categories, and inform feature prioritization during product strategy meetings.
