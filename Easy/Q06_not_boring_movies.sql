-- Title: Not Boring Movies
-- ID: Q05
-- Difficulty: Easy
-- Concepts: Filtering, Modulo, Ordering
-- Schema:
--   Cinema(id INT, movie VARCHAR, description VARCHAR, rating FLOAT)
-- Problem (paraphrased):
--   - Find all movies with:
--       1. Odd ID numbers
--       2. Description not equal to 'boring'
--   - Sort the results by rating in descending order.

-- Solution:
SELECT 
    id,
    movie,
    description,
    rating
FROM Cinema
WHERE id % 2 = 1 
  AND description != 'boring'
ORDER BY rating DESC;

-- Explanation:
--   - `id % 2 = 1`: selects only odd IDs.
--   - `description != 'boring'`: filters out boring movies.
--   - `ORDER BY rating DESC`: ensures top-rated movies appear first.
