select * from OnlineRetail

-- Analysis Question for Customer Segmentation

-- 1. What is the distribution of order values across all customers in the dataset?
SELECT 
    CustomerID,
    InvoiceNo,
    Sum(Quantity * UnitPrice) as TotalOrderValue
FROM
    OnlineRetail
GROUP BY CustomerID, InvoiceNo


-- 2. How many unique products has each customer purchased?
SELECT 
    CustomerID,
    COUNT(DISTINCT StockCode) as Unique_Product_each_Customer_Purchased
FROM
    OnlineRetail
GROUP BY CustomerID


-- 3. Which customers have only made a single purchase from the company?

SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo )  AS Invoice 
FROM
    OnlineRetail
GROUP BY CustomerID
HAVING Invoice  = 1


-- 4. Which countries generate the most revenue(top 5)?
SELECT 
    Country,
    Sum(Quantity * UnitPrice) as Revenue
FROM
    OnlineRetail
GROUP BY Country
order by  Revenue desc
limit 5


-- 5. Which customers are the most valuable (top 5 spenders)?
SELECT 
    CustomerID,
    Sum(Quantity * UnitPrice) as Customer_Spend
FROM
    OnlineRetail
GROUP BY CustomerID
order by  Customer_Spend desc
limit 5


-- 6. Which products have the highest return rate?
SELECT 
    StockCode,
	InvoiceNo,
    Description,
    SUM(Quantity) AS TotalReturned
FROM 
    OnlineRetail
WHERE 
    InvoiceNo LIKE 'C%'  
GROUP BY 
    StockCode, Description, InvoiceNo
ORDER BY 
    TotalReturned ASC 
LIMIT 10;


-- 7. What are the peak purchasing hours or days?
SELECT 
    HOUR(InvoiceDate) AS Peak_Purchase_Hour,
    COUNT(*) AS Total_Purchases
FROM
    OnlineRetail
GROUP BY Peak_Purchase_Hour
ORDER BY Total_Purchases DESC


-- 8. What are the peak purchasing hours or days?
SELECT 
    DAYNAME(InvoiceDate) AS Peak_Purchase_Days,
    COUNT(*) AS Total_Purchases
FROM
    OnlineRetail
GROUP BY Peak_Purchase_Days
ORDER BY Total_Purchases DESC


