# E-commerce Database Design

## Overview

This repository contains the Entity-Relationship Diagram (ERD) and SQL script for an e-commerce database. This project was created as part of a database design assignment to demonstrate understanding of relational database principles and their application in a real-world e-commerce scenario.

## Database Description

The database is designed to support the core functionality of an e-commerce platform, including:

* **Product Catalog Management:** Organizing and storing information about products, including details, variations, and categories.
* **Product Browsing:** Enabling users to browse and search for products based on various criteria.
* **Product Variations:** Handling products that come in different sizes, colors, and other options.
* **Inventory Management:** Tracking the stock levels of individual product items.
* **Product Attributes:** Supporting flexible product specifications using attributes and categories.

## Entity-Relationship Diagram (ERD)

The ERD visually represents the structure of the database, showing the entities (tables) and their relationships.

### Image
![E-commerce ERD](Desktop/Database_groupAssignment/ERD.png)

### Textual Representation

-- Create the product_category table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    
);

-- Create the brand table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    logo_url VARCHAR(2048)
);

-- Create the size_category table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the size_option table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    size_value VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Create the color table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    hex_code VARCHAR(10) NOT NULL
);

-- Create the attribute_category table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the attribute_type table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    attribute_category_id INT,
    name VARCHAR(255) NOT NULL,
    data_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

-- Create the product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    brand_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    base_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

-- Create the product_variation table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    size_option_id INT,
    color_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

-- Create the product_item table
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT,
    stock_quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Create the product_image table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    image_url VARCHAR(2048) NOT NULL,
    alt_text VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES product_item(item_id)
);

-- Create the product_attribute_value table
CREATE TABLE product_attribute_value (
    product_attribute_value_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_type_id INT,
    value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

## Database Schema (ecommerce.sql)

The `ecommerce.sql` file contains the SQL statements to create the database schema, including tables, columns, data types, primary keys, and foreign keys.  It can be used to set up the database in a relational database management system (RDBMS) such as MySQL, PostgreSQL, or MariaDB.

## Table Details

Here's a brief description of the tables in the database:

* **`product_category`**: Stores product categories (e.g., Clothing, Electronics, Home Goods).
* **`brand`**: Stores brand information.
* **`size_category`**: Groups sizes into categories (e.g., Clothing Sizes, Shoe Sizes).
* **`size_option`**: Lists specific sizes (e.g., S, M, L, 38, 39, 40).
* **`color`**: Stores color information.
* **`attribute_category`**: Groups attributes into categories (e.g., Physical, Technical).
* **`attribute_type`**: Defines types of attributes (e.g., Text, Number, Boolean).
* **`product`**: Stores general product details (e.g., name, description, base price).
* **`product_variation`**: Links a product to its variations (e.g., size, color).
* **`product_item`**: Represents a specific, purchasable instance of a product variation.
* **`product_image`**: Stores product image URLs or file paths.
* **`product_attribute_value`**: Stores the values of product attributes.

## Assumptions and Design Decisions

* **Product Variations:** The `product_variation` table is used to handle products with variations in size, color, and other attributes.  This allows for efficient storage of product information and prevents data duplication.
* **Inventory Management:** The `product_item` table tracks the stock quantity for each specific product variation.
* **Product Attributes:** The `attribute_category`, `attribute_type`, and `product_attribute_value` tables provide a flexible way to store and manage product-specific attributes.
* **Image Storage**: The `product_image` table stores URLs.

## How to Use

1.  Clone this repository to your local machine.
2.  Use the `ecommerce.sql` file to create the database schema in your RDBMS.
3.  The ERD is provided in both image (`Desktop/Database_groupAssignment/ERD.png`) and textual format for reference.

## Group Collaboration

* We used Git and GitHub for version control and collaboration.
* Regular meetings were held to discuss the database design and resolve any issues.
* For this project, we relied heavily on the following tools:
    * **GitHub:** For version control, issue tracking, and code/file sharing.
    * **Google Docs:** For collaborative document editing, meeting agendas, and design documentation.
    * **Draw.io:** For creating and sharing the Entity-Relationship Diagram.
* We held regular meeting to synchronize our work, discuss design choices, and resolve any roadblocks.
* All members actively participated in the design process, contributing to both the ERD and the SQL script.


## Future Enhancements

* Implement tables for order management, customer accounts, and shopping cart functionality.
* Add support for more complex product pricing scenarios (e.g., sales, discounts).
* Incorporate more advanced inventory management features (e.g., warehouse tracking).
* Implement a review system.

## Contributions

* adebi	georgina marbella914u@gmail.com
* neliswa	ntintili ntintilineliswa@gmail.com
* chukwunonso	kuzue kuzuechinonsojude@gmail.com
* ogunleye	olasunkanmi abdulazeez.ogunleye@gmail.com
* joshua	muthama joshuawaema@gmail.com
* solomon ovie	okomowho kkfsolutions.ng@gmail.com
* adebanjo	ogunseye adebanjo.ogunse@gmail.com
* denis	mwangi denismuturi34@gmail.com
* sylvia	hamisi	sylviaomonja366@gmail.com
* deborah	momanyi	moraadeborah199@gmail.com


