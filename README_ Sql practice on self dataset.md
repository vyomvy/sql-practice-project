# 🗄️ SQL Practice Project

**Author:** Sant Kumar Sahu  
**Status:** Student  
**Tool:** MySQL · MySQL Workbench  
**Goal:** Build strong SQL fundamentals for data-focused roles

---

## 📌 About This Project

This is a self-designed SQL practice project where I built a relational database from scratch and solved 10 progressively complex queries covering the most important SQL concepts used in real-world data analysis and technical interviews.

Rather than following a tutorial, I designed the dataset myself, wrote every query from scratch, and debugged my own logic — which gave me a much deeper understanding of how SQL actually works under the hood.

---

## 🗂️ Database Schema

The project uses 3 interrelated tables:

### `Departments`
| Column | Type | Description |
|---|---|---|
| dept_id | INT (PK) | Unique department ID |
| dept_name | VARCHAR | Name of department |
| location | VARCHAR | City location |

### `Employees`
| Column | Type | Description |
|---|---|---|
| emp_id | INT (PK) | Unique employee ID |
| name | VARCHAR | Employee name |
| dept_id | INT (FK) | Links to Departments |
| salary | INT | Annual salary |
| joining_date | DATE | Date of joining |
| manager_id | INT | Self-referencing FK (manager) |

### `Orders`
| Column | Type | Description |
|---|---|---|
| order_id | INT (PK) | Unique order ID |
| emp_id | INT (FK) | Links to Employees |
| amount | INT | Order value |
| order_date | DATE | Date of order |
| status | VARCHAR | delivered / pending / cancelled |

---

## 📁 Project Structure

```
sql-practice-project/
├── README.md
├── dataset/
│   └── practice_sql.sql        ← Full schema + data setup
└── solutions/
    ├── q1_left_join.sql
    ├── q2_groupby_having.sql
    ├── q3_max_per_group.sql
    ├── q4_self_join.sql
    ├── q5_date_filter.sql
    ├── q6_date_groupby.sql
    ├── q7_left_join_null.sql
    ├── q8_lag_date_gap.sql
    ├── q9_multi_join_filter.sql
    └── q10_running_total.sql
```

---

## 🧠 Concepts Covered

### 🔗 JOINs
- `INNER JOIN` — match employees with their departments and orders
- `LEFT JOIN` — find departments with no employees assigned
- `SELF JOIN` — find each employee's manager name from the same table

### 📊 GROUP BY + Aggregations
- Total salary and headcount per department using `GROUP BY`
- Filtering groups with `HAVING` (e.g. departments with more than 1 employee)
- Monthly order totals using `MONTH()` + `YEAR()` + `GROUP BY`

### 🔍 Subqueries + Correlated Subqueries
- Find highest paid employee per department using a correlated subquery
- Alternative approach using `GROUP BY` + `JOIN` on the max result
- Understanding why `WHERE` vs `HAVING` matters in subquery logic

### 📅 Date Functions
- Filter employees by joining date using `DATE_SUB` and `DATEDIFF`
- Calculate how many days each employee has worked
- Group and aggregate orders by month and year

### 🪟 Window Functions
- `LAG()` to access the previous row's date
- `DATEDIFF` + `LAG` to calculate gaps between consecutive orders per employee
- `SUM() OVER (ORDER BY)` for running totals across orders

---

## 📝 The 10 Questions Solved

| # | Question | Concept | Difficulty |
|---|---|---|---|
| Q1 | List all employees with dept name — include those with no dept | LEFT JOIN | 🟢 Easy |
| Q2 | Total salary and headcount per dept (more than 1 employee) | GROUP BY + HAVING | 🟢 Easy |
| Q3 | Highest paid employee in each department | MAX per group | 🟡 Medium |
| Q4 | Each employee with their manager's name | Self JOIN | 🟡 Medium |
| Q5 | Employees who joined in last 5 years + days worked | Date filter + DATEDIFF | 🟢 Easy |
| Q6 | Total order amount per month in 2024 | Date GROUP BY | 🟡 Medium |
| Q7 | Departments with no employees | LEFT JOIN + NULL check | 🟡 Medium |
| Q8 | Gap in days between Alice's consecutive orders | LAG + DATEDIFF | 🔴 Hard |
| Q9 | Employees who only ever placed cancelled orders | Multi JOIN + logic filter | 🔴 Hard |
| Q10 | Running total of order amounts ordered by date | SUM() OVER window | 🔴 Hard |

---

## ⚙️ How to Run This Project

1. Open **MySQL Workbench**
2. Go to **File → Open SQL Script**
3. Select `dataset/practice_sql.sql`
4. Press `Ctrl + Shift + Enter` to execute
5. Double-click `sql_practice` in the Schemas panel to activate it
6. Open any file from `solutions/` and run to see results

---

## 💡 Key Learnings

- The difference between `WHERE` and `HAVING` and when each applies
- Why correlated subqueries re-run for every row and when to prefer `JOIN` instead
- How `LAG()` works to compare a row against its previous row in a partition
- Why `LEFT JOIN + NULL check` is the cleanest way to find missing relationships
- How window functions like `SUM() OVER` avoid collapsing rows unlike `GROUP BY`

---

## 🚀 What's Next

- Learning `CTEs` (WITH clause) to rewrite subqueries more cleanly
- `CASE WHEN` for conditional logic inside queries
- `DENSE_RANK` and `ROW_NUMBER` for ranking problems
- Query optimization using `EXPLAIN`

---

## 🔗 Connect With Me

Feel free to reach out or connect on LinkedIn if you're also learning SQL or working on data projects!
