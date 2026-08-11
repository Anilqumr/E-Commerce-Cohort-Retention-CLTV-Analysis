#Create Cohort Index (Month 0, Month 1, Month 2, ...). **

#Created Cohort month Date
ALTER TABLE cleaned_ecommerce
ADD COLUMN cohort_month_date DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE cleaned_ecommerce
SET cohort_month_date = STR_TO_DATE(CONCAT(cohort_month, '-01'), '%Y-%m-%d');

#Created Cohort index
ALTER TABLE cleaned_ecommerce
ADD COLUMN cohort_index INT;

UPDATE cleaned_ecommerce
SET cohort_index = TIMESTAMPDIFF(
    MONTH,
    cohort_month_date,
    transaction_date
);

#Creating Transaction month Date
ALTER TABLE cleaned_ecommerce
ADD COLUMN transaction_month_date DATE;

UPDATE cleaned_ecommerce
set transaction_month_date= STR_TO_DATE(DATE_FORMAT(transaction_date, '%Y-%m-01'), '%Y-%m-%d');

SET SQL_SAFE_UPDATES = 1;

#Verifying Created Columns
SELECT
    customer_id,
    cohort_month_date,
    transaction_date,
    cohort_index
FROM cleaned_ecommerce
ORDER BY customer_id, transaction_date
LIMIT 20;