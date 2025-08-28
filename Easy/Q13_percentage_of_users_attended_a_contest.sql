-- Title: Percentage of Users Attended a Contest
-- ID: Q13
-- Difficulty: Easy
-- Concepts: Window functions, Aggregation, Percentage calculation
-- Schema:
--   Users(user_id INT, user_name VARCHAR)
--   Register(contest_id INT, user_id INT)
-- Problem (paraphrased):
--   - We want the percentage of users who registered for each contest.
--   - Percentage = (Number of users in a contest / Total users) * 100.
--   - Output ordered by percentage DESC, then contest_id ASC.

-- Solution:
SELECT DISTINCT
       contest_id,
       ROUND(
           COUNT(user_id) OVER (PARTITION BY contest_id) * 100.0
           /(SELECT COUNT(*) FROM Users), 
           2
       ) AS percentage
FROM Register
ORDER BY percentage DESC, contest_id;

-- Explanation:
-- 1. COUNT(user_id) OVER (PARTITION BY contest_id) → gives us the number of users per contest.
-- 2. (SELECT COUNT(*) FROM Users) → total number of users in the platform.
-- 3. Multiply by 100 → percentage of users per contest.
-- 4. ROUND(..., 2) → round percentage to 2 decimal places.
-- 5. DISTINCT → prevents duplicate contest_id rows (since window function repeats values).
-- 6. ORDER BY → highest participation first, then contest_id.
