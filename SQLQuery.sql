CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE ecommerce_sale (
    order_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    sales DECIMAL(10,2),
    profit DECIMAL(10,2)
);
SELECT * FROM ecommerce_sales_data;
SELECT *
FROM ecommerce_sales_data
WHERE sales > 5000;

SELECT *
FROM ecommerce_sales_data
WHERE category = 'Electronics';

SELECT *
FROM ecommerce_sales_data
ORDER BY sales DESC;

SELECT
    region,
    SUM(sales) AS total_sales
FROM ecommerce_sales_data
GROUP BY region
ORDER BY total_sales DESC;


SELECT
    category,
    AVG(sales) AS avg_sales
FROM ecommerce_sales_data
GROUP BY category;

SELECT
    category,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY category
ORDER BY total_profit DESC;


SELECT
    product_name,
    SUM(sales) AS total_sales
FROM ecommerce_sales_data
GROUP BY product_name
ORDER BY total_sales DESC;

SELECT
    product_name,
    AVG(sales) AS avg_revenue
FROM ecommerce_sales_data
GROUP BY product_name
ORDER BY avg_revenue DESC;

SELECT
    region,
    COUNT(*) AS total_orders
FROM ecommerce_sales_data
GROUP BY region;

SELECT *
FROM ecommerce_sales_data
WHERE sales >
(
    SELECT AVG(sales)
    FROM ecommerce_sales_data
);

SELECT *
FROM ecommerce_sales_data
WHERE profit >
(
    SELECT AVG(profit)
    FROM ecommerce_sales_data
);

SELECT *
FROM ecommerce_sales_data
WHERE sales =
(
    SELECT MAX(sales)
    FROM ecommerce_sales_data
);

SELECT
    product_name,
    SUM(quantity) AS total_quantity
FROM ecommerce_sales_data
GROUP BY product_name
ORDER BY total_quantity DESC;



SELECT
    MONTH(order_date) AS month_no,
    SUM(sales) AS monthly_sales
FROM ecommerce_sales_data
GROUP BY MONTH(order_date)
ORDER BY month_no;


CREATE VIEW regional_sales_summary AS
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY region;

SELECT * FROM regional_sales_summary;



CREATE VIEW product_performance AS
SELECT
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY product_name;

SELECT * FROM product_performance;


CREATE INDEX idx_region
ON ecommerce_sales_data(region);

CREATE INDEX idx_category
ON ecommerce_sales_data(category);

CREATE INDEX idx_product
ON ecommerce_sales_data(product_name);


SELECT
    product_name,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY product_name
ORDER BY total_profit DESC



SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY region
ORDER BY total_sales DESC;