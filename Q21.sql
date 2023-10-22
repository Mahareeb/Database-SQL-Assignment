use i211564_i212752

--Q21: Retrieve all customers who have placed orders, and include details of their orders, even for orders with no associated customers. Include information about the shipping addresses for each order. 
SELECT c.customerId, c.customerName, c.customerEmail, co.orderId, co.orderNo, co.orderdate, 
	   a.addressId, a.addressLines, a.addresscity,a.addressState, a.address_zipcode, a.addresscountry
FROM Customer AS c
LEFT JOIN CustOrder AS co ON c.customerId = co.customer_id
LEFT JOIN CustAddress AS a ON co.address_id = a.addressId;