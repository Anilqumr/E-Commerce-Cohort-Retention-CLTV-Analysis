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

#Count the number of orders in each Transaction Date
SELECT
    transaction_date,
    COUNT(*) AS Total_Orders
FROM cleaned_ecommerce
GROUP BY transaction_date
ORDER BY transaction_date;

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