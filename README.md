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

**Dawn**

Advanced Data Analytics Internship Project

Infotact Solutions

---

# Acknowledgements

This project was developed as part of the **Infotact Solutions Advanced Data Analytics Internship Program**.

The implementation currently covers the first two phases of the engineering roadmap:

- **Week 1:** Transactional Data Cleaning & Wrangling
- **Week 2:** Cohort Retention Matrix Development

The remaining phases will extend the project with **Customer Lifetime Value (CLTV)** analysis, customer segmentation, retention visualizations, and executive business insights.
