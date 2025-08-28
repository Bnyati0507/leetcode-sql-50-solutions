/*
------------------------------------------------------------
 Title      : Second Highest Salary
 Platform   : LeetCode (SQL 50)
 Difficulty : Medium
 Schema     :
   Employee(id INT, salary INT)
 Concepts   : Subqueries, ORDER BY, LIMIT, OFFSET
------------------------------------------------------------

 📝 Problem:
 Write a SQL query to get the second highest salary from 
 the Employee table. If no second highest salary exists, 
 return NULL.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT 
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    ) AS SecondHighestSalary;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. ORDER salaries in descending order.
-- 2. DISTINCT ensures duplicate salaries are ignored.
-- 3. LIMIT 1 OFFSET 1 → skips the top salary (OFFSET 1)
--    and picks the next one (LIMIT 1).
-- 4. If only one unique salary exists → result is NULL.
------------------------------------------------------------
