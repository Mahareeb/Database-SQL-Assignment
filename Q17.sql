use i211564_i212752

--Q17: Retrieve the latest 5 orders with customer details and order items
SELECT TOP 5 c.customerName, o.orderId, o.orderDate, p.productName, oi.orderItem_itemQuantity, oi.orderItem_subamount
FROM Customer c
JOIN CustOrder o ON c.customerId = o.customer_id
JOIN OrderItem oi ON o.orderId = oi.order_id
JOIN Product p ON oi.product_id = p.productId
ORDER BY o.orderDate DESC;