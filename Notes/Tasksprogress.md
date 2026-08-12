27/07/2026

Add First_Transaction_Date

The First_Transaction_Date column represents the earliest purchase date for each customer. It is created by grouping the dataset by Customer_ID and assigning the minimum Order_Date to every transaction belonging to that customer. This column serves as a reference for identifying when a customer was first acquired and is useful for validating cohort assignments, simplifying SQL queries, and supporting subsequent retention and CLTV analyses.

Add Cohort_Month

The Cohort_Month column is derived from the First_Transaction_Date and represents the month in which each customer made their first transaction. All transactions belonging to the same customer share the same cohort month, regardless of when subsequent purchases occurred. This attribute is fundamental to cohort analysis, as it enables customers to be grouped by acquisition month for calculating retention rates, building cohort matrices, analyzing customer behavior over time, and estimating Customer Lifetime Value (CLTV).

Added Cohort Month and First Transaction date into the Cleaned Dataset.

Tasks for 28/07/2026
Recreate Dataset in MySql.


###

Executive Summary
For Week 3, a hybrid toolchain is recommended: use MySQL (SQL) for heavy data processing and aggregation, Python (Pandas/NumPy) for flexible analysis and reporting in a notebook, and Power BI for the final dashboard. MySQL excels at high-performance grouping and aggregation on large tables, while Python offers advanced analytics, reproducibility, and easy scripting of custom logic. Power Query (M) is useful for simple ETL but struggles with very large datasets and complex logic, whereas Power BI provides rich visualization but has model-size limits (1 GB on Pro, 10 GB on Premium).

We recommend continuing the existing pipeline: keep the cleaned e-commerce data in MySQL (as used in Week 2) for SQL-based calculations, pull results into Python for verification and segmentation, and finally present insights in Power BI. This combines the best of each tool: SQL for scalable segmentation and metric calculation, Python for analysis scripts and documentable notebooks, and Power BI for interactive visual storytelling.

Tool Comparison
Tool	Best Suited Tasks	Performance/Scalability	Reproducibility/Auditability
MySQL (SQL)	Data grouping, filtering, aggregation, joins (e.g. AOV, frequency, CLTV)	High performance on large tables with proper indexing; scales well to millions of records if queries are optimized.	Very reproducible via saved SQL scripts or views; easy to log and audit queries.
Python (Pandas/NumPy/Sklearn)	Complex transformations, custom analysis, validation, statistical operations (e.g. advanced CLTV modeling)	Moderate; efficient for millions of rows if data fits in memory, otherwise use chunking or libraries like Dask. Pandas operations can become slow if data is extremely large.	High reproducibility: analysis in Jupyter notebooks with version control.
Power Query (M)	Data loading and simple ETL (e.g. initial filtering, column renaming)	Limited on very large raw data (often slow above ~100–200MB). Better for moderate datasets via UI transformations.	Medium: queries are saved in the BI model (M code), but changes via UI can be hard to track externally.
Power BI (DAX/Visuals)	Final reporting, dashboards, visual comparisons across segments	In-memory, very fast for analysis (Import mode), but model size is limited (1 GB per dataset on Pro). Premium lifts limit to 10+ GB (with large storage up to ~100 GB).	Low: reports (.pbix) encapsulate calculations and queries; harder to audit since DAX logic is not code-exportable.

Each tool’s strengths align with specific Week 3 tasks: use SQL for fast computation of AOV and frequency via GROUP BY, Python for flexible summary and slicing, and Power BI for charts. Power Query adds little value here since the data is already cleaned and available in SQL.

Tool Strengths and Weaknesses for Week 3 Tasks
MySQL (SQL)

Strengths: Fast, scalable for large data (C-optimized engine). Excellent for summarizing customer orders (SEGMENT BY, GROUP BY). Indexes can speed filters on channel/region. SQL code is easy to version-control for audit.
Weaknesses: Limited to SQL’s set-based logic; complex analytics (e.g. conditional segments, advanced window calculations) may require verbose queries. No native visualization – results must be exported or linked to BI.
Python (Pandas/NumPy/Scikit-learn)

Strengths: Maximum flexibility: can join, filter, and compute any metric. Easy to prototype and validate logic. Powerful libraries for statistics (scikit-learn) if needed for advanced CLTV or customer-value modeling. Notebooks ensure step-by-step documentation.
Weaknesses: Not as fast as SQL for raw aggregations if data is very large; operations are memory-bound. If dataset grows beyond memory, require chunking or distributed processing (e.g. Dask/Spark). More coding overhead than point-and-click.
Power Query (M)

