use i211564_i212752

--Q13: Find customers who have placed an order in the last 30 days.
SELECT c.customerId, c.customerName
FROM Customer c
JOIN CustOrder o ON c.customerId = o.customer_id
WHERE o.orderdate >= DATEADD(day, -30, GETDATE());