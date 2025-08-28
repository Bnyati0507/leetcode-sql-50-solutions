/*
------------------------------------------------------------
 Title      : Confirmation Rate
 Platform   : LeetCode (SQL 50)
 Difficulty : Medium
 Schema     :
   Signups(user_id INT, time_stamp DATETIME)
   Confirmations(user_id INT, time_stamp DATETIME, action ENUM('confirmed','timeout'))
 Concepts   : CTE, LEFT JOIN, Aggregation, Division, COALESCE
------------------------------------------------------------

 📝 Problem:
 Write a query to find the confirmation rate of each user.
 The confirmation rate is the number of confirmed messages 
 divided by the total number of messages (confirmed + timeout).
 Round the result to 2 decimal places. If a user has no 
 confirmations, return 0.00.
------------------------------------------------------------
*/

-- ✅ Solution
WITH stats AS (
    SELECT 
        user_id,
        SUM(action = 'confirmed') AS confirmed_count,
        COUNT(*) AS total_count
    FROM Confirmations
    GROUP BY user_id
)
SELECT 
    s.user_id,
    COALESCE(ROUND(confirmed_count / total_count, 2), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN stats st
    ON s.user_id = st.user_id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. CTE `stats` counts total confirmations and how many were confirmed.
-- 2. Join with `Signups` ensures every user is included (even those 
--    with no confirmations).
-- 3. Division gives the confirmation rate, rounded to 2 decimals.
-- 4. COALESCE ensures missing users get 0.00 instead of NULL.
------------------------------------------------------------
