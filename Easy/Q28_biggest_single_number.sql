/*
------------------------------------------------------------
 Title      : Biggest Single Number
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   MyNumbers(num INT)
 Concepts   : GROUP BY, HAVING, Subquery, MAX
------------------------------------------------------------

 📝 Problem:
 The "MyNumbers" table contains integers (num).

 Find the biggest number that appears only once in the table.
 If no such number exists, return NULL.

 Output:
   - num (the largest unique number or NULL if none exist)
------------------------------------------------------------
*/

-- ✅ Solution
SELECT MAX(num) AS num
FROM (
        SELECT num
        FROM MyNumbers
        GROUP BY num
        HAVING COUNT(num) = 1
     ) AS Single;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Use GROUP BY to group identical numbers.
-- 2. HAVING COUNT(num) = 1 → keeps only numbers that appear once.
-- 3. Wrap this in a subquery and take MAX(num) to get the largest unique number.
-- 4. If no number appears only once → result will be NULL automatically.
------------------------------------------------------------
