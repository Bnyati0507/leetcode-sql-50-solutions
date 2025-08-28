/*
------------------------------------------------------------
 Title      : Customers Who Bought All Products
 Platform   : LeetCode (SQL 50)
 Difficulty : Medium
 Schema     :
   Customer(customer_id INT, product_key INT)
   Product(product_key INT)
 Concepts   : GROUP BY, HAVING, Subquery, COUNT DISTINCT
------------------------------------------------------------

 📝 Problem:
 Write a query to find the customer_id of customers who bought
 all the products in the Product table.
------------------------------------------------------------
*/

-- ✅ Solution
SELECT 
    customer_id
FROM 
    Customer
GROUP BY 
    customer_id
HAVING 
    COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product);

------------------------------------------------------------
-- 💡 Explanation:
-- 1. First, find the total number of products: SELECT COUNT(product_key) FROM Product.
-- 2. For each customer_id, count distinct products they bought.
-- 3. If that count equals the total number of products → they bought all.
------------------------------------------------------------
