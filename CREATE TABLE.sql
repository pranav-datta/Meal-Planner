CREATE DATABASE Meal_Planner;
USE Meal_Planner;
CREATE TABLE PRODUCT (
	Name VARCHAR(50) PRIMARY KEY,
	Units VARCHAR(50),
	is_Tool BOOLEAN NOT NULL
);

CREATE TABLE USER (
	Name VARCHAR(50),
	Email VARCHAR(50) PRIMARY KEY,
	Password VARCHAR(50),
	Num SMALLINT,
	Street VARCHAR(50),
	City VARCHAR(50),
	Country VARCHAR(50),
	is_Chef BOOLEAN NOT NULL,
	is_Contributor BOOLEAN NOT NULL,
	CHECK (is_Chef = TRUE OR is_Contributor = TRUE)
	/* Contributor has average rating that will be calculated */
);

CREATE TABLE TYPE (
	Name VARCHAR(50),
    	FOREIGN KEY(Name) REFERENCES PRODUCT(Name),
	Type VARCHAR(50),
	PRIMARY KEY(Name, Type)
);

CREATE TABLE STORE (
	Name VARCHAR(50),
	Num SMALLINT,
	Street VARCHAR(50),
	City VARCHAR(50),
	Country VARCHAR(50),
	Type VARCHAR(50),
   	INDEX(Name),
    	INDEX(Num),
    	INDEX(Street),
    	INDEX(City),
    	INDEX(Country),
	PRIMARY KEY(Name, Num, Street, City, Country)
);

CREATE TABLE GROCERY_RUN (
	ID INT PRIMARY KEY,
	Date DATE,
	S_Name VARCHAR(50) NOT NULL,
    	S_Num SMALLINT NOT NULL,
    	S_Street VARCHAR(50) NOT NULL,
    	S_City VARCHAR(50) NOT NULL,
    	S_Country VARCHAR(50) NOT NULL,
    	Chef VARCHAR(50) NOT NULL,
	FOREIGN KEY(S_Name) REFERENCES STORE(Name),
	FOREIGN KEY(S_Num) REFERENCES STORE(Num),
	FOREIGN KEY(S_Street) REFERENCES STORE(Street),
	FOREIGN KEY(S_City) REFERENCES STORE(City),
	FOREIGN KEY(S_Country) REFERENCES STORE(Country),
	FOREIGN KEY(Chef) REFERENCES USER(Email)
);

CREATE TABLE OBTAINS (
	Grocery_Run INT NOT NULL,
    	Product VARCHAR(50),
    	FOREIGN KEY(Grocery_Run) REFERENCES GROCERY_RUN(ID),
	FOREIGN KEY(Product) REFERENCES PRODUCT(Name),
	Price DECIMAL(10, 2),
	Amount SMALLINT,
	PRIMARY KEY(Grocery_Run, Product)
);

CREATE TABLE FOUND_AT (
	S_Name VARCHAR(50),
    	S_Num SMALLINT,
    	S_Street VARCHAR(50),
    	S_City VARCHAR(50),
    	S_Country VARCHAR(50),
    	Product VARCHAR(50),
    	FOREIGN KEY(S_Name) REFERENCES STORE(Name),
	FOREIGN KEY(S_Num) REFERENCES STORE(Num),
	FOREIGN KEY(S_Street) REFERENCES STORE(Street),
	FOREIGN KEY(S_City) REFERENCES STORE(City),
	FOREIGN KEY(S_Country) REFERENCES STORE(Country),
	FOREIGN KEY(Product) REFERENCES PRODUCT(Name),
	Price DECIMAL(10,2),
	PRIMARY KEY(S_Name, S_Num, S_Street, S_City, S_Country, Product)
);

CREATE TABLE OWNS (
	Product VARCHAR(50),
    	Chef VARCHAR(50),
    	FOREIGN KEY(Product) REFERENCES PRODUCT(Name),
	FOREIGN KEY(Chef) REFERENCES USER(Email),
	Amount INT,
	PRIMARY KEY(Product, Chef)
);

CREATE TABLE DIET_RESTRICTION (
	Chef VARCHAR(50) PRIMARY KEY,
   	FOREIGN KEY(Chef) REFERENCES USER(Email),
	Diet_Restriction VARCHAR(50)
);

CREATE TABLE RECIPE (
	ID INT PRIMARY KEY,
	Name VARCHAR(50),
	Instructions TEXT,
    	Writer VARCHAR(50) NOT NULL,
	FOREIGN KEY(Writer) REFERENCES USER(Email)
);

