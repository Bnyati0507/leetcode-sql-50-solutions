/*
------------------------------------------------------------
 Title      : Queries Quality and Percentage
 Platform   : LeetCode (SQL 50)
 Difficulty : Easy
 Schema     :
   Queries(query_name VARCHAR, result VARCHAR, position INT, rating INT)
 Concepts   : Window Functions, Aggregation, CASE, ROUND()
------------------------------------------------------------

 📝 Problem:
 Each row of the Queries table contains:
   - query_name: the name of the query
   - result: search result
   - position: the position of the result (1 = top)
   - rating: user rating (1-5)

 We need to calculate for each query_name:
   1. quality = average of (rating / position), rounded to 2 decimals
   2. poor_query_percentage = percentage of queries with rating < 3,
      rounded to 2 decimals
------------------------------------------------------------
*/

-- ✅ Solution (Using Window Functions)
SELECT DISTINCT query_name,
       ROUND(AVG(rating / position) OVER (PARTITION BY query_name), 2) AS quality,
       ROUND(
         AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) OVER (PARTITION BY query_name) * 100.0, 
         2
       ) AS poor_query_percentage
FROM Queries;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. For each query_name:
--    - AVG(rating / position) → gives "quality".
--    - AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 → 
--      gives percentage of poor queries.
-- 2. ROUND(..., 2) ensures results are rounded to 2 decimals.
-- 3. DISTINCT is needed because window functions return 
--    multiple rows per query_name otherwise.

------------------------------------------------------------
