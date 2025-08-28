/*
------------------------------------------------------------
 Title      : Consecutive Numbers
 Platform   : LeetCode (SQL 50)
 Difficulty : Medium
 Schema     :
   Logs(id INT, num INT)
 Concepts   : Window Functions, LAG, LEAD, DISTINCT
------------------------------------------------------------

 📝 Problem:
 Write a query to find all numbers that appear at least
 three times consecutively in the Logs table.
------------------------------------------------------------
*/

-- ✅ Solution
WITH cons AS (
    SELECT 
        id,
        num,
        LAG(num) OVER(ORDER BY id) AS prev_num,
        LEAD(num) OVER(ORDER BY id) AS next_num
    FROM Logs
)
SELECT DISTINCT 
    num AS ConsecutiveNums
FROM cons
WHERE num = prev_num AND num = next_num;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Use LAG() and LEAD() to check previous and next number
--    relative to the current row.
-- 2. If current num = prev_num = next_num → it means the
--    number repeats 3 times consecutively.
-- 3. DISTINCT ensures the result contains unique numbers only.
------------------------------------------------------------
