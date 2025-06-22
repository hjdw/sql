# Hanbit Trading SQL Practice Repository

This project provides comprehensive SQL practice queries based on the **한빛무역 (Hanbit Trading)** database. The dataset simulates a trading company environment with tables such as customers, employees, departments, products, and order records. It is designed to help learners strengthen their SQL query skills in a real-world business context.

## 📁 Dataset Overview

The database includes the following key tables:

- `고객 (Customer)`  
- `제품 (Product)`
- `주문 (Order)`
- `주문세부 (Order Details)`
- `사원 (Employee)`
- `부서 (Department)`
- `마일리지등급 (Mileage Grade)`

Each table is used to demonstrate various SQL functionalities such as joins, subqueries, grouping, and aggregation.

## 💡 Topics Covered

### 1. **Basic Data Retrieval**
- Selecting all rows from a table
- Filtering with `WHERE`, `LIKE`, `IN`, `BETWEEN`, `IS NULL`, etc.

### 2. **String Functions**
- `CONCAT`, `SUBSTRING`, `LTRIM`, `RTRIM`, `TRIM`
- `REPLACE`, `LEFT`, `RIGHT`, `REVERSE`
- Masking customer names and phone numbers for anonymization

### 3. **Mathematical & Date Functions**
- `CEIL`, `FLOOR`, `ROUND`, `MOD`, `ABS`, `POWER`
- `NOW()`, `DATEDIFF`, `ADDDATE`, `TIMESTAMPDIFF`, etc.

### 4. **Aggregate Functions & Grouping**
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY`, `HAVING`, `WITH ROLLUP`
- Conditional grouping with `CASE`, `IF`

### 5. **Joins (INNER, LEFT, RIGHT, CROSS)**
- Joining `고객` and `주문`, `사원` and `부서`, etc.
- ANSI and non-ANSI join styles
- Self-joins to query managers (`상사`)

### 6. **Subqueries**
- Scalar, correlated, and `IN`/`EXISTS` subqueries
- Comparing aggregate values like max mileage, order count, etc.

### 7. **Set Operations**
- `UNION`, `UNION ALL` between product and customer data
- Filtering non-overlapping or common entries

### 8. **Data Analysis Queries**
- Order trends by year/quarter/month
- Product inventory evaluation
- High-value customers and VVIP segmentation
- Regional sales performance

## 🗃️ File Structure

Each `.sql` file corresponds to different exercises and chapters:

| File Name     | Description                             |
|---------------|-----------------------------------------|
| dbms.sql      | Joins, subqueries, mileage queries      |
| dbms3.sql     | String, math, and date functions        |
| dbms4.sql     | Advanced string/date/grouping functions |
| dbms5.sql     | Grouping, ROLLUP, customer analysis     |
| dbms6.sql     | Various joins, subqueries, conditions   |
| dbms8.sql     | UNION, product/customer masking         |
| dbms9.sql     | Aggregation, GROUP_CONCAT, rankings     |
| dbms10.sql    | Subqueries and product filtering        |
| dbms11.sql    | Practice review queries, inventory tag  |

## 🚀 How to Use

1. **Import the database**  
   Make sure you have the database `한빛무역` set up in your MySQL or MariaDB server.
   ```sql
   USE 한빛무역;
