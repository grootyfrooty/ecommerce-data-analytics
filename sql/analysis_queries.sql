SELECT o.order_id, o.order_date, o.city, d.order_amount, d.order_category
FROM list_of_orders o
JOIN order_details d ON o.order_id = d.order_id
LIMIT 10;

SELECT d.order_category, SUM(d.order_amount) AS total_revenue
FROM list_of_orders o
JOIN order_details d ON o.order_id = d.order_id
GROUP BY d.order_category
ORDER BY total_revenue DESC;

SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(d.order_amount) AS monthly_revenue
FROM list_of_orders o
JOIN order_details d ON o.order_id = d.order_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;


--Query 1:  Running total of monthly revenue (window function)
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(d.order_amount) AS monthly_revenue,
    SUM(SUM(d.order_amount)) OVER (ORDER BY DATE_TRUNC('month', o.order_date)) AS running_total
FROM list_of_orders o
JOIN order_details d ON o.order_id = d.order_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;



SELECT o.order_id, o.order_date, o.city,o.state, d.order_amount, d.order_category
FROM list_of_orders o
JOIN order_details d ON o.order_id = d.order_id
LIMIT 10;

SELECT o.state, SUM(d.order_amount) AS total_revenue
FROM list_of_orders o
JOIN order_details d ON o.order_id = d.order_id
GROUP BY o.state
ORDER BY total_revenue DESC

-- Query 2: Running rank of states by monthly revenue (window function)
SELECT 
    o.state, 
    SUM(d.order_amount) AS total_revenue,
    RANK() OVER (ORDER BY SUM(d.order_amount) DESC) AS revenue_rank
FROM list_of_orders o
JOIN order_details d ON o.order_id = d.order_id
GROUP BY o.state
ORDER BY total_revenue DESC;

-- Query 3: Category-level profit breakdown for loss-making states (CTE chain)
WITH state_profit AS (
    SELECT o.state, SUM(d.order_profit) AS total_profit
    FROM list_of_orders o
    JOIN order_details d ON o.order_id = d.order_id
    GROUP BY o.state
),
bad_states AS (
    SELECT state FROM state_profit WHERE total_profit < 0
),
category_breakdown AS (
    SELECT o.state, d.order_category, SUM(d.order_profit) AS category_profit
    FROM list_of_orders o
    JOIN order_details d ON o.order_id = d.order_id
    WHERE o.state IN (SELECT state FROM bad_states)
    GROUP BY o.state, d.order_category
)
SELECT * FROM category_breakdown
ORDER BY state, category_profit ASC;