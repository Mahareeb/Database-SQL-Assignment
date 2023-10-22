E-commerce System 
Relational Model For ER-Diagram

i.	Customer has an Address:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/75c1495c-f1a2-4a59-80fa-6f496c979217)
 
Customer(CustomerID, FName, LName, Email, PhoneNo, Password)
Address(addressID, CustomerID, addressLines, Country, City, State, zipCode, isShipping, isBilling)
Note:
o	CustomerID in the Address Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: Each customer can have multiple addresses associated with them, but each address belongs to only one customer.
o	Minimum Participation: A customer will have at least 1 address associated with them and if there exist an address, then it belongs to at least 1 customer.

ii.	Customer leaves a Review:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/722baf5a-1d17-4536-b6ad-3f35f2f919ea)

Customer(CustomerID, FName, LName, Email, PhoneNo, Password)
Review(ReviewID, CustomerID, Context, Rating, Date)
Note:
o	CustomerID in the Review Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One customer can leave multiple reviews, but one review can be associated with or left by only one customer.  
o	Minimum Participation: A customer can leave 0 reviews at minimum but, if there exists a review, then it must be left by least 1 customer. 

iii.	Customer creates an Order:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/34b928b3-fb99-42e7-919f-c3af697e1a1f)

Customer(CustomerID, FName, LName, Email, PhoneNo, Password)
Order(OrderID, OrderNo, CustomerID, Date, TotalAmount)
Note:
o	CustomerID in the Order Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One customer can place multiple orders, but a single order can be placed by at most only 1 customer.
o	Minimum Participation: A customer can at minimum place 0 orders while if there exists an order, then it must be placed by at least 1 customer.  


iv.	Order consists of OrderItem:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/4dd62738-904e-46a9-9686-a6d047063594)

Order(OrderID, OrderNo, Date, TotalAmount)
OrderItem(OrderItemID, OrderID, subAmount, itemQuantity)
Note:
o	OrderID in the OrderItem Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One order can consist of multiple OrderItems, but an OrderItem can be associated to a single order.
o	Minimum Participation: An order must have at least 1 OrderItem in it. Similarly, if there exists an OrderItem, then it must be associated to at least 1 order.

v.	OrderItem has a Product:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/508ad60d-6009-4fa6-b477-3456c712a764)

OrderItem(OrderItemID, ProductID, subAmount, itemQuantity)
Product(ProductID, Name, Description, Price, Rating, QuantityLeft)
Note:
o	ProductID in the OrderItem Table cannot be NULL.
Explanation + Business Rules (optional):
o	Maximum Cardinality: One product can belong to multiple OrderItems while a single OrderItem can only be associated to one product.
o	Minimum Participation: If an OrderItem exists, then it must have at least 1 product associated with it. If a product exists, it is not necessary that it is part of an OrderItem.

vi.	Customer creates a ShoppingCart:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/afceadf1-3b6f-45c2-ad62-7821bbd67f52)

Customer(CustomerID, FName, LName, Email, PhoneNo, Password)
ShoppingCart(CartID, CustomerID)
Note:
o	CustomerID in the ShoppingCart Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One customer can create at most one ShoppingCart and one ShoppingCart can belong to only one customer.
o	Minimum Participation: A customer can at minimum create 0 ShoppingCart and if there exists a ShoppingCart, then it must belong to at least 1 customer.

vii.	ShoppingCart consists of CartItems:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/dd2162ae-848c-48eb-b9c4-9d9e39fd7d24)

ShoppingCart(CartID)
CartItem(CartItemID, CartID, ItemQuantity)
Note:
o	CartID in the CartItem Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One ShoppingCart can consist of multiple CartItems, but a single CartItem can belong to only 1 ShoppingCart.
o	Minimum Participation: A ShoppingCart can at minimum consist of 0 CartItems while if there exists a CartItem, then it must belong to a ShoppingCart.

viii.	CartItem has a Product:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/26a52975-544c-41f9-bd90-02a3366ba949)

CartItem(CartItemID, ProductID, ItemQuantity)
Product(ProductID, Name, Description, Price, Rating, QuantityLeft)
Note:
o	ProductID in the CartItem Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One product can belong to multiple CartItems while a single CartItem can only have one product associated with it.
o	Minimum Participation: If a CartItem exists, then it must have at least 1 product associated with it. And if a product exists, then it is not necessary that it is part of a CartItem.


