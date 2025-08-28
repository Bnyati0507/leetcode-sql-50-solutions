/*
------------------------------------------------------------
 Title      : Count Salary Categories
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Accounts(account_id INT, income INT)
 Concepts   : Aggregation, UNION
------------------------------------------------------------

 📝 Problem:
 The "Accounts" table stores each account's income.

 Write an SQL query to categorize accounts into 3 salary groups:
   - "Low Salary"     → income < 20000
   - "Average Salary" → 20000 <= income <= 50000
   - "High Salary"    → income > 50000

 Output:
   - category
   - accounts_count
------------------------------------------------------------
*/

-- ✅ Solution
SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION ALL
SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION ALL
SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Break incomes into 3 ranges (low, average, high).
-- 2. Run 3 separate COUNT queries for each category.
-- 3. Combine results using UNION ALL.
-- 4. Each row shows the category name and count of accounts.
------------------------------------------------------------
