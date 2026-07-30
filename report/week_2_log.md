# Week 2 Project Log

## Project

**SaaS/E-Commerce Cohort Retention & Customer Lifetime Value (CLTV) Analysis**

**Week:** 2

**Focus:** Building the Cohort Retention Matrix

**Duration:** Week 2

---

# Objectives

The primary objective of Week 2 was to transform the cleaned transactional dataset into a cohort retention matrix using Python. This involved grouping customers into acquisition cohorts based on their first transaction month, calculating the time elapsed between their first and subsequent purchases, and measuring customer retention over successive months.

The resulting cohort matrix provides a clear view of customer retention behavior and serves as the foundation for Customer Lifetime Value (CLTV) analysis in the following weeks.

---

# Dataset Used

**Input File**

`data/cleaned/cleaned_transactions.csv`

The cleaned dataset produced during Week 1 contained validated customer transactions and the necessary variables for cohort analysis.

---

# Tasks Completed

## 1. Loaded the Cleaned Dataset

The cleaned transactional dataset generated during Week 1 was imported into a new Jupyter Notebook (`02_cohort_analysis.ipynb`) using the Pandas library. Date columns were parsed into datetime objects to support time-based calculations.

**Status:** Completed

---

## 2. Verified Dataset Integrity

The dataset was inspected to ensure that all required fields were present before beginning the cohort analysis.

Validation checks included:

* Dataset dimensions
* Data types
* Customer ID consistency
* Transaction date formatting

**Status:** Completed

---

## 3. Created Transaction Month

A new variable, **Transaction Month**, was derived from the transaction date by extracting the year and month of each purchase.

This standardized the transaction timeline and prepared the data for monthly cohort grouping.

**Status:** Completed

---

## 4. Calculated Cohort Month

Each customer was assigned a **Cohort Month**, representing the month of their first recorded purchase.

This was achieved by grouping transactions by customer ID and selecting the earliest transaction date for each customer.

The Cohort Month serves as the customer's acquisition period throughout the analysis.

**Status:** Completed

---

## 5. Calculated the Cohort Index

A **Cohort Index** was calculated to measure the number of months elapsed since each customer's first purchase.

For example:

| Cohort Month | Transaction Month | Cohort Index |
| ------------ | ----------------- | ------------ |
| January 2024 | January 2024      | 1            |
| January 2024 | February 2024     | 2            |
| January 2024 | March 2024        | 3            |

The Cohort Index enables retention to be measured consistently across all customer cohorts.

**Status:** Completed

---

## 6. Built the Cohort Matrix

Using the `groupby()` function, the dataset was grouped by:

* Cohort Month
* Cohort Index

The number of unique customers active during each month was calculated using `nunique()`.

The grouped data was then reshaped into a cohort matrix using `pivot_table()`, where:

* Rows represent acquisition cohorts.
* Columns represent the number of months since acquisition.
* Values represent the number of retained customers.

**Status:** Completed

---

## 7. Calculated Customer Retention Rates

Monthly retention percentages were calculated by dividing the number of retained customers in each cohort by the total number of customers acquired during Month 1.

This normalized the cohort sizes and enabled meaningful comparisons between customer groups.

**Status:** Completed

---

## 8. Generated the Retention Heatmap

A cohort retention heatmap was created using Seaborn to visualize customer retention patterns across acquisition cohorts.

The heatmap highlights:

* Cohorts with strong customer retention
* Periods with the greatest customer churn
* Overall retention trends over time

The visualization was saved for inclusion in the project report and GitHub repository.

**Status:** Completed

---

# Challenges Encountered

### Challenge 1: Calculating the Cohort Index

Determining the number of months between each customer's first purchase and subsequent transactions required careful handling of datetime values.

**Resolution**

The transaction month and cohort month were converted into monthly periods, and the month difference was calculated using year and month components to generate an accurate Cohort Index.

---

### Challenge 2: Unequal Cohort Sizes

Different acquisition months contained different numbers of new customers.

**Resolution**

Retention percentages were calculated by dividing each cohort by its initial customer count (Month 1), allowing retention performance to be compared regardless of cohort size.

---

# Outputs Generated

The following files were successfully created during Week 2:

```
outputs/
├── cohort_matrix.csv
└── retention_matrix.csv

visuals/
└── retention_heatmap.png

notebooks/
└── 02_cohort_analysis.ipynb
```

---

# Skills Demonstrated

During Week 2, the following technical skills were applied:

* Python Programming
* Pandas Data Manipulation
* GroupBy Operations
* Pivot Table Creation
* Datetime Feature Engineering
* Customer Cohort Analysis
* Customer Retention Analysis
* Seaborn Data Visualization
* Business Analytics

---

# Key Findings

The cohort analysis provided valuable insights into customer retention behavior.

Key observations include:

* Customer retention decreases as the number of months since acquisition increases.
* The highest customer retention occurs during the acquisition month (Month 1).
* Customer churn becomes more noticeable in later months.
* Retention rates vary across acquisition cohorts, suggesting differences in customer engagement over time.

*(Replace these observations with the specific findings from your retention matrix once your analysis is complete.)*

---

# Deliverables

The following Week 2 deliverables were completed:

* Cohort Month calculation
* Cohort Index calculation
* Cohort Matrix
* Customer Retention Matrix
* Retention Heatmap
* Cohort Analysis Notebook
* Week 2 Project Log

---

# Business Value

The cohort retention matrix provides management with a clear understanding of customer retention trends over time.

These insights can be used to:

* Identify periods with the highest customer churn.
* Evaluate the effectiveness of customer acquisition strategies.
* Design targeted customer retention campaigns.
* Improve customer engagement initiatives.
* Support Customer Lifetime Value (CLTV) estimation and revenue forecasting.

---

# Week 2 Summary

Week 2 successfully transformed the cleaned transactional dataset into an analytical framework for customer retention analysis. Cohort analysis techniques were implemented using Pandas' `groupby()` and `pivot_table()` functions to construct both absolute and percentage retention matrices. A retention heatmap was produced to visualize customer behavior across acquisition cohorts, providing valuable insights into churn patterns and customer loyalty.

The outputs generated during this stage establish the foundation for Week 3, where Customer Lifetime Value (CLTV) metrics will be calculated and customer segments will be analyzed to support strategic business decision-making.

---

# Next Steps (Week 3)

The objectives for Week 3 include:

* Calculate Average Order Value (AOV).
* Calculate Purchase Frequency.
* Estimate historical Customer Lifetime Value (CLTV).
* Segment customers by acquisition channel and geographic region.
* Compare high-value and low-value customer segments.
* Generate CLTV summaries and supporting visualizations.
