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

#Build and Export the retention matrix.
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
    c.cohort_month_date AS Cohort_Month,
    ROUND(100 * SUM(CASE WHEN cohort_index = 0 THEN retained_users END) / s.cohort_size, 2) AS Month_0,
    ROUND(100 * SUM(CASE WHEN cohort_index = 1 THEN retained_users END) / s.cohort_size, 2) AS Month_1,
    ROUND(100 * SUM(CASE WHEN cohort_index = 2 THEN retained_users END) / s.cohort_size, 2) AS Month_2,
    ROUND(100 * SUM(CASE WHEN cohort_index = 3 THEN retained_users END) / s.cohort_size, 2) AS Month_3,
    ROUND(100 * SUM(CASE WHEN cohort_index = 4 THEN retained_users END) / s.cohort_size, 2) AS Month_4,
    ROUND(100 * SUM(CASE WHEN cohort_index = 5 THEN retained_users END) / s.cohort_size, 2) AS Month_5,
    ROUND(100 * SUM(CASE WHEN cohort_index = 6 THEN retained_users END) / s.cohort_size, 2) AS Month_6,
    ROUND(100 * SUM(CASE WHEN cohort_index = 7 THEN retained_users END) / s.cohort_size, 2) AS Month_7,
    ROUND(100 * SUM(CASE WHEN cohort_index = 8 THEN retained_users END) / s.cohort_size, 2) AS Month_8,
    ROUND(100 * SUM(CASE WHEN cohort_index = 9 THEN retained_users END) / s.cohort_size, 2) AS Month_9,
    ROUND(100 * SUM(CASE WHEN cohort_index = 10 THEN retained_users END) / s.cohort_size, 2) AS Month_10,
    ROUND(100 * SUM(CASE WHEN cohort_index = 11 THEN retained_users END) / s.cohort_size, 2) AS Month_11,
    ROUND(100 * SUM(CASE WHEN cohort_index = 12 THEN retained_users END) / s.cohort_size, 2) AS Month_12
FROM cohort_counts c
JOIN cohort_size s
    ON c.cohort_month_date = s.cohort_month_date
GROUP BY c.cohort_month_date, s.cohort_size
ORDER BY c.cohort_month_date;