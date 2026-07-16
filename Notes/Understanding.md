# E-Commerce Transactions Dataset

A synthetic, transaction-level e-commerce dataset covering **71,772 orders** from **19,076 customers** across **6 countries**, spanning **January 2023 – December 2024**. It is well-suited for customer analytics, cohort/RFM analysis, revenue forecasting, and marketing-channel attribution projects.

## Dataset Summary

| Metric | Value |
|---|---|
| Rows (orders) | 71,772 |
| Unique customers | 19,076 |
| Date range | 2023-01-09 → 2024-12-31 |
| Total revenue | $23,262,360.66 |
| Average order value | $324.11 |
| Missing values | None (0 across all columns) |
| Duplicate order IDs | None |

## Schema

| Column | Type | Description |
|---|---|---|
| `order_id` | string | Unique identifier for each transaction (e.g. `ORD0000001`) |
| `customer_id` | string | Unique identifier for each customer (e.g. `CUST000001`) |
| `transaction_date` | date | Date the order was placed |
| `product_category` | categorical | One of 6 categories (see below) |
| `quantity` | integer | Units purchased in the order (range: 1–4) |
| `unit_price` | float | Price per unit ($10.14–$249.99) |
| `revenue` | float | Order total; verified to equal `quantity × unit_price` for all 71,772 rows |
| `signup_date` | date | Date the customer originally registered |
| `acquisition_channel` | categorical | Marketing channel that acquired the customer (7 values) |
| `country` | categorical | Customer's country (6 values) |

## Categorical Breakdown

**Product categories** (near-even split, ~11.7K–12.1K orders each): Fashion, Sports, Home, Electronics, Beauty, Books.

**Countries**: Australia, Germany, Canada, USA, France, UK — each contributing roughly 16–17% of orders.

**Acquisition channels**: Instagram, Direct, Referral, Organic Search, Google Ads, Facebook Ads, Email — fairly evenly distributed, with Instagram slightly leading in both order count (10,682) and revenue ($3.46M).

## Key Observations

- **Revenue is evenly distributed across dimensions.** No single product category, country, or acquisition channel dominates — each category/country/channel contributes within a narrow band of the total, suggesting the data was generated with balanced allocation rather than reflecting typical real-world skew (e.g., Pareto-driven customer concentration).
- **Customer purchase frequency**: customers place a median of 3 orders (mean 3.76, max 22), indicating a repeat-purchase customer base rather than one-off buyers.
- **Customer lifetime value**: median revenue per customer is $895.89 (mean $1,219.46, max $8,434.19).
- **Revenue integrity**: `revenue` reconciles exactly with `quantity × unit_price` for every row — no computed-field errors.
- **Growth trend**: monthly revenue rises steadily from ~$62K (Jan 2023, partial month) to a stable plateau of ~$1.1M–$1.27M per month from late 2023 onward, consistent with a maturing customer base rather than seasonal spikes.
- **No missing or null values** in any column, and no duplicate `order_id` values — the dataset is clean and analysis-ready out of the box.

## Suggested Use Cases

- Cohort retention and repeat-purchase analysis (using `signup_date` vs `transaction_date`)
- RFM (Recency, Frequency, Monetary) customer segmentation
- Marketing channel ROI / attribution comparisons
- Revenue and demand forecasting (monthly/quarterly trends)
- Category and geographic performance dashboards

## Data Quality Notes

- All dates are stored as `YYYY-MM-DD` strings and should be parsed to datetime before time-based analysis.
- `signup_date` always precedes or equals the first `transaction_date` for a given customer, consistent with a valid signup-then-purchase funnel.
- No currency symbol is included in price/revenue fields; assume a single currency (e.g., USD) unless otherwise specified.

---
*This README was generated from a direct profiling of the CSV (row counts, dtypes, null checks, groupby aggregations, and a full revenue-formula validation across all rows).*