/*
------------------------------------------------------------
 Title      : Group Sold Products by the Date
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Activities(sell_date DATE, product VARCHAR)
 Concepts   : GROUP BY, COUNT(DISTINCT), GROUP_CONCAT, Aggregation
------------------------------------------------------------

 📝 Problem:
 Write an SQL query to find for each date:
   - The number of distinct products sold
   - A list of those products, sorted alphabetically
   - Products should be separated by commas in the list

 Return result ordered by sell_date.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. COUNT(DISTINCT product) → ensures we only count unique products per date.
-- 2. GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') →
--    concatenates product names in alphabetical order, separated by commas.
-- 3. GROUP BY sell_date → groups data at the daily level.
-- 4. ORDER BY sell_date → sorts the output chronologically.
------------------------------------------------------------
