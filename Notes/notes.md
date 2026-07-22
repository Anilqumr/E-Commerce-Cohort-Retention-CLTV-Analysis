According to the **Project 2: SaaS/E-Commerce Cohort Retention & CLTV Analysis** roadmap, **Week 1** is focused on **Transactional Data Cleaning and Wrangling**. 

Since you're working with the **Online Retail dataset**, here's a practical breakdown of the tasks you should complete.

## Week 1 Tasks

### 1. Project Setup

* Create the project repository.
* Create the folder structure:

  ```
  Project2/
  ├── data/
  │ └──Cleaned Data
  │    └──Cleaned_Ecommerce.csv
  │ └──Raw Data
  │    └──Ecommerce_Dataset.csv.xls
  ├── notebooks
  ├── notes
  ├── README.md
  ├── requirements.txt
  └── .gitignore
  ```
* Add the dataset to `data/` (keep it out of GitHub if following internship guidelines).
* Initialize Git.

---

### 2. Load the Dataset

* Import Pandas, NumPy, Matplotlib, Seaborn.
* Read the CSV.
* Display:

  * Shape
  * Columns
  * Data types
  * First and last few rows
  * Summary statistics

---

### 3. Exploratory Data Analysis (EDA)

Perform basic exploration:

* Number of rows and columns
* Missing values
* Duplicate rows
* Unique customers
* Unique invoices
* Products
* Countries
* Date range

---

### 4. Convert Data Types

Ensure:

* `InvoiceDate` → datetime
* `CustomerID` → integer/string as needed
* `Quantity` → numeric
* `UnitPrice` → numeric

---

### 5. Handle Missing User IDs

The project specification explicitly requires handling missing user IDs. 

Tasks:

* Count missing `CustomerID`
* Decide whether to remove them (recommended for cohort analysis)
* Verify remaining unique customers

---

### 6. Remove Refunded/Cancelled Transactions

The project specifically mentions filtering refunded/failed transactions. 

For the Online Retail dataset:

* Remove invoices beginning with **C**
* Remove negative quantities
* Remove negative prices (if any)

---

### 7. Remove Invalid Records

Check for:

* Zero quantity
* Zero price
* Negative quantity
* Negative price
* Invalid dates

Remove or justify keeping them.

---

### 8. Remove Duplicate Records

* Identify duplicates
* Remove exact duplicates
* Report how many were removed

---

### 9. Create Sales Amount Column

Create:

```python
TotalPrice = Quantity * UnitPrice
```

This will be required later for CLTV.

---

### 10. Calculate Cohort Month ⭐

This is the main deliverable of Week 1. 

For every customer:

* Find their **first purchase date**
* Convert it to **Month-Year**
* Store as **CohortMonth**

Example:

| CustomerID | InvoiceDate | CohortMonth |
| ---------- | ----------- | ----------- |
| 17850      | 2010-12-01  | 2010-12     |
| 17850      | 2010-12-10  | 2010-12     |
| 17850      | 2011-02-15  | 2010-12     |

This will be used in Week 2 to build the retention matrix.

---

### 11. Verify Cohort Assignment

Check:

* Every customer has exactly one cohort month.
* Cohort month equals the customer's first purchase month.

---

### 12. Save the Cleaned Dataset

Export:

```text
Cleaned_Ecommerce.csv
```

This becomes the input for Week 2.

---

## Expected Week 1 Deliverables

* ✅ Cleaned dataset
* ✅ Jupyter Notebook with all cleaning steps
* ✅ Exploratory Data Analysis
* ✅ Missing values handled
* ✅ Refunds/cancelled orders removed
* ✅ Duplicates removed
* ✅ `TotalPrice` column created
* ✅ `CohortMonth` calculated for every customer
* ✅ Cleaned dataset exported

---

## GitHub Commit Plan (Recommended)

To satisfy the internship's requirement for steady progress and semantic commits, aim for commits like:

1. `chore: initialize project structure (fixes #1)`
2. `feat: load ecommerce dataset and perform initial EDA (fixes #2)`
3. `fix: clean missing customer IDs and duplicate records (fixes #3)`
4. `feat: filter cancelled transactions and calculate TotalPrice (fixes #4)`
5. `feat: calculate CohortMonth for each customer (fixes #5)`

This aligns with the project's emphasis on transparent, week-by-week GitHub activity and semantic commit messages. 

---

## 👥 Team

This project was built collaboratively by a team of 3.

---

**Member 1:** Anil Kumar Pyarasani
[💼 LinkedIn](https://www.linkedin.com/in/pyarasani-anil-kumar/) | [🐙 GitHub](https://github.com/Anilqumr/) | [✉️ Email](mailto:Anilqumr@gmail.com)

---

**Member 2:** Nneka Akanno
[💼 LinkedIn](https://www.linkedin.com/in/nneka-akanno/) | [🐙 GitHub](https://github.com/MarySabestine) | [✉️ Email](mailto:akannomary@gmail.com)

---

**Member 3:** Anshuman Satpute
[💼 LinkedIn](https://www.linkedin.com/in/anshuman-satpute-0ab978313) | [🐙 GitHub](https://github.com/02Anshuman) | [✉️ Email](mailto:anshumansatpute2002@gmail.com)

---

⭐ *If you found this project useful or insightful, consider giving it a star on GitHub!*

