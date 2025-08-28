-- Title: The Number of Employees Which Report to Each Employee
-- Difficulty: Easy
-- Concepts: Self Join, Aggregation, Group By
-- Schema:
--   Employees(employee_id INT, name VARCHAR, reports_to INT, age INT)
-- Problem (paraphrased):
--   - Each employee may report to another employee (manager).
--   - For every employee who has direct reports, return:
--       * employee_id
--       * name
--       * number of employees reporting to them (reports_count)
--       * average age of these employees (average_age, rounded)
--   - Output should be ordered by employee_id.

-- Approach:
--   - Step 1: Perform a self join of Employees table:
--             * `e` represents the manager.
--             * `r` represents the employee who reports to `e`.
--   - Step 2: Group by manager’s employee_id to calculate:
--             * COUNT(r.name) → number of direct reports.
--             * AVG(r.age) → average age of direct reports.
--   - Step 3: Use ROUND() to round average age.
--   - Step 4: Order by employee_id.

-- Solution:
SELECT DISTINCT 
    e.employee_id,
    e.name,
    COUNT(r.name) AS reports_count,
    ROUND(AVG(r.age)) AS average_age
FROM Employees e
JOIN Employees r
    ON e.employee_id = r.reports_to
GROUP BY e.employee_id
ORDER BY 1;

-- Explanation:
--   - Self join links employees with their manager.
--   - COUNT(r.name) gives the total number of direct reports.
--   - AVG(r.age) computes average report age, rounded using ROUND().
--   - DISTINCT ensures unique rows, though GROUP BY handles this already.
--   - Results are sorted by employee_id as required.
