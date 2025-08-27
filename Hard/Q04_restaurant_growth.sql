-- Title: Restaurant Growth
-- ID: Q04
-- Difficulty: Hard
-- Concepts: Rolling Window, Date Functions, Subqueries, Aggregation
-- Schema:
--   Customer(customer_id INT, name VARCHAR, visited_on DATE, amount INT)
-- Problem (paraphrased):
--   - A restaurant tracks daily revenue from customers in table `Customer`.
--   - Compute the 7-day rolling sum and average revenue for each day starting from the 7th day.
--   - Output columns: visited_on, amount (7-day sum), average_amount (7-day average, 2 decimal places).
--   - Results should be ordered by visited_on.

-- Approach:
--   - For each `visited_on`, calculate total amount in the past 7 days (inclusive).
--   - Use `DATE_SUB` to define a 7-day window (current day - 6 days).
--   - Average = (7-day sum / 7), rounded to 2 decimals.
--   - Start from the earliest date + 6 days (to ensure complete 7-day window).
--   - Use correlated subqueries inside SELECT.

-- Solution:
SELECT
    c.visited_on,
    -- 7-day rolling sum
    (SELECT SUM(amount)
     FROM Customer
     WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    -- 7-day rolling average
    ROUND(
        (SELECT SUM(amount) / 7
         FROM Customer
         WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
        ), 2
    ) AS average_amount
FROM Customer c
WHERE c.visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
    FROM Customer
)
GROUP BY c.visited_on
ORDER BY c.visited_on;

-- Explanation:
--   - For each date, two subqueries compute rolling SUM and AVG over the last 7 days.
--   - `DATE_SUB` ensures the 7-day window is correctly defined.
--   - The WHERE clause ensures results start only after day 7 (first full window).
--   - Output shows both rolling sum and average per day, in chronological order.
