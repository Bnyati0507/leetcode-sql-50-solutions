/*
------------------------------------------------------------
 Title      : Rising Temperature
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Weather(id INT, recordDate DATE, temperature INT)
 Concepts   : Self Join, Date Functions
------------------------------------------------------------

 📝 Problem:
 Find all `id`s of weather records where the temperature
 was higher compared to the previous day.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT w1.id
FROM Weather w1
JOIN Weather w2
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Self-join Weather table:
--      - w1 = current day
--      - w2 = previous day
-- 2. Use DATEDIFF(w1.recordDate, w2.recordDate) = 1
--    to ensure w2 is exactly 1 day before w1.
-- 3. Filter where current day's temperature > previous day's.
-- 4. Return only w1.id as required.
------------------------------------------------------------
