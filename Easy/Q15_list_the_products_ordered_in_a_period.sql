-- Title: List the Products Ordered in a Period
-- ID: Q14
-- Difficulty: Easy
-- Concepts: Aggregation, Filtering with HAVING, JOIN, Date Range
-- Schema:
--   Products(product_id INT, product_name VARCHAR)
--   Orders(product_id INT, order_date DATE, unit INT)
-- Problem (paraphrased):
--   - Find the product names and total units ordered between 2020-02-01 and 2020-02-29.
--   - Only include products with total units >= 100.

-- Solution:
SELECT p.product_name,
       SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
     ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;

-- Explanation:
-- 1. JOIN Products with Orders → to fetch product names alongside orders.
-- 2. WHERE clause filters orders only in Feb 2020.
-- 3. GROUP BY product_id, product_name → aggregate per product.
-- 4. SUM(o.unit) → total units ordered in that period.
-- 5. HAVING SUM(o.unit) >= 100 → filters out products with fewer than 100 units ordered.
-- 6. DISTINCT is not needed since GROUP BY already handles duplicates.

-- Note:
-- GROUP BY p.product_id, p.product_name is cleaner than using DISTINCT + GROUP BY product_id.
