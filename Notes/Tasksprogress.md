Add First_Transaction_Date

The First_Transaction_Date column represents the earliest purchase date for each customer. It is created by grouping the dataset by Customer_ID and assigning the minimum Order_Date to every transaction belonging to that customer. This column serves as a reference for identifying when a customer was first acquired and is useful for validating cohort assignments, simplifying SQL queries, and supporting subsequent retention and CLTV analyses.

Add Cohort_Month

The Cohort_Month column is derived from the First_Transaction_Date and represents the month in which each customer made their first transaction. All transactions belonging to the same customer share the same cohort month, regardless of when subsequent purchases occurred. This attribute is fundamental to cohort analysis, as it enables customers to be grouped by acquisition month for calculating retention rates, building cohort matrices, analyzing customer behavior over time, and estimating Customer Lifetime Value (CLTV).