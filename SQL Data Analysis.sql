CREATE TABLE sales (

    OrderID VARCHAR(20) PRIMARY KEY,

    Date DATE,

    CustomerID VARCHAR(20),

    Product VARCHAR(50),

    Quantity INT,

    UnitPrice NUMERIC(10,2),

    ShippingAddress TEXT,

    PaymentMethod VARCHAR(30),

    OrderStatus VARCHAR(30),

    TrackingNumber VARCHAR(50),

    ItemsInCart INT,

    CouponCode VARCHAR(30),

    ReferralSource VARCHAR(50),

    TotalPrice NUMERIC(10,2)

);
SELECT * FROM sales;

--Selecting particular columns--
SELECT product,quantity,totalprice
FROM sales;

--Select data where payment method is Cash--
SELECT * FROM sales
WHERE paymentmethod='Cash';

--Select data where product=monitor--
SELECT * FROM sales
WHERE product='Monitor';

--Arrange data according to ascending order of total price--
SELECT * FROM sales
ORDER BY totalprice;

SELECT Product,
COUNT(*) AS TotalOrders
FROM sales
GROUP BY Product;

SELECT paymentmethod,
COUNT(*) AS Transactions
FROM sales
GROUP BY paymentmethod;

SELECT COUNT(*) AS TotalOrders
FROM sales;

SELECT SUM(TotalPrice) AS TotalRevenue
FROM sales;

SELECT AVG(TotalPrice) AS AverageOrderValue
FROM sales;

--Top 5 higher value orders--
SELECT OrderID, Product, TotalPrice
FROM sales
ORDER BY TotalPrice DESC
LIMIT 5;

--Revenue by product--
SELECT Product,
SUM(TotalPrice) AS TotalRevenue
FROM sales
GROUP BY Product
ORDER BY TotalRevenue DESC;

--Average quantity sold per product--
SELECT Product,
AVG(Quantity) AS AverageQuantity
FROM sales
GROUP BY Product
ORDER BY AverageQuantity DESC;

--Payment with more than 170 orders--
SELECT Product,
COUNT(*) AS Orders
FROM sales
GROUP BY Product
HAVING COUNT(*) > 170;

--Customers using coupon--
SELECT CouponCode,
COUNT(*) AS UsageCount
FROM sales
GROUP BY CouponCode
ORDER BY UsageCount DESC;

--Percentage contribution of each payment method--
SELECT
    PaymentMethod,
    COUNT(*) AS Orders,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales), 2) AS Percentage
FROM sales
GROUP BY PaymentMethod
ORDER BY Percentage DESC;

--Higher value orders >1000--
SELECT OrderID,
Product,
TotalPrice
FROM sales
WHERE TotalPrice > 1000
ORDER BY TotalPrice DESC;

--Referral Source Analysis--
SELECT ReferralSource,
COUNT(*) AS Customers
FROM sales
GROUP BY ReferralSource
ORDER BY Customers DESC;
