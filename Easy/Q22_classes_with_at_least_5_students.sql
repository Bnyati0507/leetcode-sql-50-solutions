/*
------------------------------------------------------------
 Title      : Classes With At Least 5 Students
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Courses(student_id INT, class VARCHAR)
 Concepts   : GROUP BY, HAVING, Aggregation
------------------------------------------------------------

 📝 Problem:
 The "Courses" table contains student_id and class.

 Write an SQL query to find all classes that have 
 at least 5 students enrolled.

 Return result table in any order.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(class) >= 5;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. GROUP BY class → groups all students belonging to the same class.
-- 2. COUNT(class) → counts number of students in each class.
-- 3. HAVING COUNT(class) >= 5 → filters classes with at least 5 students.
-- 4. Returns only those class names.
------------------------------------------------------------
