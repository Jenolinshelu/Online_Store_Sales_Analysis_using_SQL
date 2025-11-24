# Online_Store_Sales_Analysis_using_SQL


 📋 Project Overview

This project focuses on analysing **online store sales data** using SQL.
It covers the complete process of:

* Database creation
* Table setup
* Data import
* Query-driven business insights

The project highlights key e-commerce metrics such as **total revenue, top-selling products, customer orders, popular categories, and monthly sales trends**.

Through this project, I gained hands-on experience in:

* SQL joins
* Grouping & aggregation
* Date-time functions
* Window functions
* Real-world business analysis

---

## 🧩 Database Structure

The database — **online_store_db** — contains four main tables:

| Table Name      | Description                                                   |
| --------------- | ------------------------------------------------------------- |
| **customers**   | Stores customer details: ID, name, city, signup date          |
| **products**    | Includes product IDs, names, categories, and price            |
| **orders**      | Records each order’s ID, date, and customer ID                |
| **order_items** | Links orders with products, capturing quantity and total cost |

---

## ⚙️ Setup Instructions

### 1️⃣ Create the Database

```sql
CREATE DATABASE online_store_db;
USE online_store_db;
```

### 2️⃣ Import the Data

Using **MySQL Workbench**:

* Right-click **Tables → Table Data Import Wizard**
* Import the CSV files (`customers`, `products`, `orders`, `order_items`)
* Assign to the matching table

### 3️⃣ Verify Data Import

```sql
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
```

---

## 🔍 Analytical Queries

A collection of **12 SQL queries** were used to extract meaningful insights.

| S.No | Query Description                       | SQL Concept Demonstrated   |
| ---- | --------------------------------------- | -------------------------- |
| 1    | Retrieve total number of orders         | COUNT(), Basic Aggregation |
| 2    | Calculate total revenue                 | SUM(), JOIN                |
| 3    | Identify highest-priced product         | ORDER BY, LIMIT            |
| 4    | Find most frequently ordered product    | GROUP BY, COUNT()          |
| 5    | Determine most popular product category | GROUP BY, ORDER BY         |
| 6    | Top 5 best-selling products             | Aggregation, JOIN, LIMIT   |
| 7    | Revenue by category                     | Multi-table JOIN, GROUP BY |
| 8    | Orders by month                         | MONTH(), GROUP BY          |
| 9    | Category-wise product distribution      | GROUP BY                   |
| 10   | Average order value per customer        | Subqueries, AVG()          |
| 11   | Top 3 customers by total spending       | JOIN, SUM(), ORDER BY      |
| 12   | Quarterly sales performance             | CASE WHEN, Aggregation     |

---

## 📊 Key Insights

📌 **Top-selling products** show customer preferences and demand patterns.
(image)

💰 **Total revenue & monthly sales trend** highlight business performance.
(image) (image)

👥 **Customer spending analysis** reveals high-value customers.
(image)

🕒 **Monthly & quarterly breakdown** helps identify seasonal sales trends.
(image)

---

## 💾 Tools Used

* **MySQL Workbench** – database design & SQL execution
* **CSV Files** – dataset source
* **GitHub** – version control & project sharing

---

## 🏁 Conclusion

This SQL project demonstrates how raw e-commerce sales data can be transformed into **actionable business insights**.It showcases SQL skills across joins, aggregations, date handling, and window functions.
By analysing 12 key queries, it showcases your capabilities in:

* Data wrangling
* Business analytics
* SQL querying
* Real-world problem solving


