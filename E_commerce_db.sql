--CREATE TABLES
CREATE TABLE Public.grocery_stores (
	grocery_id bigserial NOT NULL PRIMARY KEY,
	name varchar (255) ,
	location varchar (255),
	op_status varchar (255),
	open_time time with time zone,
	close_time time with time zone
);

CREATE TABLE Public.admins (
	admin_id bigserial NOT NULL PRIMARY KEY,
	name varchar (255),
	contact bigint,
	email varchar (255),
	role varchar (255),
	ad_user_type varchar (255)
);

CREATE TABLE Public.vendors (
	vendor_id bigserial NOT NULL PRIMARY KEY,
	name varchar (255),
	email varchar (255),
	contact bigint ,
	location varchar,
	ind_pdt varchar (255),
	pdt_description varchar (255),
	ve_user_type varchar (255)
);

CREATE TABLE Public.products (
	pdt_id bigserial NOT NULL PRIMARY KEY,
	name varchar (255),
	description varchar (255),
	category varchar (255),
	price int ,
	image bytea
);

CREATE TABLE Public.wishlist (
	wish_id bigserial NOT NULL PRIMARY KEY,
	status varchar (255),
	customer_id bigserial,
	pdt_id bigserial,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	FOREIGN KEY (pdt_id) REFERENCES products (pdt_id)
);

CREATE TABLE Public.customers (
	customer_id bigserial NOT NULL PRIMARY KEY,
	name varchar (255),
	email varchar (255),
	contact bigint ,
	password varchar (255),
	location varchar (255),
	user_type varchar (255)
);

CREATE TABLE Public.orders (
	order_id bigserial NOT NULL PRIMARY KEY,
	pdt_id bigserial,
	FOREIGN KEY (pdt_id) REFERENCES products (pdt_id),
	category varchar (255),
	quantity bigint ,
	customer_id bigserial,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	order_status varchar (255)
);

--INSERT DATA

INSERT INTO admins (name,contact,email,role,ad_user_type)
VALUES ('Kyobe Andrew','04588344','andrewk@gmail','Adminstrator','admin');

INSERT INTO customers (name,email,contact,password,location,user_type)
VALUES ('Shadia Promise','promise@gmail','09437559','456bjbj','Gayaza','buyer'),
		('Tracy Peace','tracy@gmail','09454699','456bjbj','Kamwokya','buyer'),
		('Shadia Kisa','kisap@gmail','09858559','456bjbj','Gayaza','buyer'),
		('Sarah Atim','atims@gmail','034858559','456bjbj','Ntinda','buyer'),
		('Debby Strqwb3rry','debbys@gmail','09858559','456bjbj','Kibuli','buyer');

INSERT INTO grocery_stores (name,location,op_status,open_time,close_time)
VALUES ('Kisaprom stores','Kyebando','active','8:00 am','9:00 pm');

INSERT INTO products (name,category,price)
VALUES ('bananas','fruits','5000'),
		('pineapples','fruits','6000'),
		('beef','meats','10000'),
		('gorillos','snacks','1000'),
		('pringles','snacks','7000'),
		('forest cake','cakes','500000'),
		('banana and apple cake','cakes','150000');

INSERT INTO wishlist (status,customer_id,pdt_id)
VALUES ('Liked','5','7'),
		('Liked','3','6'),
		('Liked','2','1'),
		('Liked','1','4'),
		('Liked','4','2'),
		('Liked','5','3'),
		('Liked','1','5');

INSERT INTO orders (pdt_id,category,quantity,customer_id,order_status)
VALUES ('1','fruits','20','4','pending'),
		('2','fruits','5','5','confirmed'),
		('4','snacks','4','2','confrimed'),
		('6','cakes','2','5','pending');

ALTER TABLE vendors
DROP COLUMN ind_pdt;

ALTER TABLE vendors
DROP COLUMN pdt_description;

ALTER TABLE products
DROP COLUMN description;
		
ALTER TABLE vendors
ADD pdt_category varchar(255);

INSERT INTO vendors (name,email,contact,location,ve_user_type,pdt_category)
VALUES ('Tharn Type','tharn@gmail.com','07587785','Entebbe','seller','cakes'),
		('Lian kuea','kueal@gmail.com','0394894','Wandegeya','seller','fuits'),
		('Rain Ppayu','rainpp@gmail.com','0948844','Najjera','seller','meats'),
		('Ohm Nanon','nanon@gmail.com','0847774','Ntinda','seller','snacks');

CREATE TABLE Public.admin_pdts (
	admin_pdt_id bigserial NOT NULL PRIMARY KEY,
	pdt_id bigserial,
	pdt_category varchar (255),
	FOREIGN KEY (pdt_id) REFERENCES products(pdt_id)
);

INSERT INTO admin_pdts (pdt_id,pdt_category)
VALUES ('1','fruits'),
		('2','fruits'),
		('4','snacks'),
		('3','meats');

--SELECT STATEMENTS

SELECT * FROM admin_pdts; --products by the client

SELECT pdt_category FROM vendors ; --products from the vendors

SELECT ve_user_type FROM vendors; --user type sellers

SELECT user_type FROM customers; --user type buyer

SELECT ad_user_type FROM admins; -- user type admin





