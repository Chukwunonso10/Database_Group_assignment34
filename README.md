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
![E-commerce ERD](Desktop/Database_groupAssignment/ecommerce_erd.png)

### Textual Representation

Table product_category {category_id integer [primary key, increment]name varchardescription text}Table brand {brand_id integer [primary key, increment]name varcharlogo_url varchar}Table size_category {size_category_id integer [primary key, increment]name varchar}Table size_option {size_option_id integer [primary key, increment]size_category_id integersize_value varchar}Table color {color_id integer [primary key, increment]name varcharhex_code varchar}Table attribute_category {attribute_category_id integer [primary key, increment]name varchar}Table attribute_type {attribute_type_id integer [primary key, increment]attribute_category_id integername varchardata_type varchar}Table product {product_id integer [primary key, increment]category_id integerbrand_id integername varchardescription textbase_price decimal}Table product_variation {variation_id integer [primary key, increment]product_id integersize_option_id integercolor_id integersku varchar [unique]}Table product_item {item_id integer [primary key, increment]variation_id integerstock_quantity integerprice decimal}Table product_image {image_id integer [primary key, increment]item_id integerimage_url varcharalt_text varchar}Table product_attribute_value {product_attribute_value_id integer [primary key, increment]product_id integerattribute_type_id integervalue varchar}Ref: product.category_id > product_category.category_idRef: product.brand_id > brand.brand_idRef: product_variation.product_id > product.product_idRef: product_variation.size_option_id > size_option.size_option_idRef: product_variation.color_id > color.color_idRef: product_item.variation_id > product_variation.variation_idRef: product_image.item_id > product_item.item_idRef: size_option.size_category_id > size_category.size_category_idRef: product_attribute_value.product_id > product.product_idRef: product_attribute_value.attribute_type_id > attribute_type.attribute_type_idRef: attribute_type.attribute_category_id > attribute_category.attribute_category_id
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
3.  The ERD is provided in both image (`Desktop/Database_groupAssignment/ecommerce_erd.png`) and textual format for reference.

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