Strengths: User-friendly for simple ETL (no code). Good for quick data sampling or minor transforms (e.g. adding new columns).
Weaknesses: Performance/scale: Power Query can become very slow on large datasets, especially with complex “M” steps. It’s not well-suited for the heavy aggregation logic needed here.
Reproducibility: Limited – while M scripts can be extracted, most users configure through UI, which is harder to version-control.
Power BI (DAX/Visuals)

Strengths: Outstanding for visualization and business reporting. Easy to build interactive charts (bar charts, slicers, scatter plots). Can write DAX measures for ad-hoc calculations if needed.
Weaknesses: Data limits: The in-memory data model is capped (1 GB for Pro), which can be a bottleneck for very large e-commerce logs. Complex metrics in DAX can be cumbersome. Also, auditability suffers as DAX code is embedded in the pbix file (not easily exported).
Overall, SQL + Python is the professional choice here. SQL handles the heavy lifting of computing AOV, frequency, and initial CLTV metrics efficiently; Python then refines analyses, handles quantiles, and produces the narrative notebook. Power BI is reserved for the final dashboard display.

Recommended Toolchain
Given Week 1 (Python cleaning) and Week 2 (MySQL cohort analysis) are complete, the optimal Week 3 workflow is:

Data in MySQL: Continue to use the cleaned transactional table in MySQL for all group queries. Leverage SQL’s speed for large-scale aggregation.
Python for analysis: Pull aggregated results into a Python notebook for further calculation, validation, and insight generation. Python is needed for the final deliverable (a Jupyter notebook) and for any advanced logic (e.g. percentile cuts).
Power BI for output: Once metrics are computed, use Power BI to create interactive visuals (charts, dashboards) for business stakeholders.
No single tool can do all tasks optimally: Power Query is unnecessary (data is already prepared), and Power BI alone cannot easily handle heavy numeric crunching or produce a reproducible analysis notebook. The combined SQL → Python → Power BI pipeline is the most robust and reproducible.

Execution Plan (Task Mapping)
Follow these steps, mapping each Week 3 task to a tool:

Segment Customers (by Channel, Region, etc.) – Tool: MySQL
Group customers into segments using SQL GROUP BY. For example, to segment by acquisition channel and country:

sql
Copy
CREATE VIEW SegmentSummary AS
SELECT 
  acquisition_channel,
  country,
  COUNT(DISTINCT customer_id) AS num_customers,
  SUM(order_value) AS total_revenue,
  COUNT(*) AS total_orders
FROM Cleaned_Ecommerce
GROUP BY acquisition_channel, country;
Why: MySQL will quickly tally customers and revenue by segment. Indexes on acquisition_channel or country can speed this.

Calculate Average Order Value (AOV) – Tool: MySQL
Use SQL aggregates:

sql
Copy
SELECT customer_id,
       AVG(order_value) AS avg_order_value
FROM Cleaned_Ecommerce
GROUP BY customer_id;
Or for segments (join with SegmentSummary):

sql
Copy
SELECT s.acquisition_channel, s.country,
       s.total_revenue / s.total_orders AS segment_AOV
FROM SegmentSummary AS s;
Why: SQL easily computes AVG(order_value).

Calculate Purchase Frequency – Tool: MySQL
Two approaches:

Customers: frequency = total_orders / (number of customers). For a segment:
sql
Copy
SELECT acquisition_channel, country,
       total_orders / num_customers AS purchase_frequency
FROM SegmentSummary;
Individual Customer: could compute number of orders per customer:
sql
Copy
CREATE VIEW CustomerOrders AS
  SELECT customer_id,
         COUNT(*) AS order_count
  FROM Cleaned_Ecommerce
  GROUP BY customer_id;
Why: MySQL handles counts efficiently. For single-order customers, order_count=1 (freq = 1/year if using a 1-year window).

Calculate Historical CLTV – Tool: MySQL (+ Python validation)
Historical CLTV typically equals the sum of a customer’s past purchases. In SQL:

sql
Copy
CREATE VIEW CustomerMetrics AS
SELECT 
  customer_id,
  SUM(order_value) AS cltv,          -- total historical revenue
  AVG(order_value) AS aov,
  COUNT(*)    AS order_count
FROM Cleaned_Ecommerce
GROUP BY customer_id;
Optionally, convert to an annualized frequency or factor in time: e.g. divide order_count by total years in data. Since our project is historical, we can simply use SUM(order_value) as CLTV.
Edge Cases: If returns or refunds exist, exclude orders with negative order_value. Check for NaNs or zero orders. Validate that dates cover full customer lifetimes (else CLTV is an underestimate).
Validation: In Python, load CustomerMetrics (via Connector or CSV) and verify computations:

python
Copy
import pandas as pd
df = pd.read_sql("SELECT * FROM CustomerMetrics", conn)
# Quick sanity checks
assert df['cltv'].gt(0).all()
Compare CLTV Across Segments – Tools: MySQL and Python

In SQL: Join CustomerMetrics back to segment info to aggregate CLTV by segment:
sql
Copy
SELECT s.acquisition_channel, s.country,
       AVG(c.cltv) AS avg_cltv,
       SUM(c.cltv) AS total_cltv
FROM SegmentSummary AS s
JOIN CustomerMetrics AS c
  ON c.customer_id = s.customer_id  -- if SegmentSummary had each customer; else re-segment
GROUP BY s.acquisition_channel, s.country;
(Alternatively segment by re-joining transactions to identify each customer’s channel/region.)
In Python: It’s often easier to export key columns and use Pandas for flexibility. For example:
python
Copy
cust_df = pd.read_sql("SELECT customer_id, cltv, acquisition_channel FROM CustomerMetrics JOIN Cleaned_Ecommerce USING(customer_id)", conn)
seg_cltv = cust_df.groupby('acquisition_channel')['cltv'].mean().reset_index()
Why: SQL gives quick aggregate numbers; Python allows additional statistics (median, quartiles) easily.

Identify High-Value / Low-Value Customers – Tools: Python (with optional SQL)

Threshold/Quantiles: A common method is quantiles. For example, top 25% CLTV customers = high-value, bottom 25% = low-value. In Python:
python
Copy
df = pd.read_sql("SELECT customer_id, cltv FROM CustomerMetrics", conn)
df['value_segment'] = pd.qcut(df['cltv'], q=[0,0.25,0.75,1.0], labels=['Low','Medium','High'])
In SQL (MySQL 8+), one could use NTILE(4) or PERCENT_RANK(). Example:
sql
Copy
SELECT customer_id, cltv,
       NTILE(4) OVER (ORDER BY cltv DESC) AS quartile
FROM CustomerMetrics;
Business Rules: Alternatively, use a fixed CLTV cutoff (e.g. CLTV > ₹X = high). Suppose we choose 75th percentile value as threshold (computed or via window function).
Why: Quantiles ensure balanced groups. These customers can be examined for distinct characteristics (e.g. average AOV vs frequency).
Summarize Business Insights – Tools: Python & Power BI
Using the results from above, interpret patterns:

Which channels/regions have the highest avg CLTV?
Does high CLTV come from high frequency or high AOV?
Are top CLTV customers concentrated in certain segments?
Python (and the notebook narrative) will document these findings with tables/plots (e.g. histograms of CLTV, AOV vs frequency scatterplots).
Power BI will present key metrics as visuals (see next section).
Throughout, include data validation at each step: e.g. verify that AOV = total_revenue/total_orders, that frequency makes sense (no divide-by-zero), and handle any nulls or refunds. Always double-check the time window (if data spans multiple years, note this in interpretation).

High- vs. Low-Value Customers: Thresholds
A practical approach is to segment by quantiles of CLTV or total spend. For example:

Quartiles: In SQL or Python, assign customers into CLTV quartiles. Customers in the top quartile can be called “high value” and bottom quartile “low value.”
Top/Bottom X%: Alternatively, use NTILE(10) for deciles, or Python’s quantile to pick e.g. ≥75th percentile.
SQL Example (MySQL 8+):

sql
Copy
-- Compute CLTV percentiles
CREATE VIEW CLTV_Quarters AS
SELECT customer_id, cltv,
  CASE 
    WHEN cltv >= (SELECT cltv FROM (SELECT cltv FROM CustomerMetrics ORDER BY cltv DESC LIMIT FLOOR(0.25 * (SELECT COUNT(*) FROM CustomerMetrics)),1) x) THEN 'Top 25%'
    WHEN cltv <= (SELECT cltv FROM (SELECT cltv FROM CustomerMetrics ORDER BY cltv ASC LIMIT FLOOR(0.25 * (SELECT COUNT(*) FROM CustomerMetrics)),1) y) THEN 'Bottom 25%'
    ELSE 'Middle'
  END AS value_segment
FROM CustomerMetrics;
Python Example:

python
Copy
df = pd.read_sql("SELECT customer_id, cltv FROM CustomerMetrics", conn)
threshold_high = df['cltv'].quantile(0.75)
threshold_low  = df['cltv'].quantile(0.25)
df['value_segment'] = pd.cut(df['cltv'],
    bins=[-float('inf'), threshold_low, threshold_high, float('inf')],
    labels=['Low','Medium','High'])
