Create Database i211564_i212752

Use i211564_i212752


-- SELECT DATEDIFF(SECOND,'1970-01-01', GETUTCDATE()) AS unix_timestamp

-- Create the Seller table
CREATE TABLE Seller 
(
    sellerId NUMERIC(20) NOT NULL,
    sellerName VARCHAR(255) NOT NULL,
	sellerPhone NUMERIC(20) NOT NULL,
	sellerEmail NCHAR(255) NOT NULL,
    PRIMARY KEY (sellerId)
);

-- Create the Customer table
CREATE TABLE Customer 
(
    customerId NUMERIC(20) NOT NULL,
    customerName VARCHAR(255) NOT NULL,
    customerPhone NUMERIC(20) NOT NULL,
    customerEmail NCHAR(255) NOT NULL,
    customerAddress NCHAR(255) NOT NULL,
    customerPassword NCHAR (255) NOT NULL,
    PRIMARY KEY (customerId)
);

-- Create the Products table
CREATE TABLE Product (
    productId NUMERIC(20) NOT NULL,
    productName VARCHAR(255) NOT NULL,
	productDescription VARCHAR(255) NOT NULL,
	productCatagory VARCHAR(255) NOT NULL,
	productPrice NUMERIC(20) NOT NULL,
	productRating NUMERIC(20),
	product_remainingQuantity NUMERIC(20) NOT NULL,

	seller_id NUMERIC (20) constraint productId_not_null NOT NULL,
    PRIMARY KEY (productId),
	FOREIGN KEY (seller_id) REFERENCES Seller(sellerId)
);

-- Create the Address table
CREATE TABLE CustAddress
(
    addressId NUMERIC(20) NOT NULL,
    addressLines NCHAR(255) NOT NULL,
    addressCity VARCHAR(255) NOT NULL,
    addressState VarCHAR(255) NOT NULL,
    address_zipCode NUMERIC(20) NOT NULL,
    addressCountry VARCHAR(255) NOT NULL,
    address_isBilling BIT, -- bool
    address_isShipping BIT, 
    
    customer_id NUMERIC (20) NOT NULL,
    PRIMARY KEY (addressId),
    FOREIGN KEY (customer_id) REFERENCES Customer(customerId)
);

-- Create the CustOrder table
CREATE TABLE CustOrder 
(
    orderId NUMERIC(20) NOT NULL,
    orderNo VARCHAR(255) NOT NULL,
	orderdate date NOT NULL,
	order_totalamount NUMERIC (20) NOT NULL,

	customer_id NUMERIC (20) constraint orderId_not_null NOT NULL ,
	address_id NUMERIC (20) constraint orderId_not_null NOT NULL ,
    PRIMARY KEY (orderId),
	FOREIGN KEY (customer_id) REFERENCES Customer(customerId),
	FOREIGN KEY (address_id) REFERENCES CustAddress(addressId)
);

-- Create the OrderItems table
CREATE TABLE OrderItem 
(
    orderItem_Id NUMERIC(20) NOT NULL,
    orderItem_itemQuantity NUMERIC (20) NOT NULL,
	orderItem_subamount NUMERIC (20) NOT NULL,

	product_id NUMERIC (20) constraint orderItem_Id_not_null NOT NULL ,
	order_id NUMERIC (20) constraint orderItem_Id_not_null NOT NULL ,

    PRIMARY KEY (orderItem_Id),
	
	FOREIGN KEY (product_id) REFERENCES Product(productId),
	FOREIGN KEY (order_id) REFERENCES CustOrder(orderId)

);

-- Create the ShoppingCart table
CREATE TABLE ShoppingCart 
(
    cartId NUMERIC(20) NOT NULL,

	customer_id NUMERIC (20) constraint cartId_not_null NOT NULL,

	PRIMARY KEY (cartId),
	FOREIGN KEY (customer_id) REFERENCES Customer(customerId)
);

