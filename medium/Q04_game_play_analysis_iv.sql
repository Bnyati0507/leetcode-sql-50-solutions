-- Title: Game Play Analysis IV
-- Difficulty: Medium
-- Concepts: CTE, JOIN, DATEDIFF, Aggregates
-- Schema:
--   Activity(player_id INT, device_id INT, event_date DATE, games_played INT)
-- Problem (paraphrased):
--   - For each player, identify their first login date.
--   - Find the fraction of players who logged in again on the day 
--     immediately after their first login.
--   - Round the result to 2 decimal places.

-- Approach:
--   - Step 1: Use a CTE (Players) to get each player's first login date.
--   - Step 2: Join back with Activity to check if that player also logged in
--             on first_login + 1 day (i.e., DATEDIFF = -1 when subtracting).
--   - Step 3: Count how many such players exist.
--   - Step 4: Divide by total number of distinct players for fraction.
--   - Step 5: Round result to 2 decimal places.

-- Solution:
WITH Players AS (
    SELECT 
        player_id, 
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)
SELECT 
    ROUND(
        COUNT(Players.player_id) * 1.0 / 
        (SELECT COUNT(DISTINCT player_id) FROM Activity), 
        2
    ) AS fraction
FROM Players
JOIN Activity
  ON Players.player_id = Activity.player_id
 AND DATEDIFF(Activity.event_date, Players.first_login) = 1;

-- Explanation:
--   - The CTE finds the earliest login date for each player.
--   - The JOIN checks if there exists an activity record exactly 1 day later.
--   - COUNT of such players ÷ total unique players gives the required fraction.
--   - ROUND formats to 2 decimal places.
