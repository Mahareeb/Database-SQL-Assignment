use i211564_i212752

--Q22: Write a SQL query to retrieve the total number of products and the total revenue for each product category. Include products that may not have been sold. Additionally, order the product in descending order based on total revenue.
SELECT p.productId, p.productName, COUNT(P.productId) AS TotalProducts, SUM(OI.orderItem_subamount) AS TotalRevenue
FROM Product p
LEFT JOIN OrderItem oi ON P.productId = oi.product_id
GROUP BY p.productId, p.productName
ORDER BY TotalRevenue DESC;