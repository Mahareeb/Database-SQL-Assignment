use i211564_i212752

--Q12: List customers who have purchased products from at least two different sellers.
SELECT c.customerId, c.customerName
FROM Customer c
WHERE (
    SELECT COUNT(DISTINCT p.seller_id)
    FROM Product p
    INNER JOIN CustOrder o ON p.productId = o.orderId
    WHERE o.customer_id = c.customerId
) >= 2;