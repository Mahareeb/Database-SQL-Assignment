use i211564_i212752

--Q19: List products that have never been reviewed and have quantities in stock greater than zero, along with the average rating for their category.
SELECT p.productId, p.productName, AVG(r.reviewRating) AS AvgCategoryRating
FROM Product p
LEFT JOIN  Review r ON p.productId = r.product_id
WHERE p.product_remainingQuantity > 0 AND r.reviewId IS NULL
GROUP BY p.productId, p.productName;