ix.	Order has a Payment:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/d76e27d0-3cb8-4ab9-926c-a90fe1a6fa8d)

Order(OrderID, OrderNo, Date, TotalAmount)
Payment(PaymentID, OrderID, TotalAmount, PayMethod, PayDate)
Note:
o	OrderID in the Payment Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One order can at most have only 1 payment and a payment can belong to only 1 order.
o	Minimum Participation: If there exists an order, then at minimum it can have 0 payment associated with it. Similarly, if there exists a payment, then it must be associated to at least 1 order.

x.	Order is shipped to an Address:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/c5043a2f-6781-40a2-8c0b-20cb2b8c72b2)

Order(OrderID, OrderNo, addressID, Date, TotalAmount)
Address(addressID, addressLines, Country, City, State, zipCode, isShipping, isBilling)
Note:
o	addressID in the Order Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One order can at most be shipped to only 1 address but an address can have multiple orders shipped on it.
o	Minimum Participation: If there exists an order, then at minimum it will have 1 address it is being shipped to. Similarly, if there exists an address, then it must be associated to at least 1 order.

xi.	Product has a Review:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/404aed7a-99b7-4642-a606-e9a2bdcde549)
 
Product(ProductID, Name, Description, Price, Rating, QuantityLeft)
Review(ReviewID, ProductID, Context, Rating, Date)
Note:
o	ProductID in the Review Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One Product can have multiple reviews, but one review can be associated with or belong to only one product.  
o	Minimum Participation: A product can have 0 reviews at minimum but if there exists a review, then it must belong to at least 1 product. 

xii.	Product is part of an Inventory:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/0962c67b-1f08-4d15-9ebd-d0f15be946f6)

Product(ProductID, Name, Description, Price, Rating, QuantityLeft)
Inventory (InventoryID, ProductID, StockQuantity, StockUpdateDate, reorderThreshold, UnitCost)
Note:
o	ProductID in the Inventory Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One Product can be a part of multiple inventories, but one inventory at most can have only one product.  
o	Minimum Participation: If there exists a product, then at minimum it is a part of at least 1 inventory and an inventory at minimum must have at least one product.

xiii.	Product is added by a Seller:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/84a8e211-7ff6-437c-b9ab-eae0681c8c0c)
 
Product(ProductID, SellerID, Name, Description, Price, Rating, QuantityLeft)
Seller (SellerID, FName, LName, Email, Phone, Address)
Note:
o	SellerID in the Product Table cannot be NULL.

Explanation + Business Rules (optional):
o	Maximum Cardinality: One seller can add multiple products, but a single product can be added by only 1 seller.
o	Minimum Participation: If there exists a product, then it must have at least one seller associated with it while a seller can add at minimum 0 products. 









SQL Queries
Implementation and Explanation

3.	Write 4 Queries Other than this and write their Importance in the Comments why do you think they are important and where can they be used.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/37a1d5e1-d275-400a-b39e-9016052cf845)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/2da2d148-3397-4f2f-a926-e1ee39d39860)
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/56a329e4-0d99-4e8c-aeab-5022812eb866)
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/2aeb5400-0a00-496d-8fd2-11a42acc3681)
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/4ab8441f-58e5-42f7-bf1d-179e1c55b580)

 
Explanation:
Query 1 retrieves the latest order for each customer. This query is useful when you want to find out the most recent order placed by each customer. It can be used to identify customers who haven’t placed an order in a while and may need to be contacted to encourage them to make a purchase.
Query 2 lists the products with no sales which is helpful when you want to identify products that have not been sold yet. It can be used to determine which products may need additional marketing or promotion to increase sales.
Query 3 retrieves a list of all base tables within that database which is useful when you want to get a list of all tables in a database that are not views or system tables. It can be used to identify the structure of a database and understand how different tables are related.
Query 4 retrieves a list of all unique product categories which is helpful when you want to get a list of all unique product categories in your database. It can be used to understand how many different types of products you have and how they are categorized.



4.	List the top 5 customers who spent the most money.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/86858eb9-77a0-460b-aec2-067a2cfca1a4)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/eaa9152e-db25-49b1-82e6-f2fc6900484d)

