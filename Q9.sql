Use i211564_i212752

-- Q9: Find products with quantities below the average quantity in stock
SELECT p.productId, p.productName, p.product_remainingQuantity, AVG(i.inventory_quantityInStock)
FROM Product p
JOIN Inventory i ON p.productId = i.product_id
GROUP BY p.productId, p.productName, p.product_remainingQuantity
HAVING p.product_remainingQuantity < AVG(i.inventory_quantityInStock);