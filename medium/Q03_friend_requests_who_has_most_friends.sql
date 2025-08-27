-- Title: Friend Requests II - Who Has the Most Friends
-- ID: Q03
-- Difficulty: Medium
-- Concepts: UNION ALL, CTE, GROUP BY, Aggregate Functions
-- Schema:
--   RequestAccepted(requester_id INT, accepter_id INT)
-- Problem (paraphrased):
--   - Each row represents a friendship (bidirectional) between `requester_id` and `accepter_id`.
--   - Find the person with the most total friends.
--   - If multiple users tie, return any (LeetCode handles tie-breaking).

-- Approach:
--   1. Use UNION ALL to combine both requester_id and accepter_id into a single column (since friendship is two-way).
--   2. Count how many times each user_id appears (total friends).
--   3. Order by count DESC to get the user with the most friends.
--   4. LIMIT 1 to return only the top user.

-- Solution:
WITH all_friends AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT 
    id,
    COUNT(id) AS num
FROM all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;

-- Explanation:
--   - CTE `all_friends` collects all user_ids from both requester and accepter columns.
--   - GROUP BY counts how many friends each user has.
--   - ORDER BY picks the highest count, LIMIT 1 returns the user with the max friends.
