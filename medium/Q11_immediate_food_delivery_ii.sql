/*
------------------------------------------------------------
 Title      : Immediate Food Delivery II
 Platform   : LeetCode (SQL 50)
 Difficulty : Medium
 Schema     :
   Delivery(delivery_id INT, customer_id INT,
            order_date DATE, customer_pref_delivery_date DATE)
 Concepts   : Window Functions, FIRST_VALUE, Aggregation
------------------------------------------------------------

 📝 Problem:
 A delivery is considered "immediate" if the `order_date`
 equals the `customer_pref_delivery_date`.
 For each customer, check if their **first order** was
 immediate or not, and compute the percentage of customers
 whose first order was immediate.
------------------------------------------------------------
*/

-- ✅ Solution
WITH CustomerToIsImmediate AS (
    SELECT DISTINCT
        customer_id,
        FIRST_VALUE(order_date = customer_pref_delivery_date)
            OVER (PARTITION BY customer_id ORDER BY order_date) AS is_immediate
    FROM Delivery
)
SELECT 
    ROUND(AVG(is_immediate) * 100, 2) AS immediate_percentage
FROM CustomerToIsImmediate;

------------------------------------------------------------
-- 💡 Explanation:
-- 1. For each customer, order their deliveries by `order_date`.
-- 2. Use FIRST_VALUE() to check if their first order was
--    immediate (order_date = pref_delivery_date).
--    → returns 1 if true, 0 if false.
-- 3. Take DISTINCT (customer_id) to avoid duplicates.
-- 4. Finally, calculate percentage:
--        avg(is_immediate) * 100
--    Rounded to 2 decimals.
------------------------------------------------------------
