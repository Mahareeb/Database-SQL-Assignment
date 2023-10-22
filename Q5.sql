Use i211564_i212752

--Q5: Retrieve products with the highest average ratings
SELECT p.productId, p.productName, AVG(r.reviewRating) AS avgRating
FROM Product p
JOIN Review r ON p.productId = r.product_id
GROUP BY p.productId, p.productName
ORDER BY avgRating DESC;