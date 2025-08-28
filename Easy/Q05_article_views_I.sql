-- Title: Article Views I
-- ID: Q05
-- Difficulty: Easy
-- Concepts: DISTINCT, Filtering, Sorting
-- Schema:
--   Views(article_id INT, author_id INT, viewer_id INT, view_date DATE)
-- Problem (paraphrased):
--   - Find all the authors who viewed their own articles.
--   - Output distinct author IDs only, sorted in ascending order.

-- Solution:
SELECT DISTINCT 
    author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;

-- Explanation:
--   - Compare `author_id` with `viewer_id` to find cases where 
--     the author read their own article.
--   - Use DISTINCT to avoid duplicates.
--   - ORDER BY ensures ascending order in results.
