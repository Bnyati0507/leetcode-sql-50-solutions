/*
------------------------------------------------------------
 Title      : Find Followers Count
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Followers(user_id INT, follower_id INT)
 Concepts   : GROUP BY, COUNT(), ORDER BY
------------------------------------------------------------

 📝 Problem:
 The "Followers" table contains:
   - user_id: ID of the user
   - follower_id: ID of the follower

 Write an SQL query to find the number of followers 
 for each user, ordered by user_id.

 Return result table with:
   - user_id
   - followers_count
------------------------------------------------------------
*/

-- ✅ Solution
SELECT user_id,
       COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. GROUP BY user_id → groups all rows for each user.
-- 2. COUNT(follower_id) → counts how many followers each user has.
-- 3. ORDER BY user_id → sorts the result by user ID.
-- 4. DISTINCT is not needed since GROUP BY already ensures one row per user.
------------------------------------------------------------
