use i211564_i212752

--Q24: Retrieve product categories with the total number of products sold, ordered in descending order by the total number of products sold, and show only categories with more than 10 products sold.
SELECT p.productCatagory, COUNT(oi.orderItem_Id) AS TotalProductsSold
FROM Product p
LEFT JOIN OrderItem oi ON p.productId = oi.product_id
GROUP BY p.productCatagory
HAVING COUNT(oi.orderItem_Id) >= 10 -- >= condition cuz we don't have any product catagory with more than 10 products sold
ORDER BY TotalProductsSold DESC;