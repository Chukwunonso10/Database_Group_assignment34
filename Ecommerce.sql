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
