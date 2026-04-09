-- 1. DDL Command
-- A. CREATE Command

-- Creating Database using IF NOT EXISTS 
CREATE DATABASE IF NOT EXISTS Logistics_And_Supply;
-- Using Database 
USE Logistics_And_Supply;

-- Creating suppliers Table
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    location VARCHAR(100)
);

-- Inserting Data at suppliers Table
INSERT INTO suppliers(supplier_name, location) VALUES
('Global Supply Co','Delhi'),
('Prime Manufacturers','Mumbai'),
('Rapid Traders','Bangalore'),
('Universal Distributors','Chennai'),
('Metro Wholsale','Kolkata'),
('Smart Components','Hyderabad'),
('Apex Trading','Pune'),
('NextGen Supplies','Surat'),
('Super Industrial Co','Ahmedabad'),
('BlueStar Trading','Jaipur'),
('National Imports','Lucknow'),
('Quality Goods Ltd','Indore'),
('EastWest Traders','Patna'),
('ProPlus Distributors','Bhopal'),
('Brightline Suppliers','Nagpur');

SELECT * 
FROM suppliers 
INNER JOIN products
ON supplier_id = supplier_id;


-- Creating products Table
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    supplier_id INT,
    CONSTRAINT fk_supp1 FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Inserting Data at products Table
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 1),
(102, 'Smartphone', 'Electronics', 1),
(103, 'Office Chair', 'Furniture', 2),
(104, 'Table Lamp', 'Home Decor', 3),
(105, 'Keyboard', 'Electronics', 1),
(106, 'Mouse', 'Electronics', 1),
(107, 'Monitor', 'Electronics', 4),
(108, 'Printer', 'Electronics', 5),
(109, 'Bookshelf', 'Furniture', 2),
(110, 'Coffee Maker', 'Appliance', 6),
(111, 'Ceiling Fan', 'Appliance', 7),
(112, 'Water Bottle', 'Lifestyle', 8),
(113, 'Pen Drive', 'Electronics', 9),
(114, 'Router', 'Electronics', 10),
(115, 'Headphones', 'Electronics', 11);

-- Creating warehouses Table
CREATE TABLE IF NOT EXISTS warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    location VARCHAR(100),
    capacity INT
);

-- Inserting Data at warehouses Table
INSERT INTO warehouses(warehouse_name, location, capacity) VALUES
('Delhi Warehouse', 'Delhi', 12000),
('Mumbai Warehouse', 'Mumbai', 15000),
('Bangalore Warehouse', 'Bangalore', 14000),
('Chennai Warehouse', 'Chennai', 16000),
('Kolkata Warehouse', 'Kolkata', 11000),
('Hyderabad Warehouse', 'Hyderabad', 17000),
('Pune Warehouse', 'Pune', 13000),
('Surat Warehouse', 'Surat', 12500),
('Ahmedabad Warehouse', 'Ahmedabad', 14000),
('Jaipur Warehouse', 'Jaipur', 11500),
('Lucknow Warehouse', 'Lucknow', 9000),
('Indore Warehouse', 'Indore', 10000),
('Patna Warehouse', 'Patna', 8500),
('Bhopal Warehouse', 'Bhopal', 9500),
('Nagpur Warehouse', 'Nagpur', 10500);

-- Creating inventory Table
CREATE TABLE IF NOT EXISTS inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT,
    product_id INT,
    stock_quantity INT,
    last_updated DATE,
    CONSTRAINT fk_ware1 FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    CONSTRAINT fk_prod1 FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserting Data at inventory Table
INSERT INTO inventory(warehouse_id, product_id, stock_quantity, last_updated) VALUES
(1, 101, 450, '2025-01-15'),
(1, 103, 300, '2025-01-18'),
(2, 102, 600, '2025-01-20'),
(3, 104, 180, '2025-01-10'),
(4, 105, 700, '2025-01-12'),
(5, 106, 500, '2025-01-25'),
(6, 107, 200, '2025-01-16'),
(7, 108, 150, '2025-01-11'),
(8, 109, 250, '2025-01-14'),
(9, 110, 320, '2025-01-17'),
(10, 111, 400, '2025-01-19'),
(11, 112, 500, '2025-01-22'),
(12, 113, 350, '2025-01-23'),
(13, 114, 280, '2025-01-21'),
(14, 115, 170, '2025-01-18');

-- Creating orders Table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    order_date DATE,
    quantity INT,
    customer_location VARCHAR(100),
    CONSTRAINT fk_prod2 FOREIGN KEY (product_id) REFERENCES products(product_id),
	CONSTRAINT fk_ware2 FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
    );
    
