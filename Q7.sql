Use i211564_i212752

--Q7 Calculate the total revenue for each product
SELECT productCatagory, SUM(productPrice * orderItem_itemQuantity) AS TotalRevenue
FROM Product
INNER JOIN OrderItem ON Product.productId = OrderItem.product_id
GROUP BY productCatagory
