Use i211564_i212752

--Q6: Find customers who have made more than one purchase on the same day
SELECT c.customerId, c.customerName, o1.orderId, o1.orderdate
FROM Customer c
INNER JOIN CustOrder o1 ON c.customerId = o1.customer_id
WHERE EXISTS  --  existence of rows in a subquery <existence of other orders by the same customer on the same day. >
(
    SELECT 1
    FROM CustOrder o2
    WHERE o1.customer_id = o2.customer_id -- mapping IDs
      AND o1.orderId <> o2.orderId -- not equal to 
      AND o1.orderdate = o2.orderdate  -- same date
)
ORDER BY c.customerId, o1.orderdate;