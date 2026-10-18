---Question 1 Create a Database:
/* As per Tina's request forgone creating a database since a database 
 with a similar name was already created in a previous assignment
 */

---Question 2 Develop Tables for Products and Sales with Specific Fields
---Question 2.a: Product Table

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Category TEXT
);

---Question 2.b: Sales Table
CREATE TABLE Sales (
    SaleID INTEGER PRIMARY KEY,
    SaleDate DATE,
    QuantitySold INTEGER
);

ALTER TABLE Sales
ADD COLUMN ProductID INTEGER;

---Question 3 Insert Values into Products and Sales 
---Question 3.a: Products
INSERT INTO Products (ProductID, ProductName, Category)
VALUES
    (1, 'Laptop', 'Electronics'),
    (2, 'Smartphone', 'Electronics'),
    (3, 'Coffee Maker', 'Appliances'),
    (4, 'Running Shoes', 'Apparel');

---Question 3.b Sales
INSERT INTO Sales (SaleID, ProductID, SaleDate, QuantitySold)
VALUES
    (1, 1, '2023-01-05', 10),
    (2, 2, '2023-01-10', 15),
    (3, 3, '2023-01-15', 8),
    (4, 4, '2023-01-20', 12),
    (5, 1, '2023-02-05', 14),
    (6, 2, '2023-02-12', 18),
    (7, 3, '2023-02-18', 9),
    (8, 4, '2023-02-25', 16),
    (9, 1, '2023-03-06', 20),
    (10, 2, '2023-03-11', 22),
    (11, 3, '2023-03-16', 13),
    (12, 4, '2023-03-24', 18),
    (13, 1, '2023-04-05', 16),
    (14, 2, '2023-04-10', 24),
    (15, 3, '2023-04-18', 11),
    (16, 4, '2023-04-28', 19),
    (17, 1, '2023-05-07', 21),
    (18, 2, '2023-05-12', 28),
    (19, 3, '2023-05-19', 15),
    (20, 4, '2023-05-26', 22),
    (21, 1, '2023-06-04', 18),
    (22, 2, '2023-06-13', 26),
    (23, 3, '2023-06-21', 14),
    (24, 4, '2023-06-29', 20),
    (25, 1, '2024-01-06', 24),
    (26, 2, '2024-01-11', 30),
    (27, 3, '2024-01-17', 16),
    (28, 4, '2024-01-23', 25),
    (29, 1, '2024-02-04', 26),
    (30, 2, '2024-02-09', 32),
    (31, 3, '2024-02-15', 18),
    (32, 4, '2024-02-21', 27),
    (33, 1, '2024-03-03', 28),
    (34, 2, '2024-03-10', 35),
    (35, 3, '2024-03-18', 20),
    (36, 4, '2024-03-26', 29),
    (37, 1, '2024-04-05', 25),
    (38, 2, '2024-04-13', 34),
    (39, 3, '2024-04-19', 19),
    (40, 4, '2024-04-27', 31),
    (41, 1, '2024-05-06', 30),
    (42, 2, '2024-05-14', 38),
    (43, 3, '2024-05-20', 22),
    (44, 4, '2024-05-29', 33),
    (45, 1, '2024-06-04', 27),
    (46, 2, '2024-06-12', 36),
    (47, 3, '2024-06-18', 21),
    (48, 4, '2024-06-25', 32),
    (49, 1, '2024-06-28', 29),
    (50, 2, '2024-06-30', 40);

---Question 4 Calculate Total Sales
SELECT DISTINCT
    p.ProductName,
    SUM(s.QuantitySold) OVER (
        PARTITION BY s.ProductID
    ) AS TotalSales
FROM Sales s
JOIN Products p
    ON s.ProductID = p.ProductID;

---Question 5 Analyze the monthly sales trend over the past years
SELECT DISTINCT
    strftime('%Y', SaleDate) AS SalesYear,
    strftime('%m', SaleDate) AS SalesMonth,
    SUM(QuantitySold) OVER (
        PARTITION BY strftime('%Y-%m', SaleDate)
    ) AS MonthlySales,
    SUM(QuantitySold) OVER (
        ORDER BY strftime('%Y-%m', SaleDate)
    ) AS RunningTotal
FROM Sales
ORDER BY SalesYear, SalesMonth;

---Question 6 Identify the top N products with the highest total sales
WITH ProductSales AS (
    SELECT
        p.ProductID,
        p.ProductName,
        SUM(s.QuantitySold) AS TotalSales
    FROM Products p
    JOIN Sales s
        ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.ProductName
),
RankedProducts AS (
    SELECT
        ProductID,
        ProductName,
        TotalSales,
        RANK() OVER (
            ORDER BY TotalSales DESC
        ) AS SalesRank
    FROM ProductSales
)
SELECT
    ProductID,
    ProductName,
    TotalSales,
    SalesRank
FROM RankedProducts
WHERE SalesRank <= 4
ORDER BY SalesRank;