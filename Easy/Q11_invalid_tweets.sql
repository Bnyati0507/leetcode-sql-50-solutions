-- Title: Invalid Tweets
-- ID: Q10
-- Difficulty: Easy
-- Concepts: String functions, Filtering
-- Schema:
--   Tweets(tweet_id INT, content VARCHAR)
-- Problem (paraphrased):
--   - A tweet is invalid if its content length > 15 characters.
--   - Return tweet_id of all invalid tweets.

-- Solution:
SELECT 
    tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

-- Explanation:
--   1. LENGTH(content) gives the number of characters in the tweet.
--   2. We filter for only those rows where this length > 15.
--   3. Output is the tweet_id of such invalid tweets.
