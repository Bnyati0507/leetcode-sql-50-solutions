-- Title: Product Sales Analysis I
-- ID: Q08
-- Difficulty: Easy
-- Concepts: INNER JOIN
-- Schema:
--   Sales(product_id INT, year INT, price INT)
--   Product(product_id INT, product_name VARCHAR)
-- Problem (paraphrased):
--   - For each sale, return the product name, the year of the sale, and the price.

-- Solution:
SELECT 
    p.product_name,
    s.year,
    s.price
FROM Sales s
JOIN Product p 
    ON s.product_id = p.product_id;

-- Explanation:
--   - JOIN matches each sale with its product details using product_id.
--   - We output product_name (from Product), year and price (from Sales).
--   - Since every sale has a valid product, INNER JOIN is sufficient.
