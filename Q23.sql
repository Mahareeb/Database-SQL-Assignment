USE i211564_i212752;

SELECT P.productId AS prodID, P.productName AS prodName, P.productCatagory AS prodCategory, OI.orderItem_itemQuantity AS oiQuantity, OI.orderItem_subamount AS oiSubTotal, rev.revofP
FROM (
    SELECT P.productId, SUM(OI.orderItem_subamount) AS revofP
    FROM Product AS P
    LEFT JOIN OrderItem AS OI ON P.productId = OI.product_id
    GROUP BY P.productId
) AS rev
RIGHT JOIN Product AS P ON rev.productId = P.productId
LEFT JOIN OrderItem AS OI ON P.productId = OI.product_id
WHERE P.productCatagory = 'Electronics' AND OI.orderItem_itemQuantity BETWEEN 5 AND 10
ORDER BY rev.revofP DESC;
