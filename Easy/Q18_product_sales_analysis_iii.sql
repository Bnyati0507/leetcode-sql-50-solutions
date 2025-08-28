/*
------------------------------------------------------------
 Title      : Product Sales Analysis III
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Sales(product_id INT, year INT, quantity INT, price INT)
 Concepts   : GROUP BY, Subquery, MIN()
------------------------------------------------------------

 📝 Problem:
 Write an SQL query that selects the product_id, first year it was sold, 
 as well as the quantity and price for that year.

 The result should include:
   - product_id
   - first_year (earliest year of sale)
   - quantity
   - price
------------------------------------------------------------
*/

-- ✅ Solution
SELECT product_id,
       year AS first_year,
       quantity,
       price
FROM Sales
WHERE (product_id, year) IN (
        SELECT product_id,
               MIN(year) AS year
        FROM Sales
        GROUP BY product_id
     );

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Inner query:
--    - Groups rows by product_id.
--    - Finds the MIN(year) for each product (earliest year).
--
-- 2. Outer query:
--    - Selects product_id, year, quantity, and price
--      where (product_id, year) matches the earliest year
--      found in the subquery.
--
-- 3. This ensures we get the first_year of sale for each product,
--    along with the corresponding quantity and price.
------------------------------------------------------------
