
#Sales Performance
#What is the total sales revenue?
SELECT SUM(TotalPRice) AS total_revenue
FROM sales;
#What is the total number of orders/transactions?
SELECT COUNT(OrderID) as Total_Orders
FROM sales;
#What is the average order value (AOV)?
SELECT AVG(TotalPrice) AS Average_Order_value
FROM sales;
#Which products generate the most revenue?
SELECT Product, SUM(TotalPrice) as Total_Revenue
FROM sales
GROUP BY Product
ORDER BY Total_Revenue DESC;
#Which products have the highest number of units sold?
SELECT Product, SUM(Quantity) AS Total_Unit_Sold
FROM sales
GROUP BY Product
ORDER BY Total_Unit_Sold DESC
LIMIT 1;
#Which products have the lowest sales?
SELECT Product, SUM(TotalPrice) as Total_sales
FROM sales
GROUP BY Product
ORDER BY Total_sales ASC
LIMIT 1;
#Which product categories generate the most revenue?
SELECT Product, SUM(TotalPrice) as Total_Revenue
FROM sales
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 1;
#What percentage of total revenue comes from each category?
SELECT Product,
SUM(TotalPrice) AS Product_Revenue,
SUM(TotalPrice)/ (SELECT SUM(TotalPrice)FROM Sales) * 100 AS Rev_Percentage
FROM sales
GROUP BY Product
ORDER BY Rev_Percentage DESC;
#Which products contribute the most to overall sales?
SELECT Product,
SUM(TotalPrice) AS Product_Revenue,
SUM(TotalPrice)/ (SELECT SUM(TotalPrice)FROM Sales) * 100 AS Rev_Percentage
FROM sales
GROUP BY Product
ORDER BY Rev_Percentage DESC
LIMIT 5;
#What is the monthly sales trend?
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(TotalPrice) AS Monthly_Sales
FROM sales
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year DESC, Month DESC;