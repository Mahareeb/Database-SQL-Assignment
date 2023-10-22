Use i211564_i212752

--Q3 Write 4 Queries Other than this and write their Importance in the Comments why do you think they are important and where can they be used.
--1. Retrieve the latest order for each customer
SELECT c.customerId, c.customerName, MAX(o.orderDate) AS latest_order_date
FROM Customer c
LEFT JOIN CustOrder o ON c.customerId = o.customer_id
GROUP BY c.customerId, c.customerName;

--2. List products with no sales
SELECT p.productId, p.productName
FROM Product p
LEFT JOIN OrderItem oi ON p.productId = oi.product_id
WHERE oi.orderItem_Id IS NULL;

--3. Retrieve a list of all base tables within that database
SELECT table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE';

--4. Retrieve a list of all unique product categories
SELECT DISTINCT productCatagory
FROM Product;




