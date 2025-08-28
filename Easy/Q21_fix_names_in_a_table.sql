/*
------------------------------------------------------------
 Title      : Fix Names in a Table
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Users(user_id INT, name VARCHAR)
 Concepts   : String Functions, CONCAT, UPPER, LOWER, SUBSTRING
------------------------------------------------------------

 📝 Problem:
 The "Users" table contains user_id and name.
 Names may contain both uppercase and lowercase characters
 in an inconsistent way.

 Write an SQL query to fix the names so that only the first 
 character is uppercase and the rest are lowercase.

 Return result ordered by user_id.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT user_id,
       CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. UPPER(LEFT(name, 1)) → takes the first letter and converts it to uppercase.
-- 2. LOWER(SUBSTRING(name, 2)) → takes the rest of the string (from 2nd char onwards)
--    and converts it to lowercase.
-- 3. CONCAT(...) → joins them to form the corrected name.
-- 4. ORDER BY user_id → ensures results are sorted by user_id.
------------------------------------------------------------