CREATE TABLE REVIEW (
	ID INT PRIMARY KEY,
	Comment TEXT,
	Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    	Writer VARCHAR(50) NOT NULL,
    	Rates INT NOT NULL,
	FOREIGN KEY(Writer) REFERENCES User(Email),
	FOREIGN KEY(Rates) REFERENCES RECIPE(ID)
);

CREATE TABLE CUISINE (
	R_ID INT,
    	FOREIGN KEY(R_ID) REFERENCES RECIPE(ID),
	Cuisine VARCHAR(600),
	PRIMARY KEY(R_ID, Cuisine)
);

CREATE TABLE DIET_TAG (
	R_ID INT,
    	FOREIGN KEY(R_ID) REFERENCES RECIPE(ID),
	Diet_Tag VARCHAR(600),
	PRIMARY KEY(R_ID, Diet_Tag)

);

CREATE TABLE MEAL (
	Chef VARCHAR(50) NOT NULL,
    	FOREIGN KEY(Chef) REFERENCES USER(Email),
	Prepare_Date DATE NOT NULL,
    	Recipe INT NOT NULL,
    	INDEX(Chef),
    	INDEX(Prepare_Date),
	FOREIGN KEY(Recipe) REFERENCES RECIPE(ID),
	PRIMARY KEY(Chef, Prepare_Date, Recipe)
);

CREATE TABLE USES (
	Recipe INT NOT NULL,
   	Product VARCHAR(50),
    	Amount SMALLINT,
    	FOREIGN KEY(Recipe) REFERENCES RECIPE(ID),
	FOREIGN KEY(Product) REFERENCES PRODUCT(Name),
	PRIMARY KEY(Recipe, Product)

);

CREATE TABLE SOURCES (
	S_Chef VARCHAR(50),
	S_Prepare_Date DATE,
	S_Recipe INT,
	S_Grocery INT NOT NULL,
	FOREIGN KEY(S_Chef) REFERENCES MEAL(Chef),
	FOREIGN KEY(S_Prepare_Date) REFERENCES MEAL(Prepare_Date),
	FOREIGN KEY(S_Recipe) REFERENCES MEAL(Recipe),
	FOREIGN KEY(S_Grocery) REFERENCES GROCERY_RUN(ID),
	PRIMARY KEY(S_Chef, S_Prepare_Date, S_Recipe, S_Grocery)
);

INSERT INTO USER VALUES('Wila', 'wbraga3@gatech.edu', 'hunter2', 101, 'Carrer de Sardenya', 'BCN', 'ES', TRUE, TRUE);
INSERT INTO USER VALUES('George', 'gburdell9@gatech.edu', 'gatech1930', 711, 'Techwood Dr NW', 'ATL', 'US', FALSE, TRUE);
INSERT INTO USER VALUES('Angel', 'acabrera1@gatech.edu', 'num1boss', 100, 'President’s House', 'ATL', 'US', FALSE, TRUE);
INSERT INTO USER VALUES('Temp', 'temp@gmail.com', 'zzz', 4000, 'Weston Rd', 'Weston', 'US', TRUE, FALSE);

INSERT INTO PRODUCT VALUES('Olive Oil', 'mL', FALSE);
INSERT INTO PRODUCT VALUES('Potato', 'units', FALSE);
INSERT INTO PRODUCT VALUES('Garlic', 'cloves', FALSE);
INSERT INTO PRODUCT VALUES('Paprika', 'g', FALSE);
INSERT INTO PRODUCT VALUES('Chicken Broth', 'mL', FALSE);
INSERT INTO PRODUCT VALUES('Sunflower Oil', 'mL', FALSE);
INSERT INTO PRODUCT VALUES('Deep Fryer', 'unit', TRUE);
INSERT INTO PRODUCT VALUES('Beef', 'g', FALSE);
INSERT INTO PRODUCT VALUES('Shallot', 'unit', FALSE);
INSERT INTO PRODUCT VALUES('White Wine', 'mL', FALSE);
INSERT INTO PRODUCT VALUES('Onion', 'unit', FALSE);
INSERT INTO PRODUCT VALUES('Egg', 'unit', FALSE);
INSERT INTO PRODUCT VALUES('Flour', 'g', FALSE);
INSERT INTO PRODUCT VALUES('Bread Crumbs', 'g', FALSE);
INSERT INTO PRODUCT VALUES('Bay Leaf', 'unit', FALSE);
INSERT INTO PRODUCT VALUES('Tomato', 'unit', FALSE);
INSERT INTO PRODUCT VALUES('Saffron', 'g', FALSE);
INSERT INTO PRODUCT VALUES('Bell Pepper', 'unit', FALSE);
INSERT INTO PRODUCT VALUES('Chicken Thigh', 'unit', FALSE);
INSERT INTO PRODUCT VALUES('Parsley', 'g', FALSE);
INSERT INTO PRODUCT VALUES('Spanish Rice', 'g', FALSE);
INSERT INTO PRODUCT VALUES('Shrimp', 'g', FALSE);
INSERT INTO PRODUCT VALUES('Lemon', 'unit', FALSE);

