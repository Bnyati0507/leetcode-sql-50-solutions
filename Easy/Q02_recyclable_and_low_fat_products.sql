-- Title: Recyclable and Low Fat Products
-- ID: Q01
-- Difficulty: Easy
-- Concepts: Filtering, WHERE clause
-- Schema:
--   Products(product_id INT, low_fats ENUM('Y','N'), recyclable ENUM('Y','N'))
-- Problem (paraphrased):
--   - Find product_ids of products that are both low fat and recyclable.

-- Solution:
SELECT 
    product_id
FROM Products
WHERE low_fats = 'Y' 
  AND recyclable = 'Y';

-- Explanation:
--   - Apply filtering with WHERE on both conditions:
--       1. low_fats = 'Y'
--       2. recyclable = 'Y'
--   - Return only the product_id of qualifying products.
