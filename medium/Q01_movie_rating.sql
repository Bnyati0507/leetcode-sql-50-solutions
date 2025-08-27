-- Title: Movie Rating
-- ID: Q01
-- Difficulty: Medium
-- Concepts: JOIN, GROUP BY, ORDER BY, Aggregate Functions, UNION ALL
-- Schema:
--   Users(user_id INT, name VARCHAR)
--   Movies(movie_id INT, title VARCHAR)
--   MovieRating(movie_id INT, user_id INT, rating INT, created_at DATE)
-- Problem (paraphrased):
--   Find:
--   1. The user who rated the most movies (if tie → smallest name).
--   2. The movie with the highest average rating in Feb 2020 (if tie → lexicographically smallest title).
--   Output both as one column `results`.

-- Approach:
--   - Part 1: Join MovieRating → Users, group by user, count ratings, order by count desc + name.
--   - Part 2: Join MovieRating → Movies, filter created_at for Feb 2020, group by movie, order by avg rating desc + title.
--   - Use UNION ALL to stack both results.

-- Solution:
(
    SELECT u.name AS results
    FROM MovieRating r
    JOIN Users u ON r.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(r.user_id) DESC, u.name
    LIMIT 1
)
UNION ALL
(
    SELECT m.title AS results
    FROM MovieRating r
    JOIN Movies m ON r.movie_id = m.movie_id
    WHERE r.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY AVG(r.rating) DESC, m.title
    LIMIT 1
);

-- Explanation:
--   - First query picks the user with the highest number of ratings.
--   - Second query picks the movie with the highest average rating in Feb 2020.
--   - UNION ALL combines them vertically into the required result set.
