/*
Calculate:
Absolute retained users
Retention percentage
Verify retention calculations.
Export the retention matrix.
*/
WITH cohort_counts AS (
    SELECT
        cohort_month_date,
        cohort_index,
        COUNT(DISTINCT customer_id) AS retained_users
    FROM cleaned_ecommerce
    GROUP BY cohort_month_date, cohort_index
),
cohort_size AS (
    SELECT
        cohort_month_date,
        retained_users AS cohort_size
    FROM cohort_counts
    WHERE cohort_index = 0
)

SELECT
    c.cohort_month_date,
    c.cohort_index,
    c.retained_users,
    ROUND((c.retained_users * 100.0) / s.cohort_size, 2) AS retention_percentage
FROM cohort_counts c
JOIN cohort_size s
    ON c.cohort_month_date = s.cohort_month_date
ORDER BY c.cohort_month_date, c.cohort_index
;