Week 1 – Transactional Data Cleaning and Wrangling

Goal: Prepare a clean dataset suitable for cohort analysis.(Used Python Notebook(Pandas, MatplotLib, EDA).)

Tasks
Acquire/import the raw transactional dataset. **
Load the dataset into Python (Pandas).**
Inspect the dataset structure.**
Filter out: 
Refunded transactions **
Failed transactions**
Handle missing User IDs.**
Clean and standardize data.**
Convert transaction dates into proper datetime format.**
Calculate the Cohort Month (month of each customer's first transaction).**
Assign every customer to their cohort.**
Validate cleaned dataset.**
Save the cleaned dataset for further analysis.**


Week 2 – Building the Cohort Retention Matrix

Goal: Create cohort tables showing customer retention over time(Used MySql for Cohort Rentention Matrix).

Tasks
Group data by:
Cohort Month **
Transaction Month **
Calculate the number of months since first purchase. **
Create Cohort Index (Month 0, Month 1, Month 2, ...). **

Calculate:
Number of unique customers**
Number of orders**
Total revenue**
Average order value**

Use:
groupby()
pivot_table()
or SQL Pivot techniques.
Build the Cohort Retention Matrix.   **

Calculate:
Absolute retained users**
Retention percentage**
Verify retention calculations.**
Export the retention matrix. **


Week 3 – Customer Lifetime Value (CLTV) Calculation

Goal: Measure customer value across different segment       s.

Tasks
Segment customers based on:
Acquisition Channel
Geographic Region
(or any meaningful business segment)

Calculate:
Average Order Value (AOV)
Purchase Frequency

Calculate historical Customer Lifetime Value (CLTV).

Compare CLTV across different customer segments.

Identify:
High-value customers
Low-value customers

Summarize business insights from CLTV analysis.


Week 4 – Visualization and Strategic Insights

Goal: Present findings through visualizations and business recommendations.

Tasks
Create a Cohort Retention Heatmap.
Plot Retention Decay Curves (line charts).
Use:
Seaborn
Matplotlib
or a BI tool.
Analyze customer retention trends.
Interpret churn patterns.
Write business recommendations.
Prepare a detailed README including:
Project overview
Methodology
Retention analysis
CLTV analysis
Business implications

Example recommendation:

"Retention drops by 40% in Month 2; recommend implementing an automated re-engagement email sequence."

Finalize the GitHub repository.
Complete Project Task Checklist
Week 1
 Import dataset
 Explore data
 Remove refunded transactions
 Remove failed transactions
 Handle missing User IDs
 Clean dataset
 Convert dates
 Calculate Cohort Month
 Save cleaned data
Week 2
 Calculate transaction month
 Calculate Cohort Index
 Group data
 Create pivot table
 Build retention matrix
 Calculate retained users
 Calculate retention %
 Validate results
Week 3
 Segment customers
 Calculate AOV
 Calculate Purchase Frequency
 Calculate CLTV
 Compare customer segments
 Identify high-value customers
 Generate business insights
Week 4
 Create retention heatmap
 Create retention curve
 Analyze churn
 Write business recommendations
 Prepare README
 Finalize GitHub repository
 Submit project
GitHub Requirements (Mandatory Throughout All 4 Weeks)

These apply across the entire project, not just a specific week.

Create a GitHub Project (Kanban board) with To Do, In Progress, and Done columns.
Break the roadmap into individual GitHub Issues.
Commit code frequently (3–5 commits per active development day).
Use semantic commit messages that reference issues (e.g., fixes #3).
Clear Jupyter Notebook outputs (or use nbstripout) before committing.
Use a .gitignore from Day 1 to exclude datasets, database files, API keys, and credentials.
Do not upload raw data files to GitHub; instead, provide dataset access instructions or a download link in the README.md.
Maintain consistent commits across all four weeks, as evaluation requires visible week-by-week GitHub contributions.




Delete this later

For Week 3, a hybrid toolchain is recommended: use MySQL (SQL) for heavy data processing and aggregation, Python (Pandas/NumPy) for flexible analysis and reporting in a notebook, and Power BI for the final dashboard. MySQL excels at high-performance grouping and aggregation on large tables, while Python offers advanced analytics, reproducibility, and easy scripting of custom logic. Power Query (M) is useful for simple ETL but struggles with very large datasets and complex logic, whereas Power BI provides rich visualization but has model-size limits (1 GB on Pro, 10 GB on Premium).

We recommend continuing the existing pipeline: keep the cleaned e-commerce data in MySQL (as used in Week 2) for SQL-based calculations, pull results into Python for verification and segmentation, and finally present insights in Power BI. This combines the best of each tool: SQL for scalable segmentation and metric calculation, Python for analysis scripts and documentable notebooks, and Power BI for interactive visual storytelling.