-- Create the Cartitems table
CREATE TABLE CartItem
(
    cartItem_Id NUMERIC(20) NOT NULL,
	cartItem_itemQuantity NUMERIC (20) NOT NULL,

	product_id NUMERIC (20) constraint cartItem_Id_not_null NOT NULL ,
	cart_id NUMERIC (20) constraint cartItem_Id_not_null NOT NULL ,

	PRIMARY KEY (cartitem_Id),
	
	FOREIGN KEY (product_id) REFERENCES Product(productId),
	FOREIGN KEY (cart_id) REFERENCES ShoppingCart(cartId)

);

-- Create the Payment table
CREATE TABLE Payment
(
    paymentId NUMERIC(20) NOT NULL,
	paymentMethod NCHAR(255) NOT NULL,
	payment_totalamount NUMERIC (20) NOT NULL,
	paymentdate date NOT NULL,
	
	order_id NUMERIC (20) constraint paymentId_not_null NOT NULL ,

	PRIMARY KEY (paymentId),

	FOREIGN KEY (order_id) REFERENCES CustOrder(orderId)
);

-- Create the Review table
CREATE TABLE Review
(
    reviewId NUMERIC(20) NOT NULL,
	reviewContext VARCHAR(255),
	reviewRating NUMERIC(20),
	reviewDate date NOT NULL,
	
	product_id NUMERIC (20) constraint reviewId_not_null NOT NULL ,
	customer_id NUMERIC (20) constraint reviewId_not_null NOT NULL ,

	PRIMARY KEY (reviewId),

	FOREIGN KEY (product_id) REFERENCES Product(productId),
	FOREIGN KEY (customer_id) REFERENCES Customer(customerId)
);

-- Create the Inventory table
CREATE TABLE Inventory
(
    inventoryId NUMERIC(20) NOT NULL,
	inventory_quantityInStock NUMERIC(20),
	inventoryDate date NOT NULL, 
	inventoryThreshold NUMERIC (20) NOT NULL,
	inventory_unitCost NUMERIC(20) NOT NULL,
	
	product_id NUMERIC (20) constraint inventoryId_not_null NOT NULL ,

	PRIMARY KEY (inventoryId),
	FOREIGN KEY (product_id) REFERENCES Product(productId)
);



-- Insert data into Seller 
INSERT INTO Seller (sellerId, sellerName, sellerPhone, sellerEmail)
VALUES
	(1, 'Seller 1', 1234567890, 'seller1@example.com'),
	(2, 'Seller 2', 9876543210, 'seller2@example.com'),
	(3, 'Seller 3', 5551234567, 'seller3@example.com'),
	(4, 'Seller 4', 1112223333, 'seller4@example.com'),
	(5, 'Seller 5', 9998887777, 'seller5@example.com'),
	(6, 'Seller 6', 7775551111, 'seller6@example.com'),
	(7, 'Seller 7', 2223334444, 'seller7@example.com'),
	(8, 'Seller 8', 4445556666, 'seller8@example.com'),
	(9, 'Seller 9', 8887779999, 'seller9@example.com'),
	(10, 'Seller 10', 3334445555, 'seller10@example.com'),
	(11, 'Seller 11', 6667778888, 'seller11@example.com'),
	(12, 'Seller 12', 1111111111, 'seller12@example.com'),
	(13, 'Seller 13', 2222222222, 'seller13@example.com'),
	(14, 'Seller 14', 3333333333, 'seller14@example.com'),
	(15, 'Seller 15', 4444444444, 'seller15@example.com'),
	(16, 'Seller 16', 5555555555, 'seller16@example.com'),
	(17, 'Seller 17', 6666666666, 'seller17@example.com'),
	(18, 'Seller 18', 7777777777, 'seller18@example.com'),
	(19, 'Seller 19', 8888888888, 'seller19@example.com'),
	(20, 'Seller 20', 9999999999, 'seller20@example.com');

