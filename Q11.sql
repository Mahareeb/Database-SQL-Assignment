use i211564_i212752

-- Q11: Retrieve the 3 most recent orders for a specific customer --> customerid 1
SELECT TOP 3 o.orderId, o.orderNo, o.orderdate, o.order_totalamount
FROM CustOrder o
WHERE o.customer_id = 1
ORDER BY o.orderdate DESC;