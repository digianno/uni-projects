CREATE TABLE Customer(
	phoneNumber VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL ,
	password VARCHAR(50) NOT NULL,
	adress VARCHAR(50) NOT NULL,
	postcode VARCHAR(10) NOT NULL,
	city CHAR(20) NOT NULL,
	country CHAR(20) NOT NULL,
    id INTEGER NOT NULL,
    name CHAR(20) NOT NULL,
    surname CHAR(20) NOT NULL,
    gender CHAR(10) NOT NULL,
    dateOfBirth DATE NOT NULL,
	PRIMARY KEY(id) ) ;
CREATE TABLE Appointment(
	appo_id INTEGER NOT NULL,
	CustomerCode int REFERENCES Customer(id),
    CONSTRAINT Appo_key PRIMARY KEY (appo_id,CustomerCode) ,
    description VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    time DOUBLE NOT NULL);
CREATE TABLE Product(
	product_id INT PRIMARY KEY NOT NULL,
    productName VARCHAR(50) NOT NULL,
    category varchar(20),
    price DOUBLE NOT NULL,
    image VARCHAR(255) NOT NULL) ;
CREATE TABLE Cart(
    cart_id INTEGER NOT NULL,
    CustomerCode int REFERENCES Customer(id),
    CONSTRAINT Cart_key PRIMARY KEY (cart_id,CustomerCode),
    totalsum DOUBLE NOT NULL) ;
CREATE TABLE CartItems(
	cartitems_id INTEGER NOT NULL,
    CartCode int  REFERENCES Cart(Cart_key),
    ProductCode int REFERENCES Product(product_id),
    quantity INTEGER NOT NULL);
CREATE TABLE Order1(
	order_id INTEGER NOT NULL,
    CustomerCode int  REFERENCES Customer(id),
    CONSTRAINT Order_key PRIMARY KEY (order_id,CustomerCode),
    orderDate DATE NOT NULL,
    totalsum DOUBLE NOT NULL );
CREATE TABLE Payment(
    payment_id INTEGER NOT NULL,
    OrderCode int REFERENCES Order1(order_id),
    CONSTRAINT Payment_key PRIMARY KEY (payment_id, OrderCode),
    totalsum DOUBLE NOT NULL) ;


    
  
    