Explanation:
Since we were supposed to print the top 5 customers, we used the TOP function. The MAX function is used to calculate the maximum order total amount for each customer, which is then sorted in descending order 1.

5.	Retrieve products with the highest average ratings
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/c65a70ea-4270-4461-a200-7bc7fe507fc8)

Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/1a1ae63c-c69c-4ed9-953a-5866e21f5011)

Explanation:
Since we were asked to retrieve the products with highest average rating, we used the AVG function to calculate the average review rating for each product, and then ordered the output in descending order .

6.	Find customers who have made more than one purchase on the same day.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/c407ead5-559d-4f06-89e9-7a7079c2558e)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/4b444675-2008-4606-9260-bee2198139dc)
 
Explanation:
The requirement for this query was to retrieve customers who made more than 1 purchase on the same date. For this we joined the Customer and CustOrder tables  and then using a subquery, we checked for the existence of other orders by the same customer on the same date. The EXISTS clause is used to filter out customers who have another order with a different order ID but the same order date .
Note: In our database, no customers ordered more than once on the same date.

7.	Calculate the total revenue for each product category.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/c93b465e-470c-41d1-8303-7a442cf21e9d)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/cdf7afd7-ee9d-4a35-8b67-e377b51eae9a)
 
Explanation:
The requirement for this query was to calculate the total revenue for each product category. For this we joined the Product and OrderItem tables and used the SUM function to calculate the total revenue by multiplying the order item quantity and product price for each product. For better display, we used the GROUP clause to print the results by productCatagory.

8.	List customers who have not reviewed any products.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/ccdcfff7-9a51-4938-ab8a-fac69b5fc071)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/17d6fe24-e56e-41f8-8034-1a5119250325)

Explanation:
The requirement for this query was to list the customers who haven't yet reviewed any products. We did this by performing a left join between the Customer and Review tables. The LEFT JOIN clause is used to include all customers from the Customer table, even if they do not have a corresponding review in the Review table. The WHERE clause filters out customers who have a null value in the customer_id column of the Review table.



9.	Find products with quantities below the average quantity in stock.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/60dcf784-c8f7-46a7-822c-61ae83d0c7a7)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/a7e248dd-8230-45bd-920e-3c68ef9852aa)
 
Explanation:
The requirement for this query was to identify products with stock quantities below the average. To do this we joined the Product and Inventory tables, calculated the average quantity in stock using the AVG function, and compared it with the remaining quantity of each product using the HAVING clause to filter for products with lower quantities

10.	Calculate the total number of orders for each customer and show only those with more than 5 orders.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/50db7c06-a7eb-44ec-b392-ae51d61ac5f1)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/37ac5df9-e2c5-437c-9b95-caaa3bf8c792)
 
Explanation:
The requirement for this query was to calculate the total number of orders for each customer and then filter out those customers who had more than 5 orders. To do this we joined the Customer and CustOrder tables on customerId. We used the COUNT function to calculate the total number of orders for each customer, and then filtered them using the HAVING clause to show only those customers with more than 5 orders.
Note: Our database had no customers with more than five orders.

11.	Retrieve the 3 most recent orders for a specific customer.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/c5204fb0-8dcd-4e4a-9f7f-edf46a41f304)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/2007576a-8c68-4e5b-8488-99d63ac73b51)
 
Explanation:
The requirement for this query was to retrieve the three most recent orders for a specific customer. To do this we used the WHERE clause to filter out the customer (in our case customerid = 1). We also used the TOP clause to select the 3 most recent orders for customer ID 1 and sorted it in descending order by orderdate.

12.	List customers who have purchased products from at least two different sellers.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/b02401dc-2f29-42a8-a5b2-6ed18ea19a6a)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/cae77b4f-1ee0-492e-9c71-7816452317b5)
 
Explanation:
The requirement for this query was to retrieve customers who purchased products from at least two different sellers. To do this we joined the Product and CustOrder tables on productId and customerId. We used the COUNT function to calculate the number of distinct sellers for each customer, and then filtered only those customers who have purchased products from at least two different sellers using the WHERE clause to show only those customers 

