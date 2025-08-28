/*
------------------------------------------------------------
 Title      : Last Person to Fit in the Bus
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Queue(turn INT, person_name VARCHAR, weight INT)
 Concepts   : Window Functions, CTE, LIMIT
------------------------------------------------------------

 📝 Problem:
 Find the name of the last person who can board the bus
 without exceeding a total weight limit of 1000.
------------------------------------------------------------
*/

-- ✅ Solution
WITH cte AS (
    SELECT 
        turn,
        person_name,
        weight,
        SUM(weight) OVER (ORDER BY turn) AS cum_weight
    FROM Queue
)
SELECT person_name
FROM cte
WHERE cum_weight <= 1000
ORDER BY cum_weight DESC
LIMIT 1;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Use SUM(weight) OVER (ORDER BY turn) to calculate cumulative weight.
-- 2. Keep only rows where total weight ≤ 1000.
-- 3. Order by cum_weight descending to find the last valid passenger.
-- 4. LIMIT 1 returns that single person.
------------------------------------------------------------
