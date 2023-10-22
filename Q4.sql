Use i211564_i212752

-- Q4: List the top 5 customers who spent the most money
SELECT TOP 5 c.customerName, MAX(o.order_totalamount) AS total_spent -- Selecting top 5 customers who spent the most amount using max function
FROM Customer c
JOIN CustOrder o ON c.customerId = o.customer_id
GROUP BY c.customerName
ORDER BY total_spent DESC;