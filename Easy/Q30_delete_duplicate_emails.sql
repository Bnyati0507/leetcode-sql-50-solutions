/*
------------------------------------------------------------
 Title      : Delete Duplicate Emails
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Person(id INT, email VARCHAR)
 Concepts   : DELETE with JOIN, Duplicate Removal
------------------------------------------------------------

 📝 Problem:
 Write an SQL query to delete all duplicate emails, keeping only
 the one with the smallest id for each email.

 After running the query, the Person table should not contain
 duplicate emails.
------------------------------------------------------------
*/

-- ✅ Solution
DELETE P2
FROM Person AS P1
INNER JOIN Person AS P2
  ON P1.email = P2.email
WHERE P1.id < P2.id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. We alias the table twice (P1, P2).
-- 2. We match rows with the same email.
-- 3. For duplicates, the row with the higher id (P2) is deleted.
-- 4. This ensures only the lowest id (first occurrence) remains.
------------------------------------------------------------
