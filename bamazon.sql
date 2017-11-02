CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products (
  item_id INT AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  department VARCHAR(30) NOT NULL,
  price DECIMAL(6,2) NOT NULL,
  stock_quantity INT(5) NOT NULL,
  PRIMARY KEY(item_id)
);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Torn Dark Wash Denim Jeans", "Jeans", 125.99, 30);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Navy Blue Leggings", "Pants", 29.99, 5);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Puffer Jacket", "Jackets", 49.99, 12);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Fleece Crewneck Sweatshirt", "Tops", 11.99, 6);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Graphic White Tee", "Tops", 14.99, 21);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Khaki Slacks", "Pants", 53.99, 25);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Red Blazer", "Jackets", 69.99, 3);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Long Sleeve Button-Up Shirt", "Tops", 19.99, 25);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Little Black Dress", "Dresses", 49.99, 10);

INSERT INTO products (product_name, department, price, stock_quantity)
VALUES ("Purple Maxi Dress", "Dresses", 29.99, 15);