INSERT INTO TYPE VALUES('Olive Oil', 'Oil');
INSERT INTO TYPE VALUES('Potato', 'Produce');
INSERT INTO TYPE VALUES('Garlic', 'Produce');
INSERT INTO TYPE VALUES('Onion', 'Produce');
INSERT INTO TYPE VALUES('Paprika', 'Produce');
INSERT INTO TYPE VALUES('Chicken Broth', 'Stock');
INSERT INTO TYPE VALUES('Sunflower Oil', 'Oil');
INSERT INTO TYPE VALUES('Beef', 'Meat');
INSERT INTO TYPE VALUES('Beef', 'Refrigerated');
INSERT INTO TYPE VALUES('Shallot', 'Produce');
INSERT INTO TYPE VALUES('White Wine', 'Drink');
INSERT INTO TYPE VALUES('Egg', 'Meat');
INSERT INTO TYPE VALUES('Egg', 'Refrigerated');
INSERT INTO TYPE VALUES('Flour', 'Grain');
INSERT INTO TYPE VALUES('Bread Crumbs', 'Grain');
INSERT INTO TYPE VALUES('Bay Leaf', 'Product');
INSERT INTO TYPE VALUES('Bay Leaf', 'Spice');
INSERT INTO TYPE VALUES('Tomato',  'Produce');
INSERT INTO TYPE VALUES('Saffron', 'Spice');
INSERT INTO TYPE VALUES('Bell Pepper', 'Produce');
INSERT INTO TYPE VALUES('Bell Pepper', 'Refrigerated');
INSERT INTO TYPE VALUES('Chicken Thigh', 'Meat');
INSERT INTO TYPE VALUES('Chicken Thigh', 'Refrigerated');
INSERT INTO TYPE VALUES('Parsley', 'Produce');
INSERT INTO TYPE VALUES('Parsley', 'Refrigerated');
INSERT INTO TYPE VALUES('Spanish Rice', 'Grain');
INSERT INTO TYPE VALUES('Shrimp', 'Meat');
INSERT INTO TYPE VALUES('Shrimp', 'Refrigerated');
INSERT INTO TYPE VALUES('Lemon', 'Produce');

INSERT INTO STORE VALUES ('Mercadona', 3, 'Placa Fort Pienc', 'BCN', 'ES', 'Supermercat');
INSERT INTO STORE VALUES ('El Corte Ingles', 617, 'Avinguda Diagonal', 'BCN', 'ES', 'Centre Commercial');

INSERT INTO RECIPE VALUES(1, 'Paella', 'https://tastesbetterfromscratch.com/paella/', 'wbraga3@gatech.edu');
INSERT INTO RECIPE VALUES(2, 'Patatas Bravas', 'https://www.pequerecetas.com/receta/patatas-bravas-tapas/', 'wbraga3@gatech.edu');
INSERT INTO RECIPE VALUES(3, 'Bomba de la Barceloneta', 'https://www.recetasderechupete.com/bombas-de-patata-a-la-barceloneta/19929/', 'gburdell9@gatech.edu');

INSERT INTO USES VALUES(1, 'Olive Oil', 50);
INSERT INTO USES VALUES(1, 'Onion', 50);
INSERT INTO USES VALUES(1, 'Bell Pepper', 1);
INSERT INTO USES VALUES(1, 'Garlic', 16);
INSERT INTO USES VALUES(1, 'Tomato', 3);
INSERT INTO USES VALUES(1, 'Bay Leaf', 1);
INSERT INTO USES VALUES(1, 'Paprika', 2);
INSERT INTO USES VALUES(1, 'Saffron', 1);
INSERT INTO USES VALUES(1, 'White Wine', 50);
INSERT INTO USES VALUES(1, 'Chicken Thigh', 4);
INSERT INTO USES VALUES(1, 'Parsley', 5);
INSERT INTO USES VALUES(1, 'Spanish Rice', 400);
INSERT INTO USES VALUES(1, 'Chicken Broth', 1000);
INSERT INTO USES VALUES(1, 'Shrimp', 1000);
INSERT INTO USES VALUES(1, 'Lemon', 1);

