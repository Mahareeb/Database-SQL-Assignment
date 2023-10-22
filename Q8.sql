Use i211564_i212752

--Q8: List customers who have not reviewed any products
SELECT c.customerId, c.customerName
FROM Customer c
LEFT JOIN Review r ON c.customerId = r.customer_id
WHERE r.customer_id IS NULL;