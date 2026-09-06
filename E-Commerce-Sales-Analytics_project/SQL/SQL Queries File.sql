-- Query-1 : TOP 10 PROFITABLE PRODUCTS

SELECT product_name,SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;
 
-- Query-2 : TOP 10 CUSTOMERS BY SALES

SELECT customer_name, sum(sales) AS total_sales
FROM sales_data
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10; 

-- Query-3 : REGION WISE TOTAL SALES

SELECT region,sum(sales) as total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- Query-4 : CATEGORY WISE AVERAGE PROFIT

SELECT category,AVG(profit) AS average_profit
FROM sales_data
GROUP BY category
ORDER BY average_profit DESC;

-- Query-5 : HIGHEST DISCOUNT CATEGORY

SELECT category,max(discount) AS maximum_discount
FROM sales_data
GROUP BY category
ORDER BY maximum_discount
LIMIT 1;

-- Query-6 : ORDERS WITH NEGATIVE PROFIT

SELECT order_id,product_name,sales,profit
FROM sales_data
WHERE profit < 0
ORDER BY profit ASC;

-- Query-7 : MONTHLY SALES TREND

SELECT
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
    SUM(sales) AS total_sales
FROM sales_data
WHERE order_date IS NOT NULL
GROUP BY
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY year, month;

-- Query-8 : MARKET WISE REVENUE ANALYSIS

SELECT market,sum(sales) AS total_revenue
FROM sales_data
GROUP BY market
ORDER BY total_revenue DESC;

-- Query-9 : TOP PERFORMING SUB CATEGORIES

SELECT sub_category,sum(sales) as total_sales
FROM sales_data
GROUP BY sub_category
ORDER BY total_sales DESC;

-- Query-10 : SHIP MODE USAGE ANALYSIS

SELECT ship_mode,COUNT(*) AS order_count
FROM sales_data
GROUP BY ship_mode
ORDER BY order_count DESC;