13.	Find customers who have placed an order in the last 30 days.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/a75fd625-f4a7-4b94-af0f-ab87f581eef0)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/e736010b-73f0-4ab6-ae94-d649ed861c7d)
 
Explanation:
The requirement for this query was to identify customers who had placed orders in the last 30 days. To do this we joined the Customer and CustOrder tables on customerId and used the WHERE clause to filter out orders that were older than 30 days from the current date.

14.	List customers who have made a purchase in every product category.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/a28cc697-5ac3-4fc8-8dfa-97febe78de5f)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/9a465c2a-1bc2-4b7e-93fc-a9ad494dd8d0)
 
Explanation:
The requirement for this query was to identify customers who had placed orders in the last 30 days. To do this we joined the Customer and CustOrder tables on customerId and used the WHERE clause to filter out orders that were older than 30 days from the current date.

15.	Calculate the total number of products sold by each seller.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/03cf5a95-29da-4017-867a-59cc134a7679)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/2b6c8b7c-083f-4084-819c-c4f834a21ad1)
 
Explanation:
The requirement for this query was to calculate the total number of products sold by each seller. To do this we joined the Seller, Product, and OrderItem tables on sellerId, productId, and product_id, and used the COUNT function to calculate the total number of distinct products sold by each seller. We also used the ORDER BY clause to present the results in descending order based on the total number of products sold.

16.	Retrieve the top 5 products with the highest sales in the last month.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/44b38afc-1844-4030-990f-202727e8ac47)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/a740bfe7-d5f0-48be-a282-57ff897f3477)
 
Explanation:
The requirement for this query was to retrieve the top 5 products with the highest sales in the last month. To do this we joined the Product, OrderItem, and CustOrder tables on productId, product_id, and orderId, and used the SUM function to calculate the total sales for each product by multiplying the order item quantity and product price for each product. We also used the ORDER BY clause to present the results in descending order based on the total sales.

17.	Retrieve the latest 5 orders along with customer details and order items for each order.   
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/7b2efc0d-e401-4a49-84b2-292367ed65f4)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/bb666033-caaf-4d88-aea4-4646618c1f85)
 
Explanation:
The requirement for this query was to retrieve the latest 5 orders along with customer details and order items for each order. To do this we joined the Customer, CustOrder, OrderItem, and Product tables on customerId, orderId, order_id, and productId. For this query, we selected the customer’s name, order ID, order date, product name, order item quantity, and order item subamount for each order and then used the ORDER BY clause to present the results in descending order based on the order date.

18.	Retrieve customers who have made purchases in every product category, along with the total number of categories they have purchased from.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/99eb0e71-a70f-4a53-8cab-7a1bbb9cf08c)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/d6e17e15-4a5b-498e-9a67-fbe5bc4a201e)
 
Explanation:
The requirement for this query was to identify the customers who have made purchases in every product category. To do this we joined the Customer, CustOrder, OrderItem, and Product tables on customerId, orderId, order_id, and productId and used the COUNT function along with the DISTINCT clause to calculate the number of distinct product categories purchased by each customer. After that, we used the HAVING clause to filter and show only those customers who have purchased products from all available product categories.

19.	List products that have never been reviewed and have quantities in stock greater than zero, along with the average rating for their category.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/0b8bbf79-250b-413f-ae9d-fe6d487f3f84)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/29d8ccca-1885-4bb1-acab-e115381e52b7)
 
Explanation:
The requirement for this query was to retrieves products that have not been reviewed, have positive quantities in stock along with the average rating for their category. To do this we joined the Product and Review tables on productId and then used the WHERE clause to filter the products with positive remaining quantities and null review. We used the AVG function to calculate the average rating for each product category, and then grouped the display by product ID and name.

20.	Find the top 3 products with the highest total sales, including details of the reviews for each product.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/dff65695-d081-4229-9142-54eaf70aabb4)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/3b2c944d-846c-4a8f-8240-fe9b2e7a5cc8)

Explanation:
The requirement for this query was to identify the top 3 products with the highest total sales and include review details for each product. To do this we joined the Product, OrderItem, and Review tables on productId, product_id, and product_id, and then used the GROUP BY clause to group the results by product details and review information, along with the ORDER BY clause to order the products by their total sales in descending order to select the top 3 using the TOP clause. We used the MAX function to calculate the maximum order item subamount for each product.