--Insert data into Customer 
INSERT INTO Customer (customerId, customerName, customerPhone, customerEmail, customerAddress, customerPassword)
	VALUES
	(1, 'Customer 1', 1111111111, 'customer1@example.com', '123 Oak St', 'password1'),
	(2, 'Customer 2', 2222222222, 'customer2@example.com', '456 Pine St', 'password2'),
	(3, 'Customer 3', 3333333333, 'customer3@example.com', '789 Elm St', 'password3'),
	(4, 'Customer 4', 4444444444, 'customer4@example.com', '321 Cedar St', 'password4'),
	(5, 'Customer 5', 5555555555, 'customer5@example.com', '654 Redwood St', 'password5'),
	(6, 'Customer 6', 6666666666, 'customer6@example.com', '987 Spruce St', 'password6'),
	(7, 'Customer 7', 7777777777, 'customer7@example.com', '543 Sequoia St', 'password7'),
	(8, 'Customer 8', 8888888888, 'customer8@example.com', '876 Birch St', 'password8'),
	(9, 'Customer 9', 9999999999, 'customer9@example.com', '234 Fir St', 'password9'),
	(10, 'Customer 10', 1234567890, 'customer10@example.com', '765 Maple St', 'password10'),
	(11, 'Customer 11', 9876543210, 'customer11@example.com', '432 Hemlock St', 'password11'),
	(12, 'Customer 12', 5551234567, 'customer12@example.com', '876 Redwood St', 'password12'),
	(13, 'Customer 13', 1112223333, 'customer13@example.com', '123 Cedar St', 'password13'),
	(14, 'Customer 14', 7775551111, 'customer14@example.com', '765 Oak St', 'password14'),
	(15, 'Customer 15', 2223334444, 'customer15@example.com', '543 Pine St', 'password15'),
	(16, 'Customer 16', 4445556666, 'customer16@example.com', '234 Elm St', 'password16'),
	(17, 'Customer 17', 8887779999, 'customer17@example.com', '432 Maple St', 'password17'),
	(18, 'Customer 18', 3334445555, 'customer18@example.com', '876 Birch St', 'password18'),
	(19, 'Customer 19', 6667778888, 'customer19@example.com', '987 Redwood St', 'password19'),
	(20, 'Customer 20', 1111112222, 'customer20@example.com', '321 Sequoia St', 'password20');


-- Insert 20 lines of dummy data with different categories
INSERT INTO Product (productId, productName, productDescription, productCatagory, productPrice, productRating, product_remainingQuantity, seller_id)
VALUES
    (1, 'Product 1', 'Description for Product 1', 'Electronics', 100.00, 4.5, 50, 1),
    (2, 'Product 2', 'Description for Product 2', 'Food items', 5.99, 3.8, 100, 2),
    (3, 'Product 3', 'Description for Product 3', 'Electronics', 299.99, 4.2, 30, 3),
    (4, 'Product 4', 'Description for Product 4', 'Food items', 7.50, 4.0, 75, 4),
    (5, 'Product 5', 'Description for Product 5', 'Electronics', 199.95, 4.7, 40, 5),
    (6, 'Product 6', 'Description for Product 6', 'Food items', 3.49, 3.5, 120, 6),
    (7, 'Product 7', 'Description for Product 7', 'Electronics', 89.99, 4.1, 25, 7),
    (8, 'Product 8', 'Description for Product 8', 'Food items', 4.25, 4.4, 85, 8),
    (9, 'Product 9', 'Description for Product 9', 'Electronics', 149.50, 4.6, 35, 9),
    (10, 'Product 10', 'Description for Product 10', 'Food items', 6.99, 3.9, 65, 10),
    (11, 'Product 11', 'Description for Product 11', 'Electronics', 129.00, 4.3, 45, 11),
    (12, 'Product 12', 'Description for Product 12', 'Food items', 2.99, 3.3, 150, 12),
    (13, 'Product 13', 'Description for Product 13', 'Electronics', 179.99, 4.8, 20, 13),
    (14, 'Product 14', 'Description for Product 14', 'Household stuff', 8.99, 3.7, 90, 14),
    (15, 'Product 15', 'Description for Product 15', 'Household stuff', 6.49, 4.2, 70, 15),
    (16, 'Product 16', 'Description for Product 16', 'Electronics', 69.00, 3.5, 55, 16),
    (17, 'Product 17', 'Description for Product 17', 'Household stuff', 12.75, 4.0, 110, 17),
    (18, 'Product 18', 'Description for Product 18', 'Electronics', 249.99, 4.6, 32, 18),
    (19, 'Product 19', 'Description for Product 19', 'Household stuff', 4.49, 3.9, 80, 19),
    (20, 'Product 20', 'Description for Product 20', 'Electronics', 59.95, 4.4, 60, 20);


