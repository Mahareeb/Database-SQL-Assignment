use i211564_i212752

--Q18: Retrieve customers who have made purchases in every product category, along with the total number of categories they have purchased from.
SELECT c.customerId, c.customerName, COUNT(DISTINCT p.productCatagory) AS TotalCategoriesPurchased
FROM Customer c
JOIN CustOrder o ON c.customerId = o.customer_id
JOIN OrderItem oi ON o.orderId = oi.order_id
JOIN Product p ON oi.product_id = p.productId
GROUP BY c.customerId, c.customerName
HAVING COUNT(DISTINCT p.productCatagory) = (SELECT COUNT(DISTINCT productCatagory) FROM Product)