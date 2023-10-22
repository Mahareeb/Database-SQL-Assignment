use i211564_i212752

--Q20: Find the top 3 products with the highest total sales, including details of the reviews for each product.
SELECT TOP 3 p.productId, p.productName, MAX(oi.orderItem_subamount) AS totalSales, r.reviewId, r.reviewContext,r.reviewRating
FROM Product p
JOIN OrderItem oi ON p.productId = oi.product_id
LEFT JOIN Review r ON p.productId = r.product_id
GROUP BY p.productId, p.productName, r.reviewId,  r.reviewContext,r.reviewRating
ORDER BY totalSales DESC;