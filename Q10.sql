use i211564_i212752

--Q10: Calculate the total number of orders for each customer and show only those with more than 5 orders.
SELECT c.customerId, COUNT(o.orderId) AS totalOrders
FROM Customer c
LEFT JOIN CustOrder o ON c.customerId = o.customer_id
GROUP BY c.customerId, c.customerName
HAVING COUNT(o.orderId)  > 5; -- We don't have any order id with more than 2 orders so if we change it to 2 we can display a bunch of tables.
-- HAVING COUNT(o.orderId)  >= 2; 

