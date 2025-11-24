-- =========================
-- ONLINE STORE SQL PROJECT
-- =========================

-- 1️⃣ Create Database
CREATE DATABASE online_store_db;
USE online_store_db;

-- 2️⃣ Create Tables

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 3️⃣ Insert Data

INSERT INTO customers VALUES
(1,'Arun Kumar','Chennai'),
(2,'Priya Sharma','Bangalore'),
(3,'Rahul Singh','Mumbai'),
(4,'Divya Iyer','Chennai'),
(5,'Vishal Patel','Hyderabad');

INSERT INTO products VALUES
(101,'Wireless Mouse','Electronics',499),
(102,'Laptop Stand','Electronics',899),
(103,'Cotton T-Shirt','Fashion',399),
(104,'Sneakers','Fashion',1299),
(105,'Coffee Mug','Home',199);

INSERT INTO orders VALUES
(1001,1,'2025-01-01'),
(1002,3,'2025-01-01'),
(1003,2,'2025-01-02'),
(1004,4,'2025-01-03'),
(1005,5,'2025-01-03');

INSERT INTO order_items VALUES
(1,1001,101,2),
(2,1001,105,1),
(3,1002,103,3),
(4,1003,102,1),
(5,1003,104,2),
(6,1004,105,4),
(7,1005,103,1),
(8,1005,101,1);

-- =====================
-- ANALYTICAL QUERIES
-- =====================

-- 1. Total number of orders
SELECT COUNT(*) AS total_orders FROM orders;

-- 2. Total revenue generated
SELECT SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 3. Top 5 selling products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- 4. Sales by product category
SELECT p.category, SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

-- 5. City-wise revenue
SELECT c.city, SUM(oi.quantity * p.price) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.city;

-- 6. Daily sales trend
SELECT order_date, SUM(oi.quantity * p.price) AS daily_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY order_date
ORDER BY order_date;

-- 7. Most profitable product
SELECT p.product_name, SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 1;

-- 8. Total quantity sold per category
SELECT p.category, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

-- 9. Average order value
SELECT AVG(order_value) AS avg_order_value
FROM (
    SELECT o.order_id, SUM(oi.quantity * p.price) AS order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id
) x;

-- 10. Orders per customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 11. Category-wise product count
SELECT category, COUNT(*) AS number_of_products
FROM products
GROUP BY category;

-- 12. Revenue by month
SELECT 
    MONTH(order_date) AS month_number,
    SUM(oi.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY MONTH(order_date)
ORDER BY month_number;
