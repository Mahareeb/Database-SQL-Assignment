use i211564_i212752

-- Q15: Calculate the total number of products sold by each seller
SELECT s.sellerId, s.sellerName, COUNT(DISTINCT oi.product_id) AS totalProductsSold
FROM Seller s
LEFT JOIN Product p ON s.sellerId = p.seller_id
LEFT JOIN OrderItem oi ON p.productId = oi.product_id
GROUP BY s.sellerId, s.sellerName
ORDER BY totalProductsSold DESC;