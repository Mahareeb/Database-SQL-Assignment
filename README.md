![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/9b1980cc-b037-45b7-90d3-91e60579076a)# i211564_i212752_Assignment_2_CY_T_DB

# SQL Queries
# Implementation and Explanation

# Write 4 Queries Other than this and write their Importance in the Comments why do you think they are important and where can they be used.
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/ea5b4031-a58a-49b5-9e6e-1a0283c42889)

Use i211564_i212752
# --Q3 Write 4 Queries Other than this and write their Importance in the Comments why do you think they are important and where can they be used.
# --1. Retrieve the latest order for each customer
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
