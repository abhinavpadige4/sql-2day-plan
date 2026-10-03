# 2-Day SQL Study Plan

A focused, hands-on 2-day plan to go from SQL basics to advanced analytical queries.
Every practice query is solved in a dedicated `.sql` file with comments, expected
output, and complexity notes.

## What's Inside

```
sql-2day-plan/
├── README.md                       ← this file (the plan)
├── schema/
│   ├── schema.sql                  ← sample database DDL (SQLite-compatible)
│   └── sample_data.sql             ← INSERT statements to populate the DB
├── day1/                           ← Fundamentals (SELECT, WHERE, GROUP BY, JOINs)
│   ├── 01_select_basics.sql
│   ├── 02_where_filtering.sql
│   ├── 03_aggregation.sql
│   ├── 04_group_by_having.sql
│   └── 05_joins.sql
└── day2/                           ← Advanced (subqueries, window fns, CTEs)
    ├── 06_subqueries.sql
    ├── 07_window_functions.sql
    ├── 08_cte_and_recursive.sql
    ├── 09_advanced_joins.sql
    └── 10_case_when_and_conditional.sql
```

## Prerequisites

- Any SQL client (SQLite, PostgreSQL, MySQL, DBeaver, or even an online playground
  like [DB Fiddle](https://www.db-fiddle.com/) or [SQL Fiddle](https://sqlfiddle.com/)).
- ~4 hours per day (2 focused sessions of ~2 hours each).

## Day 1 — Fundamentals (SELECT, WHERE, GROUP BY, JOINs)

**Goal:** Be able to write single-table and two-table queries confidently.

| # | Topic | File | Time |
|---|-------|------|------|
| 1 | SELECT, ORDER BY, LIMIT, DISTINCT | `day1/01_select_basics.sql` | 20 min |
| 2 | WHERE, AND/OR/NOT, IN, LIKE, BETWEEN, IS NULL | `day1/02_where_filtering.sql` | 30 min |
| 3 | Aggregate functions (COUNT, SUM, AVG, MIN, MAX) | `day1/03_aggregation.sql` | 30 min |
| 4 | GROUP BY + HAVING | `day1/04_group_by_having.sql` | 40 min |
| 5 | JOINs (INNER, LEFT, RIGHT, FULL, CROSS, SELF) | `day1/05_joins.sql` | 60 min |

**Day 1 checkpoint:** You can answer "How many X per Y?" and "Show me X joined with Y"
without looking at docs.

## Day 2 — Advanced (Subqueries, Window Functions, CTEs)

**Goal:** Write analytical queries that would pass a data-analyst interview.

| # | Topic | File | Time |
|---|-------|------|------|
| 6 | Subqueries (scalar, IN, EXISTS, correlated) | `day2/06_subqueries.sql` | 40 min |
| 7 | Window functions (ROW_NUMBER, RANK, LAG, LEAD, SUM OVER) | `day2/07_window_functions.sql` | 60 min |
| 8 | CTEs and recursive CTEs | `day2/08_cte_and_recursive.sql` | 40 min |
| 9 | Advanced joins (anti-join, semi-join, FULL OUTER, self-join patterns) | `day2/09_advanced_joins.sql` | 30 min |
| 10 | CASE WHEN, conditional aggregation, pivoting | `day2/10_case_when_and_conditional.sql` | 30 min |

**Day 2 checkpoint:** You can compute running totals, top-N per group, and
month-over-month growth in one query.

## How to Run Locally (SQLite)

```bash
# 1. Create the database
sqlite3 practice.db < schema/schema.sql
sqlite3 practice.db < schema/sample_data.sql

# 2. Run any practice file
sqlite3 practice.db < day1/01_select_basics.sql
sqlite3 practice.db < day2/07_window_functions.sql
```

Or open `practice.db` in DBeaver / DataGrip and run files individually.

## SQL Dialect Notes

- The schema and solutions are written in **standard SQL** and run on SQLite,
  PostgreSQL, MySQL 8+, and SQL Server.
- Where a feature is dialect-specific (e.g. `FULL OUTER JOIN` on MySQL,
  recursive CTEs on older MySQL), the file includes a comment with the
  equivalent for the other dialects.

## Concepts Covered

- SELECT, projection, DISTINCT, ORDER BY, LIMIT/OFFSET
- WHERE filtering: AND/OR/NOT, IN, LIKE, BETWEEN, IS NULL
- Aggregate functions: COUNT, SUM, AVG, MIN, MAX
- GROUP BY and HAVING
- JOINs: INNER, LEFT, RIGHT, FULL OUTER, CROSS, SELF
- Subqueries: scalar, IN, EXISTS, correlated
- Window functions: ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, SUM OVER
- Common Table Expressions (CTEs) and recursive CTEs
- CASE WHEN and conditional aggregation
- Anti-joins and semi-joins

## License

MIT — use freely for learning.
