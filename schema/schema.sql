-- ============================================================================
-- schema/schema.sql
-- Sample e-commerce + HR database for the 2-day SQL study plan.
-- Written in standard SQL; runs on SQLite, PostgreSQL, MySQL 8+, SQL Server.
--
-- Tables:
--   customers    - who is buying
--   products     - what is being sold
--   orders       - one row per order header
--   order_items  - line items on each order
--   employees    - HR table (used for recursive CTE / self-join demos)
-- ============================================================================

-- Drop in dependency-safe order (children first) so the script is re-runnable.
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

-- ----------------------------------------------------------------------------
-- customers
-- ----------------------------------------------------------------------------
CREATE TABLE customers (
    customer_id   INTEGER PRIMARY KEY,
    name          TEXT    NOT NULL,
    country       TEXT    NOT NULL,
    city          TEXT,
    signup_date   DATE    NOT NULL,
    age           INTEGER
);

-- ----------------------------------------------------------------------------
-- products
-- ----------------------------------------------------------------------------
CREATE TABLE products (
    product_id    INTEGER PRIMARY KEY,
    product_name  TEXT    NOT NULL,
    category      TEXT    NOT NULL,
    price         NUMERIC(10,2) NOT NULL,
    stock         INTEGER NOT NULL DEFAULT 0
);

-- ----------------------------------------------------------------------------
-- orders
-- ----------------------------------------------------------------------------
CREATE TABLE orders (
    order_id      INTEGER PRIMARY KEY,
    customer_id   INTEGER NOT NULL,
    order_date    DATE    NOT NULL,
    status        TEXT    NOT NULL DEFAULT 'completed',  -- completed | cancelled | pending
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ----------------------------------------------------------------------------
-- order_items
-- ----------------------------------------------------------------------------
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id      INTEGER NOT NULL,
    product_id    INTEGER NOT NULL,
    quantity      INTEGER NOT NULL,
    unit_price    NUMERIC(10,2) NOT NULL,   -- price at time of sale (may differ from products.price)
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ----------------------------------------------------------------------------
-- employees (small HR tree for self-join / recursive CTE demos)
-- ----------------------------------------------------------------------------
CREATE TABLE employees (
    employee_id   INTEGER PRIMARY KEY,
    name          TEXT    NOT NULL,
    department    TEXT    NOT NULL,
    salary        NUMERIC(10,2) NOT NULL,
    manager_id    INTEGER,                  -- NULL for the CEO
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Helpful indexes for the analytical queries in day2.
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date     ON orders(order_date);
CREATE INDEX idx_items_order     ON order_items(order_id);
CREATE INDEX idx_items_product   ON order_items(product_id);
