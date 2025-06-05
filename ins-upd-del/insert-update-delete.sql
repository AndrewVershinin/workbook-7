USE northwind;
-- 1. Add a new supplier.
INSERT INTO suppliers
(`CompanyName`,
`ContactName`,
`ContactTitle`,
`Address`,
`City`,
`Region`,
`PostalCode`,
`Country`,
`Phone`,
`Fax`,
`HomePage`)
VALUES (
    'Example Supplier Inc.',
    'Andrei Cucumber',
    'Sales Manager',
    '123 Example Street',
    'Pittsburgh',
    'PA',
    '15201',
    'USA',
    '412-123-4567',
    '412-123-4568',
    'http://example.com'
);

-- 2. Add a new product provided by that supplier
INSERT INTO `northwind`.`products`
(`ProductName`,
`SupplierID`,
`CategoryID`,
`QuantityPerUnit`,
`UnitPrice`,
`UnitsInStock`,
`UnitsOnOrder`,
`ReorderLevel`,
`Discontinued`)
VALUES
('Cucumber Soda',
    30,
    1,
    '12 bottles x 1L',
    12.50,
    50,
    0,
    10,
    0);

-- 3. List all products and their suppliers.
SELECT p.ProductID,
    p.ProductName,
    p.UnitPrice,
    p.QuantityPerUnit,
    s.CompanyName
FROM products p 
JOIN suppliers s ON p.SupplierID = s.SupplierID;
-- 4. Raise the price of your new product by 15%.
UPDATE products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductName = 'Cucumber Soda';
-- 5. List the products and prices of all products from that supplier.
SELECT p.ProductID,
    p.ProductName,
    p.UnitPrice,
    p.QuantityPerUnit,
    s.CompanyName
FROM products p 
JOIN suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierID = 30;
    
-- 6. Delete the new product.
DELETE FROM products
WHERE ProductName = 'Cucumber Soda';
-- 7. Delete the new supplier.
DELETE FROM suppliers
WHERE SupplierID = 30;
-- 8. List all products.
SELECT ProductName,
		UnitPrice
FROM products;
-- 9. List all suppliers.
SELECT CompanyName
FROM suppliers;