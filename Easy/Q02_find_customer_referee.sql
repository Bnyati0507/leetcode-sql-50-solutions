-- Title: Find Customer Referee
-- ID: Q02
-- Difficulty: Easy
-- Concepts: Filtering, NULL handling, Conditional logic
-- Schema:
--   Customer(id INT, name VARCHAR, referee_id INT)
-- Problem (paraphrased):
--   - Write a query to get the names of customers
--   - Who do not have a referee (referee_id IS NULL)
--   - OR whose referee_id is not equal to 2.

-- Solution:
SELECT 
    name
FROM Customer
WHERE referee_id IS NULL 
   OR referee_id != 2;

-- Explanation:
--   - Use `IS NULL` to check customers without any referee.
--   - Use `!= 2` to exclude customers whose referee_id is exactly 2.
--   - Combined with OR → covers both cases.
