-- Title: Customer Who Visited but Did Not Make Any Transactions
-- ID: Q09
-- Difficulty: Easy
-- Concepts: LEFT JOIN, NULL filtering, GROUP BY
-- Schema:
--   Visits(visit_id INT, customer_id INT)
--   Transactions(transaction_id INT, visit_id INT, amount INT)
-- Problem (paraphrased):
--   - Find customers who visited but made no transactions.
--   - Report their customer_id and the count of such visits.

-- Solution:
SELECT 
    V.customer_id, 
    COUNT(V.visit_id) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions T 
    ON V.visit_id = T.visit_id
WHERE T.transaction_id IS NULL
GROUP BY V.customer_id;

-- Explanation:
--   1. LEFT JOIN keeps all visits, even if no matching transaction exists.
--   2. The WHERE condition filters visits where transaction_id is NULL 
--      (i.e., no transaction happened).
--   3. We count how many such visits each customer made.
