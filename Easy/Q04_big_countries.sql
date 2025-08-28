-- Title: Big Countries
-- ID: Q02
-- Difficulty: Easy
-- Concepts: Filtering, OR condition
-- Schema:
--   World(name VARCHAR, continent VARCHAR, area INT, population INT, gdp BIGINT)
-- Problem (paraphrased):
--   - Find the name, population, and area of countries
--   - Where either:
--       1. area >= 3,000,000, OR
--       2. population >= 25,000,000

-- Solution:
SELECT 
    name,
    population,
    area
FROM World
WHERE area >= 3000000 
   OR population >= 25000000;

-- Explanation:
--   - Apply filtering with OR:
--       * Countries with large area, OR
--       * Countries with large population.
--   - Return their name, population, and area only.
