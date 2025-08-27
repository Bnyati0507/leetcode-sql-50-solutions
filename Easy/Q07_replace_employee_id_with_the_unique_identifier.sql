-- Title: Replace Employee ID With The Unique Identifier
-- ID: Q06
-- Difficulty: Easy
-- Concepts: LEFT JOIN
-- Schema:
--   Employees(id INT, name VARCHAR)
--   EmployeeUNI(id INT, unique_id INT)
-- Problem (paraphrased):
--   - Replace each employee's ID with their unique identifier (if available).
--   - If no match exists, show NULL for unique_id.

-- Solution:
SELECT
    eu.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu 
    ON e.id = eu.id;

-- Explanation:
--   - LEFT JOIN ensures all employees are included, even if they don’t have a unique_id.
--   - If an employee has no match in EmployeeUNI, `unique_id` will appear as NULL.
