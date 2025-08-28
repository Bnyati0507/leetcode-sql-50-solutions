/*
------------------------------------------------------------
 Title      : Department Top Three Salaries
 Platform   : LeetCode (SQL 50)
 Difficulty : Medium
 Schema     :
   Employee(id INT, name VARCHAR, salary INT, departmentId INT)
   Department(id INT, name VARCHAR)
 Concepts   : Window Functions, DENSE_RANK, CTE, Partitioning
------------------------------------------------------------

 📝 Problem:
 Given Employee and Department tables, write a query to find
 the top 3 highest salaries in each department. 

 If multiple employees have the same salary within a department,
 include them as well (use DENSE_RANK logic).

 Return result with columns:
   - Department
   - Employee
   - Salary
------------------------------------------------------------
*/

-- ✅ Solution
WITH high AS (
    SELECT d.name AS Department,
           e.name AS Employee,
           e.salary AS Salary,
           DENSE_RANK() OVER (
               PARTITION BY d.name
               ORDER BY e.salary DESC
           ) AS rnk
    FROM Employee e
    JOIN Department d
      ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM high
WHERE rnk <= 3;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. Use JOIN to connect Employee and Department.
-- 2. Apply DENSE_RANK() partitioned by Department,
--    ordered by Salary (descending).
-- 3. rnk = 1 → highest salary, rnk = 2 → second, rnk = 3 → third.
-- 4. Filter only rows where rnk <= 3.
-- 5. This ensures ties are included (e.g., two employees with same salary).
------------------------------------------------------------
