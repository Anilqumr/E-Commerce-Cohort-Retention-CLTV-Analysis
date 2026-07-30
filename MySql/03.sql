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

UPDATE cleaned_ecommerce
SET cohort_month_date = STR_TO_DATE(cohort_month, '%Y-%m-%d');