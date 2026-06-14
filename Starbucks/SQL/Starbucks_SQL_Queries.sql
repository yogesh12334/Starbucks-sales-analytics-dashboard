CREATE DATABASE starbucks_project;
USE starbucks_project;
-- This query shows counts
SELECT COUNT(*) FROM starbucks;

-- This query shows Duplicate Records
SELECT transaction_id,
COUNT(*) FROM starbucks
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- This query shows duplicate table 
CREATE TABLE starbucks_backup AS
SELECT * FROM starbucks;

-- This query shows duplicate values remove
DELETE s1
FROM starbucks s1
JOIN starbucks s2
ON s1.transaction_id = s2.transaction_id
AND s1.id > s2.id;

-- This query check duplicate values after delete duplicate
SELECT transaction_id,
       COUNT(*) AS duplicate_count
FROM starbucks
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- This query check null values
SELECT *
FROM starbucks
WHERE Transaction_ID IS NULL
   OR Order_Date IS NULL
   OR Customer_ID IS NULL
   OR Store_Location IS NULL
   OR Product_Category IS NULL
   OR Product_Name IS NULL
   OR Quantity IS NULL
   OR Unit_Price IS NULL
   OR Total_Bill IS NULL;
   
-- This query Check Negative Values
SELECT *
FROM starbucks
WHERE Quantity <= 0
   OR Unit_Price <= 0
   OR Total_Bill <= 0;
   
-- This query check verify Total Bill
SELECT * FROM starbucks
WHERE Total_Bill <> Quantity * Unit_Price;

-- This query check Total Revenue
SELECT SUM(Total_Bill) AS Total_Revenue
FROM starbucks;

-- This query check Total Orders
SELECT COUNT(Transaction_Id) AS Total_Orders
FROM starbucks;

-- This query check Total Quantity Sold
SELECT SUM(Quantity) AS Total_product_Sold
FROM starbucks;

-- This query check Revenue by Store Location
SELECT Store_Location,
SUM(Total_Bill) AS Revenue
FROM starbucks
GROUP BY Store_Location
ORDER BY Revenue DESC;

-- This query check Revenue by Product Category
SELECT Product_Category,
SUM(Total_Bill) AS Revenue
FROM starbucks
GROUP BY Product_category
ORDER BY Revenue DESC;

-- This query check Products by Revenue
SELECT Product_Name,
SUM(Total_Bill) AS Revenue
FROM starbucks
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;

-- This query check Products by Quantity
SELECT Product_Name,
SUM(Quantity) AS Total_Quantity
FROM starbucks
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 10;

-- This query check Most Sold Products by Quantity
SELECT Product_Name,
SUM(Quantity) AS Total_Quantity
FROM starbucks
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 10;

-- This query check Average Order Value
SELECT AVG(Total_Bill) AS Average_Order_Value
FROM starbucks;

-- This query check Daily Sales Trend
SELECT MONTH(Order_Date) AS Month_No,
SUM(Total_Bill) AS Revenue
FROM starbucks
GROUP BY MONTH(Order_Date)
ORDER BY Month_No;

-- This query check Top 5 Customers by Spending
SELECT Customer_Id,
SUM(Total_Bill) AS Total_Spent	
FROM starbucks
GROUP BY Customer_Id
ORDER BY Total_Spent DESC
LIMIT 5;

-- This query check Average Revenue per Store
SELECT Store_Location,
AVG(Total_Bill) AS Avg_Revenue
FROM starbucks
GROUP BY Store_Location
ORDER BY Avg_Revenue DESC;

-- This query check Category-wise Quantity Sold
SELECT Product_Category,
SUM(Quantity) AS Quantity_Sold
FROM starbucks
GROUP BY Product_Category
ORDER BY Quantity_Sold DESC;

SHOW DATABASES;