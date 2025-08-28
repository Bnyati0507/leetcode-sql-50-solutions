/*
------------------------------------------------------------
 Title      : Product Price at a Given Date
 Platform   : LeetCode (SQL 50)
 Difficulty : Medium
 Schema     :
   Products(product_id INT, new_price INT, change_date DATE)
 Concepts   : Subqueries, GROUP BY, Aggregation, UNION
------------------------------------------------------------

 📝 Problem:
 For each product, find its price on '2019-08-16'.
 If no change was made before that date, the price = 10.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT 
    product_id, 
    new_price AS price 
FROM Products
WHERE (product_id, change_date) IN (
    SELECT 
        product_id, 
        MAX(change_date) 
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

SELECT 
    product_id, 
    10 AS price 
FROM Products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
);

------------------------------------------------------------
-- 💡 Explanation:
-- 1. First subquery finds the most recent price change
--    before or on '2019-08-16'.
-- 2. UNION ensures we also include products with no price
--    change → assign default price = 10.
-- 3. DISTINCT (or GROUP BY) avoids duplicate product_ids.
------------------------------------------------------------
