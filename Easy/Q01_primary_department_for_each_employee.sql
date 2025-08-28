-- Title: Primary Department for Each Employee
-- ID: Q01
-- Difficulty: Easy
-- Concepts: Filtering, UNION, NOT IN
-- Schema:
--   Employee(employee_id INT, department_id INT, primary_flag ENUM('Y','N'))
-- Problem (paraphrased):
--   - Each employee can belong to multiple departments.
--   - A department is marked primary if `primary_flag = 'Y'`.
--   - If an employee has a primary department, return that one.
--   - If not, return all departments that employee belongs to.

-- Approach:
--   - Step 1: Select employees who have a primary_flag = 'Y'.
--   - Step 2: For employees without a primary_flag = 'Y',
--             select all their department records.
--   - Step 3: Use UNION to combine results.

-- Solution:
SELECT 
    employee_id,
    department_id
FROM Employee 
WHERE primary_flag = 'Y'

UNION

SELECT 
    employee_id,
    department_id
FROM Employee
WHERE employee_id NOT IN (
    SELECT employee_id 
    FROM Employee
    WHERE primary_flag = 'Y'
);

-- Explanation:
--   - First query returns employees who have a primary department.
--   - Second query returns employees without any 'Y' flag, i.e., no primary department.
--   - UNION merges them into one result set.
