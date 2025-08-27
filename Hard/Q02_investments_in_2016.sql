 -- Title: Investments in 2016
-- ID: Q05
-- Difficulty: Hard
-- Concepts: GROUP BY, HAVING, Aggregates, Filtering by Multiple Conditions
-- Schema:
--   Insurance(pid INT, tiv_2015 FLOAT, tiv_2016 FLOAT, lat FLOAT, lon FLOAT)
-- Problem (paraphrased):
--   - Each row represents a policyholder with:
--       * pid: policy ID
--       * tiv_2015: total investment value in 2015
--       * tiv_2016: total investment value in 2016
--       * (lat, lon): location of the policyholder
--   - Find the total investment in 2016 (`tiv_2016`) for policyholders who:
--       1. Have a `tiv_2015` value that occurs more than once (duplicate in 2015).
--       2. Have a unique location `(lat, lon)` (appears only once in the dataset).
--   - Return the sum of qualifying `tiv_2016`, rounded to 2 decimals.

-- Approach:
--   - Step 1: Use GROUP BY + HAVING on tiv_2015 to filter values with count > 1.
--   - Step 2: Use GROUP BY + HAVING on (lat, lon) to keep only unique locations.
--   - Step 3: Filter insurance records satisfying both conditions.
--   - Step 4: SUM the tiv_2016 values and round to 2 decimals.

-- Solution:
SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);

-- Explanation:
--   - The first subquery picks tiv_2015 values that appear in more than one record.
--   - The second subquery ensures we only select rows with unique (lat, lon).
--   - The main query sums tiv_2016 for rows satisfying both filters.
--   - ROUND ensures the result is formatted to 2 decimal places.
