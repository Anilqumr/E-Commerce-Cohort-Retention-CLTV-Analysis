WITH FirstPurchase AS (
    -- Get the first purchase date/month for each user
    SELECT 
        customer_id,
        MIN(DATE_FORMAT(transaction_date, '%Y-%m-01')) AS cohort_month
    FROM cleaned_ecommerce
    GROUP BY customer_id
),
UserActivities AS (
    -- Calculate month index between first purchase and subsequent transactions
    SELECT 
        t.customer_id,
        f.Cohort_Month,
        DATE_FORMAT(t.transaction_date, '%Y-%m-01') AS transaction_month,
        PERIOD_DIFF(
            DATE_FORMAT(t.transaction_date, '%Y%m'), 
            DATE_FORMAT(f.Cohort_Month, '%Y%m')
        ) AS cohort_index
    FROM cleaned_ecommerce t
    JOIN FirstPurchase f ON t.customer_id = f.customer_id
)
-- Aggregate unique active users per cohort and index
SELECT 
    cohort_month,
    cohort_index,
    COUNT(DISTINCT customer_id) AS active_users
FROM UserActivities
GROUP BY cohort_month, cohort_index
ORDER BY cohort_month, cohort_index;