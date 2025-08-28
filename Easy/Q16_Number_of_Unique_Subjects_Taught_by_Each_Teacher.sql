/*
------------------------------------------------------------
 Title      : Number of Unique Subjects Taught by Each Teacher
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Teacher(teacher_id INT, subject_id INT, dept_id INT)
 Concepts   : GROUP BY, COUNT(DISTINCT), Aggregation
------------------------------------------------------------

 📝 Problem:
 Write an SQL query to report the number of unique subjects each teacher teaches.

 Return result table in any order.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT teacher_id,
       COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Group rows by teacher_id → one row per teacher.
-- 2. Use COUNT(DISTINCT subject_id) → avoid duplicate subjects.
-- 3. Output = number of unique subjects taught per teacher.
------------------------------------------------------------