Quantile-based segmentation is transparent and data-driven. Alternatively, a business rule could define “high-value” as, say, CLTV > ₹50,000 if domain knowledge justifies it. But without business presets, quantiles (e.g. top 20%) are common practice.

Recommended Outputs (Tables & Visuals)
Produce the following key outputs:

Segment Summary Table: e.g. a table showing for each segment (Channel × Region) the number of customers, total revenue, AOV, purchase frequency, and avg CLTV. Example layout:

Channel	Region	Customers	Total Revenue	AOV	Purchase Freq	Avg CLTV
Organic	USA	1,500	$5,000,000	$200	4.2	$840
Paid Search	USA	1,200	$4,200,000	$210	3.8	$798
Organic	UK	800	$2,400,000	$180	4.0	$720
…	…	…	…	…	…	…

Customer CLTV Distribution: A table or histogram of CLTV values, highlighting counts in each value segment (High/Med/Low).

Key Chart #1 – CLTV by Segment: Bar chart comparing average CLTV (or total revenue) across acquisition channels or regions. Shows which segments are most valuable.

Key Chart #2 – AOV vs. Purchase Frequency Scatter: Plot customers (or segment averages) on a 2D scatter where X-axis = purchase frequency and Y-axis = AOV, with point size = CLTV. This visual helps explain why some customers have high CLTV (e.g. high frequency and/or high AOV).

Key Chart #3 – Value Segment Breakdown: A bar or pie chart showing percentage of customers or revenue contributed by “High”, “Medium”, and “Low” CLTV groups.

Mermaid Flowchart – Workflow: A diagram of the Week 3 workflow. For example:

mermaid
Copy
graph TD
  A[Cleaned Data (MySQL)] --> B[Segment Customers<br/>(e.g. by Channel, Region)]
  B --> C[Calculate AOV & Frequency<br/>(SQL GROUP BY)]
  C --> D[Compute CLTV<br/>(SQL sum per customer)]
  D --> E[Compare CLTV Across Segments<br/>(Python/Pandas)]
  E --> F[Identify High/Low-Value Customers<br/>(Quantiles in Python)]
  F --> G[Generate Visual Insights<br/>(Power BI Dashboard)]
This flowchart (rendered via Markdown) clarifies each step and its tool.

Power BI Dashboard: Final interactive report with: KPI cards (total customers, average AOV, overall CLTV, total revenue), bar charts (CLTV by channel/region), and the scatter/AOV-vs-freq chart. Use slicers to filter segments.

In summary, expected deliverables are SQL views (for segments and metrics), Python notebook cells (calculations, tables, and static charts for validation), and a Power BI .pbix file with interactive visuals. Code snippets (above) and table layouts will be included in the repository for reproducibility.

Time & Effort Estimates
Task	Tool(s)	Effort	Deliverable
Data Segmentation (Channel, Region)	MySQL	Low	SQL view SegmentSummary
Compute AOV, Frequency	MySQL	Low	SQL view CustomerMetrics (AOV, freq)
Historical CLTV Calculation	MySQL / Python	Medium	SQL view or table with customer_id, cltv
Merge CLTV with Segments	Python / MySQL	Low	Segment-level CLTV summary table
High/Low Value Segmentation	Python	Low	Notebook code (quantiles)
Data Validation & Edge-Case Checks	SQL/Python	Medium	Summary notes (in notebook)
Visualization Design	Power BI	Medium	PBIX report
Documentation & Insights Writing	Python Notebook	High	Final analytical write-up

Low Effort: Straightforward SQL aggregates or Pandas group-by operations (minutes to implement).
Medium Effort: Combining results or validating logic (hours).
High Effort: Interpretation, writing clear insights, and building well-designed visuals (days).
Minimal Week 3 deliverables are: a Jupyter notebook (showing code and charts for AOV, frequency, CLTV, segmentation, plus business insight commentary), an SQL view or script file for the CLTV and segment tables, and a Power BI report. With these, all Week 3 tasks are covered.

References
Pandas documentation on scaling: use chunking or distributed tools for large datasets.
MySQL performance: optimized for fast grouping/sorting, especially vs. client-side loops.
Power BI limits: default dataset size is 1 GB (Shared/Pro), 10 GB (Premium).
CLV calculation: historical CLV is simply the sum of past revenue per customer (or AOV×frequency×lifespan).
These authoritative sources support the choice to leverage SQL for aggregation and to interpret CLTV in context.