-- Title: Patients With a Condition
-- ID: Q11
-- Difficulty: Easy
-- Concepts: String pattern matching, LIKE operator
-- Schema:
--   Patients(patient_id INT, patient_name VARCHAR, conditions VARCHAR)
-- Problem (paraphrased):
--   - Each patient has a list of conditions stored in a string.
--   - We need to return all patients who have the condition code 'DIAB1'.
--   - 'DIAB1' can appear at the start of the conditions string OR after a space.

-- Solution:
SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%'     -- case when 'DIAB1' is the first condition
   OR conditions LIKE '% DIAB1%';  -- case when 'DIAB1' appears after a space

-- Explanation:
--   1. The LIKE operator is used for pattern matching.
--   2. 'DIAB1%' matches any string starting with 'DIAB1'.
--   3. '% DIAB1%' matches 'DIAB1' when it appears later in the list (with a space before).
--   4. Combining both ensures we catch all patients with this condition.