-- Insert into CustAddress table
INSERT INTO CustAddress (addressId, addressLines, addressCity, addressState, address_zipCode, addressCountry, address_isBilling, address_isShipping, customer_id)
	VALUES
	(1, '123 Main St', 'City 1', 'State 1', 12345, 'Country 1', 1, 1, 1),
	(2, '456 Elm St', 'City 2', 'State 2', 23456, 'Country 2', 0, 1, 2),
	(3, '789 Oak St', 'City 3', 'State 3', 34567, 'Country 3', 1, 0, 3),
	(4, '321 Pine St', 'City 4', 'State 4', 45678, 'Country 4', 1, 0, 4),
	(5, '654 Birch St', 'City 5', 'State 5', 56789, 'Country 5', 0, 1, 5),
	(6, '987 Maple St', 'City 6', 'State 6', 67890, 'Country 6', 1, 1, 6),
	(7, '543 Cedar St', 'City 7', 'State 7', 78901, 'Country 7', 0, 0, 7),
	(8, '876 Redwood St', 'City 8', 'State 8', 89012, 'Country 8', 1, 1, 8),
	(9, '234 Sequoia St', 'City 9', 'State 9', 90123, 'Country 9', 1, 0, 9),
	(10, '765 Fir St', 'City 10', 'State 10', 12345, 'Country 10', 1, 1, 10),
	(11, '432 Hemlock St', 'City 1', 'State 1', 23456, 'Country 1', 0, 1, 1),
	(12, '876 Spruce St', 'City 2', 'State 2', 34567, 'Country 2', 1, 0, 2),
	(13, '123 Cedar St', 'City 3', 'State 3', 45678, 'Country 3', 1, 1, 3),
	(14, '765 Oak St', 'City 4', 'State 4', 56789, 'Country 4', 0, 0, 4),
	(15, '543 Pine St', 'City 5', 'State 5', 67890, 'Country 5', 1, 1, 5),
	(16, '234 Elm St', 'City 6', 'State 6', 78901, 'Country 6', 0, 0, 6),
	(17, '432 Maple St', 'City 7', 'State 7', 89012, 'Country 7', 1, 1, 7),
	(18, '876 Birch St', 'City 8', 'State 8', 90123, 'Country 8', 1, 0, 8),
	(19, '987 Redwood St', 'City 9', 'State 9', 12345, 'Country 9', 0, 1, 9),
	(20, '321 Sequoia St', 'City 10', 'State 10', 23456, 'Country 10', 1, 1, 10);


