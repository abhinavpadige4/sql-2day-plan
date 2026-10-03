-- ============================================================
-- 02_where_filtering.sql
-- Topic: WHERE clause — AND/OR/NOT, IN, LIKE, BETWEEN, IS NULL
-- ============================================================

-- ------------------------------------------------------------
-- Q1. All employees in the Engineering department.
-- ------------------------------------------------------------
SELECT id, name, salary
FROM employees
WHERE department_id = 1;

-- ------------------------------------------------------------
-- Q2. Employees earning more than 100k AND hired in 2023.
-- ------------------------------------------------------------
SELECT id, name, hire_date, salary
FROM employees
WHERE salary > 100000
  AND hire_date >= '2023-01-01'
  AND hire_date <  '2024-01-01';

-- ------------------------------------------------------------
-- Q3. Employees in Engineering OR Sales.
-- ------------------------------------------------------------
SELECT id, name, department_id
FROM employees
WHERE department_id IN (1, 2);

-- ------------------------------------------------------------
-- Q4. Names starting with 'A' (case-insensitive on SQLite).
-- ------------------------------------------------------------
SELECT id, name
FROM employees
WHERE name LIKE 'A%';

-- ------------------------------------------------------------
-- Q5. Salaries between 90k and 110k (inclusive).
-- ------------------------------------------------------------
SELECT id, name, salary
FROM employees
WHERE salary BETWEEN 90000 AND 110000;

-- ------------------------------------------------------------
-- Q6. Orders placed in March 2023 (BETWEEN on dates).
-- ------------------------------------------------------------
SELECT id, customer_id, order_date, total_amount
FROM orders
WHERE order_date BETWEEN '2023-03-01' AND '2023-03-31';

-- ------------------------------------------------------------
-- Q7. Employees NOT in the Support department.
-- ------------------------------------------------------------
SELECT id, name, department_id
FROM employees
WHERE department_id NOT IN (5);

-- ------------------------------------------------------------
-- Q8. Products whose name contains 'e' (any position).
-- ------------------------------------------------------------
SELECT id, name, category
FROM products
WHERE LOWER(name) LIKE '%e%';

-- ------------------------------------------------------------
-- Q9. Rows where a nullable column IS NULL (demo).
--     Here we use a subquery to find employees with no orders
--     (employees who never appear in orders.customer_id).
-- ------------------------------------------------------------
SELECT e.id, e.name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = e.id
);