21.	Retrieve all customers who have placed orders, and include details of their orders, even for orders with no associated customers. Include information about the shipping addresses for each order.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/d8b2ccc7-ff2b-4fbf-9274-4d0af058747d)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/7a9b6b35-ff78-42f7-8510-73578ccdc0fe)
 
Explanation:
The requirement for this query was to retrieves information about all customers who have placed orders and includes details of their orders, even for orders with no associated customers (an order without an associated customer is something unheard of) along with the information about the shipping addresses for each order. To do this we used the LEFT JOIN clause joins between the Customer, CustOrder, and CustAddress tables, linking customers to their orders and orders to their associated addresses. The reason for using the LEFT JOIN clause was to include all customers from the Customer table, even if they do not have a corresponding order in the CustOrder table.

22.	Write a SQL query to retrieve the total number of products and the total revenue for each product category. Include products that may not have been sold. Additionally, order the product in descending order based on total revenue.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/5152de93-d311-4aef-a7b2-38541169c19b)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/799372c0-48d3-4bce-8bbe-fe2a58fbeac6)
 
Explanation:
The requirement for this query was to calculate the total number of products and the total revenue for each product category, even including products that may not have been sold. To do this we used the LEFT JOIN clause joining the Product and OrderItem tables. The reason for using the LEFT JOIN clause was to include all products from the Product table, even if they do not have a corresponding order item in the OrderItem table. We used the COUNT function to calculate the total number of products for each product category, and the SUM function to calculate the total revenue for each product category. We also grouped the results by product details and ordered the products in descending order based on their total revenue. 

23.	Write a SQL query to retrieve detailed information about products and their associated orders. Include the product ID, product name, product category, order quantity, order price, and total revenue for each product. Ensure that products that have not been sold are also included in the result. Filter the results to include only products in the 'Electronics' category with order quantities between 5 and 10. Additionally, order results in descending order based on total revenue.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/58f65f32-a67f-4c26-ae04-45e3e6361a74)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/bb6dc0f4-3343-438e-abe8-89a1098629f4)
 
Explanation:
The requirement for this query was to retrieve product categories and their total number of products sold, displaying categories with more than 10 products sold. To do this we used the LEFT JOIN clause joining the Product and OrderItem table and then used the GROUP BY clause to group the results by productCatagory. Apart from that, we used the HAVING clause to filter the results to only include categories with more than 10 products sold. We did this by comparing the count of order items using the COUNT function. We used the ORDER BY clause at the end to sort the results in descending order by the total. 



24.	Retrieve product categories with the total number of products sold, ordered in descending order by the total number of products sold, and show only categories with more than 10 products sold.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/2a64df7d-5d5f-4be2-99b9-ff9c66c55850)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/e2ef5a30-258f-4e16-809e-a039fe4c8cca)
 
Explanation:
The requirement for this query was to retrieve product categories and their total number of products sold, displaying categories with more than 10 products sold. To do this we used the LEFT JOIN clause joining the Product and OrderItem table and then used the GROUP BY clause to group the results by productCatagory. Apart from that, we used the HAVING clause to filter the results to only include categories with more than 10 products sold. We did this by comparing the count of order items using the COUNT function. We used the ORDER BY clause at the end to sort the results in descending order by the total. 

25.	Retrieve customers with the total number of orders they have placed, ordered in descending order by the total number of orders, and show only customers who have placed more than 5 orders.
Query:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/8bea7762-4623-4716-8245-432b99bc76eb)
 
Output:
![image](https://github.com/Mahareeb/i211564_i212752_Assignment_2_CY_T_DB/assets/122688432/0a2c17f4-4f7a-4665-a39e-d992099c9f9b)
 
Explanation:
The requirement for this query was to retrieve customers along with the total number of orders they have placed, displaying the results in descending order based on the total number of orders with the restriction of showing only those customers who placed more than 5 orders. To do this we used the LEFT JOIN clause joining the Customer and CustOrder tables. We used the COUNT function is used to calculate the total number of orders placed by each customer, and then used the GROUP BY clause to group the result by customerid and custname along with the HAVING clause to filter out customers who have placed less than or equal to 5 orders. At the end, according to the instructions, we sorted the results in descending order by the total number of orders placed.
