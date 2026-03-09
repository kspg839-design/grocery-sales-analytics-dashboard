
-- DATABASE SETUP

CREATE DATABASE sales_dataset;
USE sales_dataset;

SELECT count(*) AS Total_rows
FROM grocery_chain_data;

-- DATA CLEANING

ALTER TABLE grocery_chain_data
MODIFY transaction_date DATE ;

CREATE VIEW sales_positive AS
SELECT ï»¿customer_id AS customer_id, store_name, transaction_date, aisle, product_name, quantity, unit_price, total_amount, discount_amount, final_amount, loyalty_points
FROM grocery_chain_data
WHERE final_amount >= 0;

-- BASIC KPI ANALYSIS

SELECT 
ROUND(SUM(final_amount), 2) AS Total_sales
FROM sales_positive
WHERE transaction_date BETWEEN '2024-02-01' AND '2024-02-29';

SELECT
round(SUM(final_amount), 2) AS Previous_month_sales
FROM sales_positive
WHERE transaction_date BETWEEN '2024-01-01' AND '2024-01-31';

SELECT 
COUNT(DISTINCT customer_id) AS Total_orders
FROM sales_positive
WHERE transaction_date BETWEEN '2024-02-01' AND '2024-02-29';

SELECT 
SUM(quantity) AS total_quantity_sold
FROM sales_positive
WHERE transaction_date BETWEEN '2024-02-01' AND '2024-02-29';


SELECT 
ROUND(SUM(final_amount) / COUNT(DISTINCT customer_id),2) AS avg_order_value
FROM sales_positive
WHERE transaction_date BETWEEN '2024-02-01' AND '2024-02-29';

SELECT SUM(final_amount) as total_sales,
MONTHNAME(transaction_date) AS Month
FROM sales_positive
GROUP BY Month
ORDER BY total_sales DESC
LIMIT 10;

-- PRODUCT ANALYSIS

SELECT
product_name,
ROUND(SUM(final_amount), 2) AS Revenue
FROM sales_positive
WHERE transaction_date BETWEEN '2024-02-01' AND '2024-02-29'
GROUP BY product_name
ORDER BY Revenue DESC;

-- STORE ANALYSIS

SELECT
store_name,
ROUND(SUM(final_amount), 2) AS Revenue
FROM sales_positive
WHERE transaction_date BETWEEN '2024-02-01' AND '2024-02-29'
GROUP BY store_name
ORDER BY Revenue DESC;


-- ADVANCE ANALYSIS

WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(transaction_date, '%Y-%m') AS month,
        SUM(final_amount) AS revenue
    FROM sales_positive
    GROUP BY month
)
SELECT 
month,
ROUND(revenue,2) as revenue,
ROUND((revenue - LAG(revenue) OVER (ORDER BY month)), 2) as diff_of_revenue,
ROUND(
(revenue - LAG(revenue) OVER (ORDER BY month))
/
LAG(revenue) OVER (ORDER BY month)
*100
,2) AS mom_growth_percent
FROM monthly_sales;



SELECT 
store_name,
ROUND(SUM(final_amount),2) AS revenue,
RANK() OVER (ORDER BY SUM(final_amount) DESC) AS store_rank
FROM sales_positive
GROUP BY store_name;


WITH top_customers AS (
    SELECT 
        customer_id,
        COUNT(*) AS total_transactions,
        SUM(final_amount) AS total_spent
    FROM sales_positive
    GROUP BY customer_id
    ORDER BY total_spent DESC
    LIMIT 10
)

SELECT 
    tc.customer_id,
    tc.total_spent,
    tc.total_transactions,
    sp.store_name,
    COUNT(*) AS store_transactions
FROM sales_positive as sp
JOIN top_customers as tc
    ON sp.customer_id = tc.customer_id
GROUP BY 
    tc.customer_id,
    tc.total_spent,
    tc.total_transactions,
    sp.store_name
ORDER BY tc.total_spent DESC;

SELECT * FROM sales_positive
WHERE customer_id = 2276;