-- Inserting Data at orders Table
INSERT INTO orders VALUES
(101, 101, 1, '2025-01-22', 20, 'Noida'),
(102, 102, 2, '2025-01-23', 35, 'Pune'),
(103, 103, 1, '2025-01-20', 10, 'Gurgaon'),
(104, 104, 3, '2025-01-18', 15, 'Mysore'),
(105, 105, 4, '2025-01-25', 25, 'Chennai'),
(106, 106, 5, '2025-01-26', 50, 'Kolkata'),
(107, 107, 6, '2025-01-19', 18, 'Hyderabad'),
(108, 108, 7, '2025-01-15', 12, 'Pune'),
(109, 109, 8, '2025-01-12', 9, 'Surat'),
(110, 110, 9, '2025-01-14', 28, 'Ahmedabad'),
(111, 111, 10, '2025-01-10', 32, 'Jaipur'),
(112, 112, 11, '2025-01-09', 22, 'Lucknow'),
(113, 113, 12, '2025-01-13', 14, 'Indore'),
(114, 114, 13, '2025-01-11', 7, 'Patna'),
(115, 115, 14, '2025-01-17', 16, 'Bhopal');

-- SELECT Query 
-- * Use To Print All Data From Table.
SELECT * FROM suppliers;
SELECT * FROM products;
SELECT * FROM warehouses;
SELECT * FROM inventory;
SELECT * FROM customer_orders;

SELECT * FROM customer_orders;

SELECT quantity FROM customer_orders
WHERE quantity = (SELECT quantity FROM customer_orders ORDER BY quantity DESC LIMIT 1 OFFSET 2);


select * From suppliers
JOIN products
ON suppliers.supplier_id = products.supplier_id;


-- DESCRIBE The Structure
DESCRIBE suppliers;
DESCRIBE products;
DESCRIBE warehouses;
DESCRIBE inventory;
DESCRIBE orders;

--  B. ALTER Command
-- I. Write A Query To Adding Rating Column In Suppliers Table.
ALTER TABLE suppliers
ADD rating DECIMAL(3,1);

SELECT * FROM suppliers;

-- II. Write A Query To Modifying Location Column In Warehouses Table.
ALTER TABLE warehouses
MODIFY location VARCHAR(150);

DESCRIBE warehouses;

-- III. Write A Query To Dropping Rating Column In Suppliers Table.
ALTER TABLE suppliers
DROP COLUMN rating;

DESC suppliers;

-- IV. Write A Query To Renaming A Column Product_name To Item_name Trom Product Table
ALTER TABLE products
RENAME COLUMN product_name to item_name;

SELECT * FROM products;

-- V. Write A Query To Renaming A Name Of Table Orders To Customer_orders.
RENAME TABLE orders 
TO customer_orders;

SELECT * FROM customer_orders;

-- 2. DML Command
-- A. Write A Query To Show Name Of Those Warehouse id Who Has More Than 350 Quantity Available.
SELECT warehouse_id FROM inventory
WHERE stock_quantity > 350;

-- B. Write A Query To Update The Category Name Of Product Who Has Appliance To Electrical Household.
UPDATE products
SET category = "Electrical Household"
WHERE category = "Appliance";

SELECT * FROM products;
-- SET SQL_SAFE_UPDATES = 0;

-- C. Write A Query To Delete Those Records Where Order Date Is Between 2025-01-11 To 2025-01-21.
DELETE From customer_orders 
WHERE order_date BETWEEN "2025-01-11" AND "2025-01-21";

SELECT * FROM customer_orders;

-- 3. Adding Constraints 
-- A. Write A Query To Apply Not Null Constraint On Supplier name.
ALTER TABLE suppliers
MODIFY supplier_name VARCHAR(100) NOT NULL;

DESC suppliers;

-- B. Write A Query To Apply Check Contraint On Stock_Quantity 
ALTER TABLE inventory
MODIFY COLUMN stock_quantity INT CHECK (stock_quantity>0);

INSERT INTO inventory VALUES(16,14,115,1,'2025-01-01');

-- 4. SELECT Queries
-- A. Write A Query To Print Order Date and Customer Loction Where Quantity Is Greater Than 15.
SELECT order_date,customer_location FROM customer_orders 
WHERE quantity > 15;

-- B. Write A Query To Add 500 Temperory Quantity On Warehouses. 
SELECT warehouse_id,warehouse_name,location,capacity+500 AS capacity
FROM warehouses;

-- C. Write A Query To ADD 1000 Temperory Quantity Where Location Is Hyderabad, Lucknow, Mumbai And Delhi In The Warehouse.
SELECT warehouse_id,warehouse_name,location,capacity+1000 AS capacity
FROM warehouses
WHERE Location IN('Hyderabad','Lucknow','Mumbai','Delhi');

