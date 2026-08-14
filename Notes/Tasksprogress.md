27/07/2026

Add First_Transaction_Date

The First_Transaction_Date column represents the earliest purchase date for each customer. It is created by grouping the dataset by Customer_ID and assigning the minimum Order_Date to every transaction belonging to that customer. This column serves as a reference for identifying when a customer was first acquired and is useful for validating cohort assignments, simplifying SQL queries, and supporting subsequent retention and CLTV analyses.

Add Cohort_Month

The Cohort_Month column is derived from the First_Transaction_Date and represents the month in which each customer made their first transaction. All transactions belonging to the same customer share the same cohort month, regardless of when subsequent purchases occurred. This attribute is fundamental to cohort analysis, as it enables customers to be grouped by acquisition month for calculating retention rates, building cohort matrices, analyzing customer behavior over time, and estimating Customer Lifetime Value (CLTV).

Added Cohort Month and First Transaction date into the Cleaned Dataset.

Tasks for 28/07/2026
Recreate Dataset in MySql.


###

# Week 3 – Customer Lifetime Value (CLTV) Calculation

## Overview

Week 3 focuses on measuring **Customer Lifetime Value (CLTV)** and understanding how customer value differs across meaningful customer segments. After completing the transaction cleaning and cohort retention analysis in the previous weeks, this stage shifts the analysis from **customer retention behavior to customer revenue value**.

The primary objective is to determine which customers and customer segments contribute the greatest value based on their historical purchasing behavior. The analysis will use customer-level purchasing information to calculate key financial and behavioral metrics, including **Average Order Value (AOV), Purchase Frequency, and historical CLTV**.

## Customer Segmentation

The first stage of Week 3 will involve segmenting customers into meaningful business groups. The primary segmentation dimensions will include **Acquisition Channel** and **Geographic Region**, where available in the dataset. Other relevant business segments may also be considered if they provide meaningful insights into customer behavior.

Segmentation allows customer value to be analyzed beyond the overall average. By comparing different groups, the analysis can identify whether customers acquired through particular channels or located in specific regions demonstrate stronger purchasing behavior and generate greater historical value.

## Average Order Value (AOV)

The next step will be to calculate **Average Order Value (AOV)**. AOV measures the average revenue generated from each customer order and provides an indication of how much customers typically spend per transaction.

AOV will be calculated at the customer and/or segment level and then compared across different customer groups. This will help determine which segments generate larger transactions and provide a foundation for understanding differences in customer value.

## Purchase Frequency

**Purchase Frequency** will be calculated to measure how often customers make purchases during the available historical period.

Purchase frequency is an important component of customer value because customers who purchase repeatedly can generate substantial revenue even when their individual order values are relatively moderate. Comparing purchase frequency across segments will help identify groups with stronger recurring purchasing behavior.

## Historical Customer Lifetime Value (CLTV)

Using the calculated customer metrics, the analysis will calculate **historical Customer Lifetime Value (CLTV)**. The Week 3 analysis will use observed customer purchasing behavior rather than attempting to predict future customer value.

The CLTV analysis will combine relevant purchasing metrics such as AOV and Purchase Frequency to evaluate the historical revenue contribution of customers and customer segments.

This will provide a more comprehensive measure of customer value than analyzing individual transactions alone.

## CLTV Comparison Across Segments

Once historical CLTV has been calculated, customer segments will be compared to identify differences in customer value.

The analysis will examine questions such as:

- Which acquisition channels generate higher-value customers?
- Which geographic regions have stronger customer value?
- Which segments have higher AOV?
- Which segments have greater purchase frequency?
- Which segments produce the highest historical CLTV?

These comparisons will help identify customer groups that contribute more significantly to the business.

## High-Value and Low-Value Customers

Week 3 will also identify **high-value and low-value customers** based on their historical CLTV.

High-value customers represent customers with comparatively strong historical revenue contribution, while low-value customers represent those with comparatively lower historical value.

Analyzing these groups will help identify differences in purchasing behavior and provide a basis for understanding which customers may require stronger retention or engagement strategies.

## Business Insights

The final stage of Week 3 will translate the calculated metrics into meaningful **business insights**. The analysis will summarize the most valuable customer segments, differences in AOV and Purchase Frequency, CLTV variations, and the characteristics of high- and low-value customers.

The objective is not simply to calculate CLTV but to understand what the results indicate about customer value. These findings will provide a foundation for business decisions related to customer retention, customer segmentation, and prioritization of valuable customer groups.

## Expected Outcome

By the end of Week 3, the project will have established a structured view of customer value by progressing through the following analytical workflow:

**Customer Segmentation → AOV → Purchase Frequency → Historical CLTV → Segment Comparison → High/Low-Value Customer Identification → Business Insights**

The completed analysis will provide the financial and customer-value foundation required for the final visualization and strategic reporting stage in **Week 4**.