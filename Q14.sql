USE i211564_i212752;

SELECT c.customerId, c.customerName
FROM Customer AS c
WHERE EXISTS (
    SELECT DISTINCT p.productCatagory
    FROM Product AS p
    WHERE NOT EXISTS (
        SELECT 1
        FROM OrderItem AS oi
        LEFT JOIN CustOrder AS o ON oi.order_id = o.orderId
        WHERE oi.product_id = p.productId
        AND o.customer_id = c.customerId
    )
)
