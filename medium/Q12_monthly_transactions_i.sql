-- Title: Monthly Transactions I
-- Difficulty: Medium
-- Concepts: Aggregation, Group By, Conditional Sums, Date Formatting
-- Schema:
--   Transactions(id INT, country VARCHAR, state ENUM('approved','declined'),
--                amount INT, trans_date DATE)
-- Problem (paraphrased):
--   - For each country and month:
--       * Count total number of transactions.
--       * Count number of approved transactions.
--       * Sum the total transaction amount.
--       * Sum the approved transaction amount.
--   - Output should include:
--       * month (YYYY-MM format)
--       * country
--       * trans_count
--       * approved_count
--       * trans_total_amount
--       * approved_total_amount
--   - Results should be ordered by month, then country.

-- Approach:
--   - Step 1: Use DATE_FORMAT(trans_date, '%Y-%m') to group by month.
--   - Step 2: COUNT(*) → total number of transactions.
--   - Step 3: SUM(state = 'approved') → number of approved transactions.
--   - Step 4: SUM(amount) → total transaction amount.
--   - Step 5: SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) 
--             → total approved transaction amount.
--   - Step 6: Group by month and country, and order by them.

-- Solution:
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY 
    DATE_FORMAT(trans_date, '%Y-%m'),
    country
ORDER BY
    month, country;

-- Explanation:
--   - DATE_FORMAT groups transactions by year-month.
--   - COUNT(*) counts all rows (transactions).
--   - SUM(state = 'approved') works as a boolean counter for approved transactions.
--   - SUM(amount) gives total transaction value.
--   - SUM(CASE WHEN ...) isolates only approved amounts.
--   - Results sorted by month, then country.