--Insert data into CustOrder
INSERT INTO CustOrder (orderId, orderNo, orderdate, order_totalamount, customer_id, address_id)
VALUES
	(1, 'Order-1', '2023-10-01', 99.99, 1,1),
	(2, 'Order-2', '2023-10-02', 159.99, 2,2),
	(3, 'Order-3', '2023-10-03', 49.99, 3,3),
	(4, 'Order-4', '2023-10-04', 129.99, 4,4),
	(5, 'Order-5', '2023-10-05', 79.99, 5,5),
	(6, 'Order-6', '2023-10-06', 199.99, 6,6),
	(7, 'Order-7', '2023-10-07', 89.99, 7,7),
	(8, 'Order-8', '2023-10-08', 149.99, 8,8),
	(9, 'Order-9', '2023-10-09', 69.99, 9,9),
	(10, 'Order-10', '2023-10-10', 119.99, 10,10),
	(11, 'Order-11', '2023-10-11', 39.99, 1, 11),
	(12, 'Order-12', '2023-10-12', 109.99, 2, 12),
	(13, 'Order-13', '2023-10-13', 69.99, 3, 13),
	(14, 'Order-14', '2023-10-14', 129.99, 4, 14),
	(15, 'Order-15', '2023-10-15', 49.99, 5, 15),
	(16, 'Order-16', '2023-10-16', 139.99, 6, 16),
	(17, 'Order-17', '2023-10-17', 99.99, 7, 17),
	(18, 'Order-18', '2023-10-18', 159.99, 8, 18),
	(19, 'Order-19', '2023-10-19', 79.99, 9, 19),
	(20, 'Order-20', '2023-10-20', 119.99, 10, 20);

--Insert data into orderItems table 
INSERT INTO OrderItem (orderItem_Id, orderItem_itemQuantity, orderItem_subamount, product_id, order_id)
	VALUES
	(1, 2, 39.98, 1, 1),
	(2, 1, 29.99, 2, 1),
	(3, 3, 149.97, 3, 2),
	(4, 2, 99.98, 4, 2),
	(5, 1, 49.99, 5, 3),
	(6, 4, 279.96, 6, 3),
	(7, 3, 209.97, 7, 4),
	(8, 2, 79.98, 8, 4),
	(9, 1, 119.99, 9, 5),
	(10, 2, 69.98, 10, 5),
	(11, 1, 59.99, 11, 6),
	(12, 3, 389.97, 12, 6),
	(13, 2, 279.98, 13, 7),
	(14, 1, 99.99, 14, 7),
	(15, 4, 559.96, 15, 8),
	(16, 3, 359.97, 16, 8),
	(17, 1, 39.99, 17, 9),
	(18, 2, 109.98, 18, 9),
	(19, 3, 209.97, 19, 10),
	(20, 2, 119.98, 20, 10);

--Insert data into shopiing cart 
INSERT INTO ShoppingCart (cartId, customer_id)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 1),
	(12, 2),
	(13, 3),
	(14, 4),
	(15, 5),
	(16, 6),
	(17, 7),
	(18, 8),
	(19, 9),
	(20, 10);

--Insert data into cart items
INSERT INTO CartItem (cartItem_Id, cartItem_itemQuantity, product_id, cart_id)
	VALUES
	(1, 2, 1, 1),
	(2, 1, 2, 1),
	(3, 3, 3, 2),
	(4, 2, 4, 2),
	(5, 1, 5, 3),
	(6, 4, 6, 3),
	(7, 3, 7, 4),
	(8, 2, 8, 4),
	(9, 1, 9, 5),
	(10, 2, 10, 5),
	(11, 1, 11, 6),
	(12, 3, 12, 6),
	(13, 2, 13, 7),
	(14, 1, 14, 7),
	(15, 4, 15, 8),
	(16, 3, 16, 8),
	(17, 1, 17, 9),
	(18, 2, 18, 9),
	(19, 3, 19, 10),
	(20, 2, 20, 10);

-- Inser into Payment table
INSERT INTO Payment (paymentId, paymentMethod, payment_totalamount, paymentdate, order_id)
	VALUES
	(1, 'Credit Card', 99.99, '2023-10-01', 1),
	(2, 'PayPal', 159.99, '2023-10-02', 2),
	(3, 'Cash on Delivery', 49.99, '2023-10-03', 3),
	(4, 'PayPal', 129.99, '2023-10-04', 4),
	(5, 'Credit Card', 79.99, '2023-10-05', 5),
	(6, 'Cash on Delivery', 199.99, '2023-10-06', 6),
	(7, 'Credit Card', 89.99, '2023-10-07', 7),
	(8, 'PayPal', 149.99, '2023-10-08', 8),
	(9, 'Credit Card', 69.99, '2023-10-09', 9),
	(10, 'PayPal', 119.99, '2023-10-10', 10),
	(11, 'Credit Card', 39.99, '2023-10-11', 1),
	(12, 'Cash on Delivery', 109.99, '2023-10-12', 2),
	(13, 'Credit Card', 69.99, '2023-10-13', 3),
	(14, 'PayPal', 129.99, '2023-10-14', 4),
	(15, 'Cash on Delivery', 49.99, '2023-10-15', 5),
	(16, 'PayPal', 139.99, '2023-10-16', 6),
	(17, 'Cash on Delivery', 99.99, '2023-10-17', 7),
	(18, 'PayPal', 159.99, '2023-10-18', 8),
	(19, 'Cash on Delivery', 79.99, '2023-10-19', 9),
	(20, 'PayPal', 119.99, '2023-10-20', 10);

