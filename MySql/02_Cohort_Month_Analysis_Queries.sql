#Count the number of orders in each Cohort Month
SELECT
    Cohort_Month,
    COUNT(*) AS Total_Orders
FROM cleaned_ecommerce
GROUP BY Cohort_Month
ORDER BY Cohort_Month;

#Count the number of unique customers in each Cohort Month
SELECT
    Cohort_Month,
    COUNT(DISTINCT customer_id) AS Total_Customers
FROM cleaned_ecommerce
GROUP BY Cohort_Month
ORDER BY Cohort_Month;

#Count the number of orders in each Transaction Month
SELECT
    transaction_month_date,
    COUNT(*) AS Total_Orders
FROM cleaned_ecommerce
GROUP BY transaction_month_date
ORDER BY transaction_month_date;

#Total Revenue by Cohort Month
SELECT
    Cohort_Month,
    SUM(revenue) AS Total_Revenue
FROM cleaned_ecommerce
GROUP BY Cohort_Month
ORDER BY Cohort_Month;

/*This query returns, for each Cohort Month:
Number of unique customers
Number of orders
Total revenue
Average order value*/
SELECT
    Cohort_Month,
    COUNT(DISTINCT customer_id) AS Customers,
    COUNT(order_id) AS Orders,
    SUM(revenue) AS Revenue,
    ROUND(AVG(revenue), 2) AS Avg_Order_Value
FROM cleaned_ecommerce
GROUP BY Cohort_Month
ORDER BY Cohort_Month;

#Calculate the number of months since first purchase. **
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