-- ============================================================================
-- Day 1 · Topic 1 — SELECT Basics
-- ============================================================================
-- Covers: SELECT, column aliasing, DISTINCT, ORDER BY, LIMIT/OFFSET,
--         arithmetic expressions, string concatenation.
--
-- Run against: schema/schema.sql + schema/sample_data.sql
-- Dialect:     Standard SQL (works on SQLite, PostgreSQL, MySQL 8+, SQL Server)
-- ============================================================================


-- ----------------------------------------------------------------------------
-- 1.1  Select specific columns (projection)
-- ----------------------------------------------------------------------------
-- Problem: List every employee's name and salary.
-- Expected: 10 rows, 2 columns.
SELECT name, salary
FROM employees;


-- ----------------------------------------------------------------------------
-- 1.2  Column aliases — give a column a friendlier name in the result set
-- ----------------------------------------------------------------------------
-- Problem: Show each employee's name and their salary rounded to whole dollars.
-- Note:    AS is optional in most dialects; we use it for clarity.
SELECT
    name                AS employee_name,
    ROUND(salary)       AS salary_rounded
FROM employees;


-- ----------------------------------------------------------------------------
-- 1.3  Arithmetic in SELECT — compute derived columns
-- ----------------------------------------------------------------------------
-- Problem: Show each employee's monthly salary (annual / 12) and a 10% bonus.
SELECT
    name,
    salary,
    ROUND(salary / 12.0, 2)  AS monthly_salary,
    ROUND(salary * 0.10, 2)  AS bonus_10pct
FROM employees;


-- ----------------------------------------------------------------------------
-- 1.4  DISTINCT — remove duplicate rows from the result
-- ----------------------------------------------------------------------------
-- Problem: List the distinct departments in the company.
SELECT DISTINCT department
FROM employees;


-- ----------------------------------------------------------------------------
-- 1.5  DISTINCT on a subset of columns
-- ----------------------------------------------------------------------------
-- Problem: List the distinct (department, city) pairs — i.e. which cities
--          host which departments.
SELECT DISTINCT department, city
FROM employees
ORDER BY department, city;


-- ----------------------------------------------------------------------------
-- 1.6  ORDER BY — sort ascending (default) and descending
-- ----------------------------------------------------------------------------
-- Problem: List employees ordered by salary, highest first.
SELECT name, department, salary
FROM employees
ORDER BY salary DESC;


-- ----------------------------------------------------------------------------
-- 1.7  ORDER BY multiple columns — tie-breakers
-- ----------------------------------------------------------------------------
-- Problem: List employees ordered by department (A→Z), then by salary
--          (highest first) within each department.
SELECT name, department, salary
FROM employees
ORDER BY department ASC, salary DESC;


-- ----------------------------------------------------------------------------
-- 1.8  LIMIT / OFFSET — pagination
-- ----------------------------------------------------------------------------
-- Problem: Show the top 3 highest-paid employees.
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;


-- ----------------------------------------------------------------------------
-- 1.9  LIMIT + OFFSET — page 2 of a paginated result
-- ----------------------------------------------------------------------------
-- Problem: Show employees ranked 4th through 6th by salary.
-- Note:    MySQL uses LIMIT n OFFSET m; PostgreSQL/SQLite accept both forms.
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3 OFFSET 3;


-- ----------------------------------------------------------------------------
-- 1.10 String concatenation — build a display column
-- ----------------------------------------------------------------------------
-- Problem: Produce a "name (department)" label for each employee.
-- Note:    || is the standard SQL concatenation operator.
--          MySQL uses CONCAT(a, b) instead — see comment below.
SELECT name || ' (' || department || ')' AS label
FROM employees;

-- MySQL equivalent:
-- SELECT CONCAT(name, ' (', department, ')') AS label FROM employees;


-- ----------------------------------------------------------------------------
-- 1.11 SELECT * — when (and when not) to use it
-- ----------------------------------------------------------------------------
-- Problem: Show every column for every employee.
-- Note:    Fine for exploration; avoid in production code because it couples
--          your application to the table's column layout.
SELECT *
FROM employees;
