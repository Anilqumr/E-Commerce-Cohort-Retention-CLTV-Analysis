# SaaS-E-Commerce-Cohort-Retention-CLTV-Analysis
test ing
# SaaS / E-Commerce Cohort Retention & CLTV Analysis

## 📌 Project Overview

This project analyzes SaaS/E-Commerce transactional data to understand customer retention, purchasing behavior, customer lifetime value (CLTV), and acquisition-channel performance.

The analysis was completed as part of an internship project covering data cleaning, cohort analysis, CLTV calculation, visualization, and strategic business recommendations.

---

## 🎯 Business Objectives

- Clean and prepare transactional data for analysis
- Analyze customer cohorts and retention rates
- Calculate customer-level revenue and CLTV
- Compare customer value across acquisition channels
- Identify high-performing products and markets
- Analyze monthly revenue trends
- Generate actionable business recommendations

---

## 🗂️ Project Structure

```text
SaaS-E-Commerce-Cohort-Retention-CLTV-Analysis
│
├── Data
│   ├── raw
│   └── cleaned
│
├── Images
│   ├── cohort_retention_heatmap.png
│   ├── cltv_by_acquisition_channel.png
│   ├── monthly_revenue_trend.png
│   ├── revenue_by_product_category.png
│   └── customers_by_country.png
│
├── Notebook
│   └── Week1_Data_Cleaning.ipynb
│
├── SQL
│
└── README.md



### Important

Don't worry that the README says **Week1_Data_Cleaning.ipynb** even though we performed Weeks 2–4 in the same notebook/session. If you want, we can rename/create a final notebook later so the repository looks cleaner.

---

## Step 10 — Save the README

In VS Code:

**Ctrl + S**

Then open the terminal in your project folder.

Run:

```bash
git status

📊 Dataset

The dataset contains 71,772 transaction records with the following fields:

Order ID
Customer ID
Transaction Date
Product Category
Quantity
Unit Price
Revenue
Signup Date
Acquisition Channel
Country

🔎 Project Workflow
Week 1 — Data Cleaning & Wrangling
Loaded the raw transactional dataset
Corrected the CSV formatting issue
Converted dates into datetime format
Converted numerical fields into appropriate data types
Checked data quality
Created customer cohort month
Saved the cleaned dataset

Output:

Data/cleaned/cleaned_transactions.csv


Week 2 — Cohort Retention Analysis

Created:

Order month
Cohort month
Cohort index
Cohort customer counts
Customer retention matrix

The retention matrix was visualized using a heatmap to identify customer retention patterns across cohorts.

Week 3 — Customer Lifetime Value Analysis

Calculated:

Total customer revenue
Total customer orders
Average Order Value (AOV)
Customer lifespan
Active months
Monthly purchase frequency
Historical customer value / CLTV

Customer-level results were saved to:

Data/cleaned/customer_cltv.csv

Acquisition-channel performance was also analyzed.


Week 4 — Visualization & Strategic Insights

Created visualizations for:

Cohort retention
Monthly revenue trends
Revenue by product category
Customer distribution by country
Average CLTV by acquisition channel


📈 Key KPIs

The project calculates:

Total Revenue
Total Customers
Total Orders
Average Order Value
Average CLTV
Average Customer Lifespan
Month 2 Retention Rate


💡 Strategic Recommendations
Customer Retention

Use targeted follow-up campaigns and personalized offers to encourage repeat purchases, especially during the early customer lifecycle.

Acquisition Optimization

Focus marketing investment on acquisition channels that generate higher customer lifetime value while monitoring acquisition costs.

Product Strategy

Prioritize high-revenue product categories through promotions, cross-selling, and inventory planning.

Geographic Strategy

Identify high-customer-volume markets and strengthen customer engagement and retention strategies in those regions.

Revenue Monitoring

Track monthly revenue trends to identify seasonal patterns and periods of strong customer activity.

Churn Reduction

Use cohort retention analysis to identify customers whose activity declines after their initial purchase and target them with retention campaigns.

🛠️ Tools & Technologies
Python
Pandas
NumPy
Matplotlib
Seaborn
Jupyter Notebook
VS Code
Git & GitHub