-- D. Write A Query To Double The Stock Where Date Is 2025-01-11 Or Inventory Id Is 10 In The Inventory. 
SELECT inventory_id,product_id,warehouse_id,stock_quantity*2 AS stock_quantity,last_updated 
FROM inventory
WHERE last_updated = '2025-01-11' OR inventory_id = 10;

-- E. Write A Query To Show Detail Of Those Record Where Stock Quantity Between 200 To 400 In The Inventory.
SELECT * FROM inventory
WHERE stock_quantity BETWEEN 200 AND 400;

-- F. Write A Query To Show Detail Of Those Record Where Stock Quantity Is Not Between 100 To 200 In The Inventory.
SELECT * FROM inventory
WHERE stock_quantity NOT BETWEEN 100 AND 200;

-- G. Write A Query To Show Detail Of Those Record Where Supplier Name Have X in Between.
SELECT * FROM suppliers
WHERE supplier_name LIKE '%x%';

-- H. Write A Query To Show Supplier Id Of Those Record Where Supplier Name End With Co in Between.
SELECT supplier_id FROM suppliers
WHERE supplier_name LIKE '%Co';

-- I. Write A Query To Show Name Of All Categories In The Products Table.
SELECT DISTINCT category FROM products;

-- J. Write A Query To Show All Details In Ascending Order By Date In The Order Table. 
SELECT * FROM customer_orders
ORDER BY order_date ASC;

-- K. Write A Query To Get The Name Of Top 5 Suppliers Name In The Suppliers Table.
SELECT supplier_name FROM suppliers
LIMIT 5;

-- L. Write A Query To Get Top 5 Highest Capacity Warehose Name And No. Capacity. 
SELECT warehouse_name,capacity 
FROM warehouses
ORDER BY capacity DESC
LIMIT 5;

-- M. Write A Query To Show How Many Stock Quantity Available In All Inventorys. 
SELECT SUM(stock_quantity) AS stock_quantity
FROM inventory;

-- N. Write A Query To Show How Many Orders Are There In Orders Table.
SELECT COUNT(*) FROM customer_orders;

-- O. Write A Query To Show The Category Name And The Number Of Products In Each Category From The Products Table.
--    Only Include Categories That Have More Than One Product.
SELECT category,Count(category) AS quantity FROM products
GROUP By category
HAVING COUNT(category)>1;

-- 5. Joins
-- A. Write A Query To Show Total Orders For Each Products. 
SELECT p.item_name, COUNT(o.order_id) AS total
FROM products p
INNER JOIN customer_orders o 
ON p.product_id = o.product_id
GROUP BY p.item_name;

-- B. Write A Query To Show Total Order Quantity Ordered Per Warehouse. 
SELECT w.warehouse_name,SUM(o.quantity) AS Total_Quantity
FROM warehouses w
INNER JOIN customer_orders o
ON w.warehouse_id = o.warehouse_id
GROUP BY  w.warehouse_name;

-- C. Write A Query To Show Supplier-wise Total Product Supply Count.
SELECT s.supplier_name,COUNT(p.category) AS Total_Product_Supplies
FROM suppliers s
LEFT JOIN products p
ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name;

-- D. Write A Query To Show Warehouse-Wise Stock In Inventory.
SELECT w.warehouse_name,SUM(i.stock_quantity) AS Total
FROM warehouses w 
LEFT JOIN inventory i
ON w.warehouse_id = i.warehouse_id
GROUP BY warehouse_name;

-- E. Write A Query To Show The Second Highest Category Using Subquery.
SELECT DISTINCT category FROM products
WHERE category = (SELECT category FROM products ORDER BY category LIMIT 1 OFFSET 1);

-- F. Write A Query To Find Customers Location Who Have Placed And Order Using Subquery.
SELECT customer_location FROM customer_orders
ORDER BY order_id IN(SELECT order_id FROM customer_orders);

-- G. Write A Query To Assign A Unique Serial Number To Each Product Category.
SELECT p.*,
ROW_NUMBER() OVER() AS Unique_Val
FROM products p;

-- H. Write A Query To Assign A Serial Number To Each Product By Category.
SELECT p.*,
ROW_NUMBER() OVER(PARTITION BY category) AS Unique_Cat
FROM products p;

-- I. Write A Query To Perfrom Running Total Of Capacity In The Warehosue. 
SELECT w.*,
SUM(capacity) OVER(ORDER BY capacity) AS running_total
FROM warehouses w;

-- The End --



