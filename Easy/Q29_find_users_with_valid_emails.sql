/*
------------------------------------------------------------
 Title      : Find Users With Valid E-Mails
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Users(user_id INT, name VARCHAR, mail VARCHAR)
 Concepts   : REGEXP_LIKE, String Pattern Matching, Filtering
------------------------------------------------------------

 📝 Problem:
 Write an SQL query to find users whose emails are valid.
 A valid email:
   1. Begins with a letter.
   2. May contain letters, numbers, dots (.), underscores (_), or dashes (-).
   3. Must end with "@leetcode.com".

 Return all columns from the Users table for only those valid users.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT * 
FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$', 'c');

------------------------------------------------------------
-- 💡 Explanation:
-- 1. REGEXP_LIKE(mail, 'pattern', 'c') checks if the email matches regex:
--      ^[a-zA-Z]               → must start with a letter
--      [a-zA-Z0-9._-]*         → can have letters, numbers, ., _, or -
--      @leetcode\\.com$        → must end with "@leetcode.com"
-- 2. 'c' flag → makes it case-sensitive.
-- 3. Only valid emails are returned, keeping all user details intact.
------------------------------------------------------------
