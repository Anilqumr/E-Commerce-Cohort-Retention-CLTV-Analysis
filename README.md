# SaaS / E-Commerce Cohort Retention & Customer Lifetime Value (CLTV) Analysis

> An end-to-end data analytics project that cleans raw transactional data, performs cohort retention analysis, and builds the analytical foundation for Customer Lifetime Value (CLTV) using **Python (Pandas)** and **MySQL**.

---

## 📖 Table of Contents

- [Project Overview](#project-overview)
- [Business Problem](#business-problem)
- [Project Objectives](#project-objectives)
- [Dataset Information](#dataset-information)
- [Technology Stack](#technology-stack)
- [Project Workflow](#project-workflow)
- [Week 1 – Data Cleaning & Wrangling](#week-1--transactional-data-cleaning--wrangling)
- [Week 2 – Building the Cohort Retention Matrix](#week-2--building-the-cohort-retention-matrix)
- [SQL Concepts Used](#sql-concepts-used)
- [Cohort Analysis Methodology](#cohort-analysis-methodology)
- [Key Metrics Calculated](#key-metrics-calculated)
- [Project Structure](#project-structure)
- [Current Progress](#current-progress)
- [Future Enhancements](#future-enhancements)
- [Business Impact](#business-impact)
- [Repository Contents](#repository-contents)
- [Author](#author)
- [Acknowledgements](#acknowledgements)

---

# Project Overview

Customer retention is one of the strongest indicators of sustainable business growth. While customer acquisition often receives significant investment, retaining existing customers is considerably more cost-effective and directly contributes to long-term profitability.

This project performs an end-to-end **Cohort Retention Analysis** using a transactional e-commerce dataset. The project begins with cleaning and transforming raw transactional data using **Python (Pandas)** and continues with **MySQL-based cohort analysis** to measure customer retention across multiple months.

The analytical pipeline developed in this project establishes a strong foundation for future **Customer Lifetime Value (CLTV)** analysis and business intelligence reporting.

---

# Business Problem

Many businesses successfully acquire new customers but struggle to understand whether those customers continue making purchases over time.

Without cohort analysis, organizations cannot easily answer questions such as:

- Which customer groups are retained the longest?
- At what point do customers begin to churn?
- Which acquisition months produce the highest retention?
- How quickly does customer retention decline over time?

Cohort Analysis addresses these questions by grouping customers according to the month of their first purchase and tracking their activity over subsequent months.

---

# Project Objectives

The objectives of this project are to:

- Clean and validate raw transactional data.
- Remove invalid or unsuccessful transactions.
- Prepare a standardized dataset for analysis.
- Assign every customer to a Cohort Month.
- Build a Cohort Retention Matrix.
- Measure customer retention over time.
- Calculate key business metrics including:
  - Unique Customers
  - Number of Orders
  - Total Revenue
  - Average Order Value (AOV)
  - Absolute Retained Users
  - Retention Percentage
- Prepare data for future CLTV analysis and visualization.

---

# Dataset Information

| Attribute | Value |
|-----------|-------|
| Dataset Type | Synthetic E-Commerce Transactions |
| Total Orders | 71,772 |
| Customers | 19,076 |
| Countries | 6 |
| Time Period | January 2023 – December 2024 |

---

# Technology Stack

## Programming & Analysis

- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook

## Database

- MySQL
- MySQL Workbench

## Version Control

- Git
- GitHub

---

# Project Workflow

```text
Raw Dataset
      │
      ▼
Data Cleaning (Python)
      │
      ▼
Cleaned Dataset
      │
      ▼
Import into MySQL
      │
      ▼
Assign Cohort Month
      │
      ▼
Calculate Cohort Index
      │
      ▼
Build Retention Matrix
      │
      ▼
Business Insights
```

---

# Week 1 – Transactional Data Cleaning & Wrangling

## Goal

Prepare a clean transactional dataset suitable for cohort analysis.

## Tasks Completed

- Imported the raw transactional dataset into Pandas.
- Inspected the dataset structure.
- Performed Exploratory Data Analysis (EDA).
- Filtered refunded transactions.
- Filtered failed transactions.
- Removed records with missing Customer IDs.
- Standardized data values and formats.
- Converted transaction dates into proper datetime format.
- Calculated the first purchase month for every customer.
- Assigned every customer to their Cohort Month.
- Validated the cleaned dataset.
- Exported the cleaned dataset for further analysis.

---

## Data Cleaning Pipeline

The cleaning workflow consisted of:

- Missing value analysis
- Duplicate validation
- Transaction status filtering
- Datetime conversion
- Cohort month calculation
- Data validation
- Final dataset export

The cleaned dataset serves as the foundation for all subsequent analyses.

---

# Week 2 – Building the Cohort Retention Matrix

## Goal

Create cohort tables that measure customer retention across multiple months.

## Tasks Completed

### Grouped Data By

- Cohort Month
- Transaction Month

### Calculated

- Months Since First Purchase
- Cohort Index (Month 0, Month 1, Month 2, ...)

### Business Metrics

- Number of Unique Customers
- Number of Orders
- Total Revenue
- Average Order Value (AOV)

### Built

- Cohort Retention Matrix

### Retention Metrics

- Absolute Retained Users
- Retention Percentage

### Validation

- Verified all retention calculations.
- Exported the final retention matrix.

---

# SQL Concepts Used

The following SQL concepts were used throughout the cohort analysis:

- ALTER TABLE
- UPDATE
- GROUP BY
- COUNT(DISTINCT)
- SUM()
- AVG()
- MIN()
- DATE_FORMAT()
- STR_TO_DATE()
- TIMESTAMPDIFF()
- ORDER BY

---

# Cohort Analysis Methodology

### Step 1

Determine the first purchase date for each customer.

↓

### Step 2

Assign each customer to a Cohort Month.

↓

### Step 3

Determine the Transaction Month.

↓

### Step 4

Calculate the Cohort Index.

```text
Month 0
Month 1
Month 2
Month 3
Month 4
...
```

↓

### Step 5

Count retained customers for every cohort.

↓

### Step 6

Calculate monthly retention percentages.

---

# Key Metrics Calculated

## Customer Metrics

- Total Customers
- Active Customers
- Retained Customers

## Revenue Metrics

- Total Revenue
- Revenue by Cohort

## Order Metrics

- Number of Orders
- Average Order Value (AOV)

## Retention Metrics

- Cohort Size
- Absolute Retention
- Retention Percentage

---

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

---

# Project Structure

```text
SaaS-E-Commerce-Cohort-Retention-CLTV-Analysis/
│
├── Data/
│   ├── Raw/
│   └── Cleaned/
│
├── Notebooks/
│   └── Transforming_Dataset.ipynb
│
├── SQL/
│   ├── Cohort_Queries.sql
│   ├── Cohort_Index.sql
│   └── Retention_Matrix.sql
│
├── Outputs/
│   ├── Cleaned_Ecommerce.csv
│   ├── Retention_Matrix.csv
│   └── Screenshots/
│
├── README.md
│
└── LICENSE
```

---

# Current Progress

| Phase | Status |
|--------|--------|
| Week 1 – Data Cleaning | ✅ Completed |
| Week 2 – Cohort Analysis | ✅ Completed |
| Week 3 – CLTV Analysis | ⏳ In Progress |
| Week 4 – Visualization & Insights | ⏳ Pending |

---

# Future Enhancements

The following features will be added in the remaining project phases:

- Customer Lifetime Value (CLTV)
- Purchase Frequency Analysis
- Customer Segmentation
- Historical CLTV Calculation
- Retention Heatmap
- Retention Decay Curve
- Business Dashboard
- Executive Insights
- Strategic Recommendations

---

# Business Impact

The completed analysis enables businesses to:

- Understand customer retention behavior.
- Identify high-retention acquisition cohorts.
- Detect customer churn trends.
- Measure customer loyalty.
- Improve retention strategies.
- Support revenue forecasting.
- Build the foundation for Customer Lifetime Value (CLTV) analysis.

---

# Repository Contents

This repository contains:

- Python notebooks for data cleaning
- SQL scripts for cohort analysis
- Cleaned transactional dataset
- Cohort retention matrix
- Project documentation
- SQL queries
- Supporting screenshots

---

# Author

**Anil Kumar Pyarasani**

LinkedIN --  https://www.linkedin.com/in/pyarasani-anil-kumar

Git Hub  --  https://github.com/Anilqumr

E-mail   --  Anilqumr@gmail.com
---

# Acknowledgements

The implementation currently covers the first two phases of the engineering roadmap:

- **Week 1:** Transactional Data Cleaning & Wrangling
- **Week 2:** Cohort Retention Matrix Development

The remaining phases will extend the project with **Customer Lifetime Value (CLTV)** analysis, customer segmentation, retention visualizations, and executive business insights.
