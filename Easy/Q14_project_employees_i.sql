 -- Title: Project Employees I
-- ID: Q14
-- Difficulty: Easy
-- Concepts: Window Functions, Aggregation, JOIN
-- Schema:
--   Project(project_id INT, employee_id INT)
--   Employee(employee_id INT, experience_years INT)
-- Problem (paraphrased):
--   - For each project, find the average years of experience of all employees in it.
--   - Output project_id and average_years (rounded to 2 decimals).

-- Solution using window functions:
SELECT DISTINCT 
       p.project_id,
       ROUND(
           SUM(e.experience_years) OVER (PARTITION BY p.project_id) * 1.0 
           / COUNT(p.project_id) OVER (PARTITION BY p.project_id),
           2
       ) AS average_years
FROM Project p
JOIN Employee e
     ON p.employee_id = e.employee_id;

-- Explanation:
-- 1. JOIN Project with Employee → match employees to projects.
-- 2. SUM(experience_years) OVER (PARTITION BY project_id) → total experience in a project.
-- 3. COUNT(project_id) OVER (PARTITION BY project_id) → number of employees in that project.
-- 4. Divide SUM/COUNT → average years of experience.
-- 5. ROUND(..., 2) → round to 2 decimal places.
-- 6. DISTINCT → removes duplicate rows caused by window functions repeating values.

-- Alternative solution using GROUP BY (simpler, same result):
 SELECT p.project_id,
 ROUND(AVG(e.experience_years), 2) AS average_years
 FROM Project p
 JOIN Employee e ON p.employee_id = e.employee_id
 GROUP BY p.project_id;
