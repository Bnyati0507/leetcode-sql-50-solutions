/*
------------------------------------------------------------
 Title      : Average Time of Process per Machine
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Activity(machine_id INT, process_id INT, activity_type ENUM('start','end'), timestamp FLOAT)
 Concepts   : Aggregation, CASE WHEN, GROUP BY, CTE
------------------------------------------------------------

 📝 Problem:
 Find the average time each machine takes to complete a 
 process. A process has two rows in Activity:
   - "start" with start timestamp
   - "end" with end timestamp
------------------------------------------------------------
*/

-- ✅ Solution
WITH process_times AS (
    SELECT 
        machine_id,
        process_id,
        MIN(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end'   THEN timestamp END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
)
SELECT 
    machine_id,
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM process_times
GROUP BY machine_id;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. For each machine + process:
--      - take MIN(timestamp) where activity='start'
--      - take MAX(timestamp) where activity='end'
-- 2. Compute (end_time - start_time) for each process.
-- 3. Take the AVG across all processes per machine.
-- 4. Round to 3 decimals.
------------------------------------------------------------
