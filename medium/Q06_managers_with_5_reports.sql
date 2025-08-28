/*
------------------------------------------------------------
 Title      : Managers with at Least 5 Direct Reports
 Platform   : LeetCode (SQL 50)
 Difficulty : Medium
 Schema     :
   Employee(id INT, name VARCHAR, department VARCHAR, managerId INT)
 Concepts   : GROUP BY, HAVING, Subquery, Self-Join
------------------------------------------------------------

 📝 Problem:
 Write a query to find the names of managers who have at least
 5 direct reports.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT e1.name
FROM Employee e1
WHERE e1.id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(id) >= 5
);

------------------------------------------------------------
-- 💡 Explanation:
-- 1. The subquery finds all managerIds that have 5 or more employees.
-- 2. We use GROUP BY managerId and HAVING COUNT(id) >= 5.
-- 3. The outer query fetches the names of those managers by matching id.
------------------------------------------------------------
