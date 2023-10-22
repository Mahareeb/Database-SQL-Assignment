use i211564_i212752

-- Q25: Retrieve customers with the total number of orders they have placed, ordered in descending order by the total number of orders, and show only customers who have placed more than 5 orders.
SELECT c.customerId, c.customerName, COUNT(co.orderId) AS TotalOrdersPlaced
FROM Customer c
LEFT JOIN CustOrder co ON c.customerId = co.customer_id
GROUP BY c.customerId, c.customerName
HAVING COUNT(co.orderId) > 5 -- Will work if 2 else won't show output cuz that's how our databse is
ORDER BY TotalOrdersPlaced DESC;