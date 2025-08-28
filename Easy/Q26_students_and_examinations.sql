/*
------------------------------------------------------------
 Title      : Students and Examinations
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Students(student_id INT, student_name VARCHAR)
   Subjects(subject_name VARCHAR)
   Examinations(student_id INT, subject_name VARCHAR)
 Concepts   : CROSS JOIN, LEFT JOIN, GROUP BY
------------------------------------------------------------

 📝 Problem:
 The "Students" table has student info.
 The "Subjects" table has all subjects.
 The "Examinations" table records which student took which subject exam.

 Write an SQL query to report:
   - student_id
   - student_name
   - subject_name
   - attended_exams (number of times the student attended the subject exam)

 Show results ordered by student_id and subject_name.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT s.student_id,
       s.student_name,
       sub.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
       ON s.student_id = e.student_id
      AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. CROSS JOIN Students × Subjects → ensures every student-subject pair appears.
-- 2. LEFT JOIN with Examinations → brings exam records if they exist.
-- 3. COUNT(e.subject_name) → counts how many times a student took that subject.
-- 4. GROUP BY student_id, student_name, subject_name → ensures unique rows.
-- 5. ORDER BY student_id, subject_name → matches required output order.
------------------------------------------------------------
