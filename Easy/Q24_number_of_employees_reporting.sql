/*
------------------------------------------------------------
 Title      : The Number of Employees Which Report to Each Employee
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Employees(employee_id INT, name VARCHAR, reports_to INT, age INT)
 Concepts   : Self-Join, GROUP BY, Aggregation (COUNT, AVG)
------------------------------------------------------------

 📝 Problem:
 The "Employees" table contains:
   - employee_id: ID of the employee
   - name: employee's name
   - reports_to: the manager they report to
   - age: employee's age

 Write an SQL query to find:
   - employee_id
   - name
   - reports_count (how many employees report to them)
   - average_age (average age of their direct reports, rounded)

 Return results ordered by employee_id.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT e.employee_id,
       e.name,
       COUNT(r.name) AS reports_count,
       ROUND(AVG(r.age)) AS average_age
FROM Employees e
JOIN Employees r
     ON e.employee_id = r.reports_to
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Self-Join:
--    - Join Employees table (as e = manager, r = report).
--    - Match where r.reports_to = e.employee_id.
--
-- 2. COUNT(r.name) → number of employees reporting to each manager.
-- 3. AVG(r.age) → average age of those employees.
--    ROUND() is used to return whole number average.
-- 4. GROUP BY e.employee_id, e.name → ensures one row per manager.
-- 5. ORDER BY e.employee_id → results sorted by employee ID.
------------------------------------------------------------
