# Week 1 Project Log

## Project
SaaS/E-Commerce Cohort Retention & Customer Lifetime Value (CLTV) Analysis

**Week:** 1

**Focus:** Transactional Data Cleaning and Wrangling

**Duration:** Week 1

---

## Objectives

The objectives for Week 1 were to:

- Load the raw transactional dataset into Python.
- Assess the overall quality of the dataset.
- Handle missing values and duplicate records.
- Convert date columns to datetime format.
- Engineer new features required for cohort analysis.
- Calculate each customer's Cohort Month.
- Save a cleaned dataset for subsequent analysis.

---

## Dataset Overview

Dataset Name: Ecommerce_Dataset.csv

Number of Records: [71772]

Number of Columns: [10]

Key Variables:

- order_id
- customer_id
- transaction_date
- product_category
- quantity
- unit_price
- revenue
- signup_date
- acquisition_channel
- country

---

## Tasks Completed

### 1. Dataset Ingestion

- Imported the dataset using Pandas.
- Loaded the dataset into a DataFrame.
- Verified successful import.

Status: Completed

---

### 2. Dataset Inspection

Performed the following inspections:

- Dataset dimensions
- Data types
- Summary statistics
- Missing values
- Duplicate records

Status: Completed

---

### 3. Missing Value Assessment

Checked every column for missing values.

Findings:

- No missing values were detected.

Action Taken:

- No rows required removal due to missing values.

Status: Completed

---

### 4. Customer ID Validation

Inspected the customer_id column.

Findings:

- No missing customer IDs were found.

Action Taken:

- Retained all customer records.

Status: Completed

---

### 5. Duplicate Check

Checked for duplicate transactions.

Findings:

- [0] duplicate records found.

Action Taken:

- no records were dropped because there were no duplicates`.

Status: Completed

---

### 6. Transaction Status Assessment

Project Requirement:

Filter refunded or failed transactions.

Dataset Assessment:

The dataset does not contain a transaction status column (e.g., Completed, Refunded, Cancelled, Failed).

Action Taken:

Documented this limitation. All available transactions were treated as valid completed transactions.

Status: Completed

---

### 7. Date Conversion

Converted the following columns to datetime format:

- transaction_date
- signup_date

Status: Completed

---

### 8. Feature Engineering

Created the following variables:

- transaction_month
- transaction Year
- transaction Month Number
- day of week
- quarter
- cohort_month

These variables will be used to generate the retention matrix during Week 2.

Status: Completed

---

### 9. Export Clean Dataset

Saved the cleaned dataset to:

data/cleaned/cleaned_transactions.csv

Status: Completed

---

## Challenges Encountered

### Challenge 1

The internship specification required filtering refunded or failed transactions.

Issue:

The provided dataset does not contain a transaction status field.

Resolution:

Documented the limitation and continued the analysis using all available completed transactions.

---

## Deliverables

Completed deliverables include:

- Cleaned transaction dataset
- Data cleaning notebook
- Feature engineered dataset
- Cohort Month calculation
- Week 1 project log

---

## Skills Demonstrated

- Python
- Pandas
- Data Cleaning
- Feature Engineering
- Datetime Manipulation
- Data Validation

---

## Files Produced

data/cleaned/cleaned_transactions.csv

notebooks/01_data_cleaning.ipynb

reports/week1_project_log.md

---

## Week 1 Summary

The Week 1 objectives were successfully completed. The transactional dataset was cleaned, validated, and transformed into an analysis-ready format. New cohort-related features were engineered to support the cohort retention analysis planned for Week 2. Although the dataset did not include transaction status information required to filter refunded or failed transactions, this limitation was documented and did not prevent completion of the core preprocessing tasks.

---

## Next Steps (Week 2)

- Assign customers to acquisition cohorts.
- Calculate the Cohort Index.
- Build the cohort retention matrix.
- Compute monthly retention rates.
- Create the cohort retention heatmap.