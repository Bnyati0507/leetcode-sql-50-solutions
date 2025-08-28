/*
------------------------------------------------------------
 Title      : Employees Whose Manager Left the Company
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Employees(employee_id INT, name VARCHAR, manager_id INT, salary INT)
 Concepts   : Self-Join, LEFT JOIN, NULL filtering
------------------------------------------------------------

 📝 Problem:
 The "Employees" table contains:
   - employee_id: employee’s ID
   - name: employee’s name
   - manager_id: ID of their manager
   - salary: employee’s salary

 Write an SQL query to find employees who:
   - earn less than 30000,
   - have a manager (manager_id IS NOT NULL),
   - but their manager no longer works at the company
     (manager_id not found in Employees table).

 Return their employee_id in ascending order.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m
       ON e.manager_id = m.employee_id
WHERE e.salary < 30000
  AND e.manager_id IS NOT NULL
  AND m.employee_id IS NULL
ORDER BY e.employee_id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. LEFT JOIN Employees (e = employee, m = manager).
-- 2. Condition m.employee_id IS NULL → means manager not found in table.
-- 3. Add filters:
--    - e.salary < 30000 (low-salary employees).
--    - e.manager_id IS NOT NULL (they had a manager).
-- 4. Return employee_id of such employees, sorted.
------------------------------------------------------------
