/* CREATE DATABASE SampleDB; */

CREATE TABLE Products (
	Id INT PRIMARY KEY,
	Name VARCHAR(40)
);
CREATE TABLE Categories (
	Id INT PRIMARY KEY,
	Name VARCHAR(40)
);
CREATE TABLE ProductCategoryJunction (
	ProductID int,
	FOREIGN KEY(ProductId) REFERENCES Products (Id),
	CategoryId INT
	FOREIGN KEY(CategoryId) REFERENCES Categories (Id)
);

INSERT INTO Products
VALUES
	(1, 'Bread'),
	(2, 'Croissant'),
	(3, 'Chicken'),
	(4, 'Beef'),
	(5, 'Kvas'),
	(6, 'Wine'),
	(7, 'Meat pies'),
	(8, 'Sugar');

INSERT INTO Categories
VALUES
	(1, 'Bakery'),
	(2, 'Meat'),
	(3, 'Drinks');

INSERT INTO ProductCategoryJunction
VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2),
	(5, 1),
	(5, 3),
	(6, 3),
	(7, 1),
	(7, 2);

SELECT Products."Name" as ProductName, Categories."Name" as CategoeryName
FROM Products
LEFT JOIN ProductCategoryJunction
	ON Products.Id = ProductCategoryJunction.ProductId
LEFT JOIN Categories
	ON ProductCategoryJunction.CategoryId = Categories.Id;
