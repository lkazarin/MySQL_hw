-- 1) Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT ProductName, Price * 1.06 AS Price_usd
FROM products
ORDER BY price DESC
LIMIT 1

-- 2) Вывести два самых дорогих товара из категории Beverages из USA
SELECT Products.ProductName, Products.Price
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Beverages' AND Suppliers.Country = 'USA'
ORDER BY Products.Price DESC
LIMIT 2;

-- 3) Вывести заказы, добавив поле доставлено (или нет), учитывая, 
-- что доставлены только 10248 и 10249
SELECT OrderID, 
CASE 
    WHEN OrderID IN (10248, 10249) THEN 'Yes'
    ELSE 'No'
    END AS Delivered
FROM Orders;

-- 4) Вывести список стран, которые поставляют морепродукты
SELECT Suppliers.Country
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Categories.CategoryID=8

-- 5) Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName = ''
WHERE Country <> 'China';