INSERT INTO USES VALUES(2, 'Olive Oil', 20);
INSERT INTO USES VALUES(2, 'Potato', 10);
INSERT INTO USES VALUES(2, 'Garlic', 5);
INSERT INTO USES VALUES(2, 'Flour', 10);
INSERT INTO USES VALUES(2, 'Paprika', 10);
INSERT INTO USES VALUES(2, 'Chicken Broth', 250);
INSERT INTO USES VALUES(2, 'Sunflower Oil', 700);
INSERT INTO USES VALUES(2, 'Deep Fryer', 1);

INSERT INTO USES VALUES(3, 'Potato', 3);
INSERT INTO USES VALUES(3, 'Beef', 40);
INSERT INTO USES VALUES(3, 'Shallot', 1);
INSERT INTO USES VALUES(3, 'White Wine', 50);
INSERT INTO USES VALUES(3, 'Egg', 1);
INSERT INTO USES VALUES(3, 'Flour', 80);
INSERT INTO USES VALUES(3, 'Bread Crumbs', 80);
INSERT INTO USES VALUES(3, 'Olive Oil', 50);
INSERT INTO USES VALUES(3, 'Sunflower Oil', 700);
INSERT INTO USES VALUES(3, 'Deep Fryer', 1);

INSERT INTO DIET_RESTRICTION VALUES('wbraga3@gatech.edu', NULL);
INSERT INTO DIET_RESTRICTION VALUES('temp@gmail.com', 'Vegan, Low-cal');

INSERT INTO REVIEW VALUES(1, '16 cloves of garlic?', 3, 'acabrera1@gatech.edu', 1);
INSERT INTO REVIEW VALUES(2, 'Good, but not traditional…', 4, 'gburdell9@gatech.edu', 1);
INSERT INTO REVIEW VALUES(3, 'Just like the ones at UPC!', 5, 'gburdell9@gatech.edu', 2);
INSERT INTO REVIEW VALUES(4, NULL, 5, 'wbraga3@gatech.edu', 3);

INSERT INTO CUISINE VALUES(1, 'Spanish');
INSERT INTO CUISINE VALUES(2, 'Spanish');
INSERT INTO CUISINE VALUES(3, 'Spanish');
INSERT INTO CUISINE VALUES(3, 'Catalan');

INSERT INTO DIET_TAG VALUES(1, 'Mediterranean');
INSERT INTO DIET_TAG VALUES(1, 'No-nuts');
INSERT INTO DIET_TAG VALUES(2, 'No-nuts');
INSERT INTO DIET_TAG VALUES(3, 'No-nuts');

INSERT INTO OWNS VALUES('Potato', 'wbraga3@gatech.edu', 12);
INSERT INTO OWNS VALUES('Beef', 'wbraga3@gatech.edu', 100);
INSERT INTO OWNS VALUES('Shallot', 'wbraga3@gatech.edu', 6);
INSERT INTO OWNS VALUES('White Wine', 'wbraga3@gatech.edu', 1000);
INSERT INTO OWNS VALUES('Egg', 'wbraga3@gatech.edu', 12);
INSERT INTO OWNS VALUES('Flour', 'wbraga3@gatech.edu', 1000);
INSERT INTO OWNS VALUES('Bread Crumbs', 'wbraga3@gatech.edu', 250);
INSERT INTO OWNS VALUES('Olive Oil', 'wbraga3@gatech.edu', 1000);
INSERT INTO OWNS VALUES('Sunflower Oil', 'wbraga3@gatech.edu', 1000);
INSERT INTO OWNS VALUES('Deep Fryer', 'wbraga3@gatech.edu', 1);

INSERT INTO MEAL VALUES('wbraga3@gatech.edu', '2022-06-20', 3);

INSERT INTO GROCERY_RUN VALUES(1, '2022-06-19', 'Mercadona', 3, 'Placa Fort Pienc', 'BCN', 'ES', 'wbraga3@gatech.edu');

INSERT INTO SOURCES VALUES('wbraga3@gatech.edu', '2022-06-20', 3, 1);

INSERT INTO OBTAINS VALUES(1, 'Potato', 3.00, 12);
INSERT INTO OBTAINS VALUES(1, 'Shallot', 3.00, 4);
INSERT INTO OBTAINS VALUES(1, 'Beef', 5.00, 100);
INSERT INTO OBTAINS VALUES(1, 'White Wine', 6.00, 1000);
INSERT INTO OBTAINS VALUES(1, 'Egg', 4.00, 12);

INSERT INTO FOUND_AT VALUES('El Corte Ingles', 3, 'Avinguda Diagonal', 'BCN', 'ES', 'Deep Fryer', 150.00);
