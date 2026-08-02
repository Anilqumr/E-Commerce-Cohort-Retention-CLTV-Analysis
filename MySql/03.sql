SELECT
    customer_id,
    transaction_date,
    cohort_month,
    TIMESTAMPDIFF(
        MONTH,
        STR_TO_DATE(CONCAT(cohort_month, '-01'), '%Y-%m-%d'),
        transaction_date
    ) AS months_since_first_purchase
FROM cleaned_ecommerce;


ALTER TABLE cleaned_ecommerce
ADD COLUMN cohort_month_date DATE;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE cleaned_ecommerce
ADD COLUMN cohort_month_date DATE;

UPDATE cleaned_ecommerce
SET cohort_month_date = STR_TO_DATE(CONCAT(cohort_month, '-01'), '%Y-%m-%d');

ALTER TABLE cleaned_ecommerce
ADD COLUMN cohort_index INT;

UPDATE cleaned_ecommerce
SET cohort_index = TIMESTAMPDIFF(
    MONTH,
    cohort_month_date,
    transaction_date
);

SET SQL_SAFE_UPDATES = 1;

SELECT
    customer_id,
    cohort_month_date,
    transaction_date,
    cohort_index
FROM cleaned_ecommerce
ORDER BY customer_id, transaction_date
LIMIT 20;