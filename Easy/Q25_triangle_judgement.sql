/*
------------------------------------------------------------
 Title      : Triangle Judgement
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Triangle(x INT, y INT, z INT)
 Concepts   : CASE, Conditional Logic
------------------------------------------------------------

 📝 Problem:
 The "Triangle" table contains three side lengths (x, y, z).

 Write an SQL query to report whether these sides can form a triangle.
 
 Conditions for a valid triangle:
   - x + y > z
   - y + z > x
   - z + x > y

 Return result with columns:
   - x, y, z
   - triangle ('Yes' if valid, 'No' otherwise)
------------------------------------------------------------
*/

-- ✅ Solution
SELECT x, y, z,
       CASE
         WHEN x + y > z 
          AND y + z > x 
          AND z + x > y THEN 'Yes'
         ELSE 'No'
       END AS triangle
FROM Triangle;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. A triangle is valid only if the sum of any two sides 
--    is greater than the third side.
-- 2. Use CASE to check conditions:
--    - If all three conditions are satisfied → 'Yes'.
--    - Otherwise → 'No'.
-- 3. Return x, y, z, and the result.
------------------------------------------------------------
