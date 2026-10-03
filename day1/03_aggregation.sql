-- ============================================================================
-- Day 1 · Problem 03 — Aggregate functions
-- Topics: COUNT, SUM, AVG, MIN, MAX, COUNT(DISTINCT), NULL handling
-- ============================================================================

-- Q3.1  How many customers do we have?
SELECT COUNT(*) AS total_customers
FROM customers;

-- Q3.2  COUNT(column) ignores NULLs; COUNT(*) counts every row.
--       If a column can be NULL, the two can differ.
SELECT COUNT(*)           AS total_rows,
       COUNT(city)        AS rows_with_city,
       COUNT(*) - COUNT(city) AS rows_missing_city
FROM customers;

-- Q3.3  Total revenue across all order items.
--       Revenue per line = quantity * unit_price.
SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_items;

-- Q3.4  Average product price, rounded to 2 decimals.
SELECT ROUND(AVG(price), 2) AS avg_product_price
FROM products;

-- Q3.5  Cheapest and most expensive product in one query.
SELECT MIN(price) AS cheapest,
       MAX(price) AS most_expensive,
       MAX(price) - MIN(price) AS price_range
FROM products;

-- Q3.6  Count distinct customers who placed at least one order.
--       COUNT(DISTINCT customer_id) counts unique customers, not orders.
SELECT COUNT(DISTINCT customer_id) AS unique_buyers
FROM orders;

-- Q3.7  Average order value (AOV) — a classic e-commerce KPI.
--       AOV = total revenue / number of orders.
SELECT ROUND(SUM(quantity * unit_price) / COUNT(DISTINCT order_id), 2) AS aov
FROM order_items;

-- Q3.8  NULL handling in aggregates:
--       SUM/AVG/MIN/MAX skip NULLs; COUNT(*) counts them; COUNT(col) ignores them.
--       COALESCE turns NULL into a fallback value.
SELECT customer_id,
       COALESCE(city, 'Unknown') AS city_or_unknown
FROM customers;

-- Q3.9  Aggregate with a filter — count only completed orders.
--       WHERE filters rows BEFORE aggregation.
SELECT COUNT(*) AS completed_orders
FROM orders
WHERE status = 'completed';

-- Q3.10 Multiple aggregates in one query (no GROUP BY yet).
SELECT COUNT(*)                              AS total_orders,
       COUNT(DISTINCT customer_id)           AS unique_customers,
       MIN(order_date)                       AS first_order,
       MAX(order_date)                       AS last_order,
       ROUND(AVG(JULIANDAY(order_date)), 2)  AS avg_order_day_of_epoch  -- SQLite demo
FROM orders;

-- Q3.11 Total units sold per product (still no GROUP BY — one row total).
SELECT SUM(quantity) AS total_units_sold
FROM order_items;

-- Q3.12 Aggregate over a filtered subset using a subquery.
--       (Subqueries are covered in depth on Day 2; this is a warm-up.)
SELECT COUNT(*) AS orders_over_100
FROM (
    SELECT order_id, SUM(quantity * unit_price) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_totals
WHERE order_total > 100;
