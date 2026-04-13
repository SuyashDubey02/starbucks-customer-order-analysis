-- created a database scop
create database scop; 
use scop; 

select * from starbucks_customer_ordering_patterns
limit 100;


-- 1. Total Revenue
SELECT SUM(total_spend) AS total_revenue
FROM starbucks_customer_ordering_patterns;


-- 2. Average Order Value
SELECT ROUND(AVG(total_spend),2) AS avg_order_value
FROM starbucks_customer_ordering_patterns;


-- 3. Peak Order Hours
SELECT EXTRACT(HOUR FROM order_time) AS hour,
       COUNT(*) AS total_orders
FROM starbucks_customer_ordering_patterns
GROUP BY hour
ORDER BY total_orders DESC;


-- 4. Region Wise Sales
SELECT region,
       SUM(total_spend) AS revenue
FROM starbucks_customer_ordering_patterns
GROUP BY region
ORDER BY revenue DESC;


-- 5. Best Drink Category
SELECT drink_category,
       SUM(total_spend) AS sales
FROM starbucks_customer_ordering_patterns
GROUP BY drink_category
ORDER BY sales DESC;


-- 6. Rewards vs Non-Rewards
SELECT is_rewards_member,
       AVG(total_spend) AS avg_spend,
       AVG(customer_satisfaction) AS avg_rating
FROM starbucks_customer_ordering_patterns
GROUP BY is_rewards_member;


-- 7. Satisfaction by Fulfillment Speed
SELECT 
    CASE
        WHEN fulfillment_time_min <= 5 THEN 'Fast'
        WHEN fulfillment_time_min <= 10 THEN 'Medium'
        ELSE 'Slow'
    END AS speed_bucket,
    AVG(customer_satisfaction) AS avg_rating
FROM starbucks_customer_ordering_patterns
GROUP BY speed_bucket;


-- 8. Weekend vs Weekdays Orders
SELECT day_of_week,
       COUNT(*) AS total_orders,
       SUM(total_spend) AS sales
FROM starbucks_customer_ordering_patterns
GROUP BY day_of_week;


-- 9. Satisfaction by channel
SELECT order_channel,
       AVG(customer_satisfaction) AS avg_rating
FROM starbucks_customer_ordering_patterns
GROUP BY order_channel;