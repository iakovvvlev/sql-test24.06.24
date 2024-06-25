DROP DATABASE IF EXISTS `mytest`;
CREATE DATABASE `mytest`;
USE `mytest`;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID VARCHAR(5) PRIMARY KEY,
    CompanyName VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into the Customers table
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Country) VALUES 
('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico'),
('ANTON', 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', 'Mexico'),
('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK'),
('BERGS', 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', 'Sweden'),
('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany'),
('BLONP', 'Blondesddsl père et fils', '24 place Kléber', 'StrasbourgCity', 'France'),
('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil 67', 'MadridCity', 'Spain');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(5),
    OrderDate DATE,
    OrderSum DECIMAL(10, 2)
);

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderSum) VALUES 
(10355, 'AROUT', '1996-11-15', 10000),
(10365, 'ANTON', '1996-11-27', 15000),
(10381, 'LILAS', '1996-12-12', 20000),
(10436, 'BLONP', '1997-02-05', 17500),
(10442, 'ERNSH', '1997-02-11', 20000),
(10449, 'BLONP', '1997-02-18', 10000),
(10453, 'AROUT', '1997-02-21', 15000);

-- Запрос для вывода названий всех компаний, не выполнивших заказ с 15.11.1996 по 18.02.1997
SELECT c.CompanyName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID 
    AND o.OrderDate BETWEEN '1996-11-15' AND '1997-02-18'
WHERE o.OrderID IS NULL;