-- Insert into Review table
INSERT INTO Review (reviewId, reviewContext, reviewRating, reviewDate, product_id, customer_id)
	VALUES
	(1, 'Great product!', 5, '2023-10-01', 1, 1),
	(2, 'Excellent service!', 4, '2023-10-02', 2, 2),
	(3, 'Good quality', 3, '2023-10-03', 3, 3),
	(4, 'Slow shipping', 1, '2023-10-04', 4, 4),
	(5, 'Highly recommended', 5, '2023-10-05', 5, 5),
	(6, 'Love it!', 4, '2023-10-06', 6, 6),
	(7, 'Very satisfied', 5, '2023-10-07', 7, 7),
	(8, 'Impressive product', 4, '2023-10-08', 8, 8),
	(9, 'Great value for money', 5, '2023-10-09', 9, 9),
	(10, 'Outstanding!', 5, '2023-10-10', 10, 10),
	(11, 'Superb product', 4, '2023-10-11', 1, 1),
	(12, 'Awesome quality', 5, '2023-10-12', 2, 2),
	(13, 'Slow delivery', 2, '2023-10-13', 3, 3),
	(14, 'Very reliable', 4, '2023-10-14', 4, 4),
	(15, 'Fantastic service', 5, '2023-10-15', 5, 5),
	(16, 'Highly impressed', 5, '2023-10-16', 6, 6),
	(17, 'Great customer support', 4, '2023-10-17', 7, 7),
	(18, 'Quality product', 4, '2023-10-18', 8, 8),
	(19, 'Quick response', 5, '2023-10-19', 9, 9),
	(20, 'Worst experience', 1, '2023-10-20', 10, 10);

--Insert into Inventory table
INSERT INTO Inventory (inventoryId, inventory_quantityInStock, inventoryDate, inventoryThreshold, inventory_unitCost, product_id)
VALUES
(1, 100, '2023-10-01', 10, 5.99, 1),
(2, 75, '2023-10-02', 5, 8.99, 2),
(3, 50, '2023-10-03', 15, 7.49, 3),
(4, 60, '2023-10-04', 12, 9.99, 4),
(5, 80, '2023-10-05', 20, 6.99, 5),
(6, 120, '2023-10-06', 25, 10.49, 6),
(7, 90, '2023-10-07', 18, 7.99, 7),
(8, 110, '2023-10-08', 11, 8.49, 8),
(9, 70, '2023-10-09', 10, 6.99, 9),
(10, 45, '2023-10-10', 8, 11.99, 10),
(11, 55, '2023-10-11', 13, 9.99, 1),
(12, 65, '2023-10-12', 14, 8.49, 2),
(13, 85, '2023-10-13', 16, 7.99, 3),
(14, 95, '2023-10-14', 17, 10.49, 4),
(15, 75, '2023-10-15', 9, 6.99, 5),
(16, 100, '2023-10-16', 22, 9.99, 6),
(17, 80, '2023-10-17', 11, 8.49, 7),
(18, 70, '2023-10-18', 14, 7.99, 8),
(19, 60, '2023-10-19', 7, 10.49, 9),
(20, 50, '2023-10-20', 18, 6.99, 10);
