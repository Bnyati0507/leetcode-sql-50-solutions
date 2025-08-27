 -- Title: Employees Whose Manager Left the Company
-- ID: Q08
-- Difficulty: Easy
-- Concepts: Self-Join, NULL handling, Filtering
-- Schema:
--   Employees(employee_id INT, name VARCHAR, manager_id INT, salary INT)
-- Problem (paraphrased):
--   - Find employees whose salary < 30000.
--   - Their manager_id is not null (i.e., they have a manager).
--   - But their manager does not exist in the Employees table (left the company).
--   - Return employee_id in ascending order.

-- Approach:
--   - Perform a LEFT JOIN of Employees e (employee) with Employees m (manager).
--   - If m.employee_id IS NULL after join → manager is missing.
--   - Filter salary < 30000 and manager_id IS NOT NULL.
--   - Order by employee_id.

-- Solution:
SELECT 
    e.employee_id
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.employee_id
WHERE e.salary < 30000 
  AND e.manager_id IS NOT NULL
  AND m.employee_id IS NULL
ORDER BY e.employee_id;

-- Explanation:
--   - LEFT JOIN ensures we bring back all employees, even if their manager_id doesn’t match.
--   - If the join result m.employee_id IS NULL → manager record missing.
--   - We filter out employees without managers (manager_id IS NULL).
--   - Only employees earning < 30000 are considered.
