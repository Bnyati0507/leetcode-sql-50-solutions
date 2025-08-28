/*
------------------------------------------------------------
 Title      : Average Selling Price
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Prices(product_id INT, start_date DATE, end_date DATE, price INT)
   UnitsSold(product_id INT, purchase_date DATE, units INT)
 Concepts   : JOIN, Aggregation, COALESCE, ROUND()
------------------------------------------------------------

 📝 Problem:
 Write an SQL query to find the average selling price for each product.

 Average Selling Price = 
     (Total Price * Units Sold) / (Total Units Sold)

 If no units were sold, average price should be 0.

 Return result table in any order.
------------------------------------------------------------
*/

-- ✅ Solution (Using Window Functions)
SELECT DISTINCT p.product_id,
       COALESCE(
         ROUND(
           SUM(p.price * u.units) OVER (PARTITION BY p.product_id) /
           SUM(u.units) OVER (PARTITION BY p.product_id), 
           2
         ), 
         0
       ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
       ON p.product_id = u.product_id
      AND u.purchase_date BETWEEN p.start_date AND p.end_date
ORDER BY p.product_id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Join Prices with UnitsSold:
--    - Match product_id.
--    - Ensure purchase_date falls within price's start_date & end_date.
--
-- 2. For each product:
--    - Multiply price * units sold.
--    - Divide by total units sold → gives weighted average price.
--
-- 3. Use ROUND(..., 2) → round to 2 decimal places.
-- 4. Use COALESCE(..., 0) → handle products with no sales (return 0).
 
------------------------------------------------------------
