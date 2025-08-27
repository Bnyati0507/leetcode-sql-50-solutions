-- Title: Employee Bonus
-- ID: Q09
-- Difficulty: Easy
-- Concepts: LEFT JOIN, NULL filtering
-- Schema:
--   Employee(empid INT, name VARCHAR)
--   Bonus(empid INT, bonus INT)
-- Problem (paraphrased):
--   - Find employees with either:
--       1. No bonus at all
--       2. A bonus less than 1000
--   - Report employee name and bonus.

-- Solution:
SELECT 
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empid = b.empid
WHERE b.bonus IS NULL OR b.bonus < 1000;

-- Explanation:
--   1. LEFT JOIN ensures all employees appear, even if they have no bonus entry.
--   2. The WHERE clause keeps only:
--        - rows where bonus is NULL (no bonus), or
--        - rows where bonus < 1000.
--   3. Output is employee name with their bonus (NULL if none).
