-- 1) Вывести телефоны всех поставщиков, кроме тех, что из Germany и France.
SELECT phone
FROM Suppliers
WHERE Country NOT IN ('Germany', 'France')

-- 2) Для товаров до 10 EUR установить категорию 8 и применить наценку в 20%.
UPDATE Products
SET CategoryID = 8, Price = Price * 1.2
WHERE Price <= 10;

-- 3) Удалить поставщиков из USA и Germany.
DELETE FROM Suppliers
WHERE country IN ('USA', 'Germany');

-- 4) Добавить два поставщика из Spain с произвольными номерами телефонов.
INSERT INTO Suppliers (SupplierName, Country, Phone)
VALUES
    ('Coca-Cola', 'Spain', '1234567890'),
    ('Mars', 'Spain', '8456743953');

-- 5) Вывести все товары до 20 EUR из категорий 3 и 6 по убыванию цены.
SELECT *
FROM Products
WHERE CategoryID IN (3, 6) AND price <= 20
ORDER BY Price DESC;

-- 6) Вывести три самых дорогих товара до 200 EUR.
SELECT *
FROM Products
WHERE Price <= 200
ORDER BY Price DESC
LIMIT 3;