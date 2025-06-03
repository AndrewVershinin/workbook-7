
-- 1. How many suppliers are there? Use a query!
SELECT count(*)
FROM suppliers;
-- answer is 29
-- 2. What is the sum of all the employee's salaries?
SELECT round(SUM(Salary))
FROM employees;
-- answer is 20363
-- 3. What is the price of the cheapest item that Northwind sells?
SELECT round(MIN(UnitPrice))
FROM products;
-- answer is 2.5
-- 4. What is the average price of items that Northwind sells?
SELECT round(AVG(UnitPrice))
FROM products;
-- answer is 28.8
-- 5. What is the price of the most expensive item that Northwind sells?
SELECT round(MAX(UnitPrice))
FROM products;
-- answer is 264
-- 6. What is the supplier ID of each supplier and the number of items they
-- supply? You can answer this query by only looking at the Products table.
SELECT SupplierID, count(UnitPrice)
FROM products
GROUP BY SupplierID;
-- 7. What is the category ID of each category and the average price of each item
-- in the category? You can answer this query by only looking at the Products
-- table.
SELECT CategoryID, AVG(UnitPrice)
FROM products
GROUP BY CategoryID;
-- 8. For suppliers that provide at least 5 items to Northwind, what is the
-- supplier ID of each supplier and the number of items they supply? You
-- can answer this query by only looking at the Products table.
SELECT SupplierID, COUNT(*) AS items
FROM products
GROUP BY SupplierID
HAVING items >= 5;
-- 9. List the product id, product name, and inventory value (calculated by
-- multiplying unit price by the number of units on hand). Sort the results in
-- descending order by value. If two or more have the same value, order by
-- product name.
SELECT ProductID, 
	ProductName, 
	ROUND(SUM((UnitPrice * UnitsInStock)), 2) AS InventoryValue
FROM products
GROUP BY ProductID
ORDER BY InventoryValue DESC, ProductName ASC;
