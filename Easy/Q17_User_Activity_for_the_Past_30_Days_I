-- Title: User Activity for the Past 30 Days I
-- ID: Q16
-- Difficulty: Easy
-- Concepts: Date Filtering, COUNT(DISTINCT), GROUP BY
-- Schema:
--   Activity(user_id INT, session_id INT, activity_date DATE, activity_type ENUM)
-- Problem (paraphrased):
--   - For each day in the 30-day period ending July 27, 2019 (inclusive),
--     count the number of unique users who were active on that day.
--   - Return each day and its active user count.

-- Solution:
SELECT
  activity_date AS day,
  COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

-- Explanation:
-- 1. WHERE clause filters rows to only include the required 30-day range.
-- 2. GROUP BY activity_date aggregates data day-by-day.
-- 3. COUNT(DISTINCT user_id) provides the count of unique users active that day.
-- 4. Alias `day` and `active_users` make the output clear.

-- Note:
-- Dates with zero active users typically won’t appear (since no rows exist),
-- but that’s acceptable as per problem requirements.
