use i211564_i212752

--Q16: Retrieve the top 5 products with the highest sales in the last month
SELECT TOP 5 p.productId,p.productName, SUM(oi.orderItem_itemQuantity) AS totalSales 
FROM Product p
JOIN OrderItem oi ON p.productId = oi.product_id
JOIN CustOrder o ON oi.order_id = o.orderId
WHERE o.orderdate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY p.productId,p.productName
ORDER BY totalSales DESC;