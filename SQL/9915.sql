WITH daily_totals AS (
    SELECT
        c.first_name,
        DATE(o.order_date) AS order_day,
        SUM(o.total_order_cost) AS daily_total
    FROM customers c
    JOIN orders o
        ON c.id = o.cust_id
    WHERE o.order_date BETWEEN DATE '2019-02-01' AND DATE '2019-05-01'
    GROUP BY c.first_name, DATE(o.order_date)
),
max_per_day AS (
    SELECT
        order_day,
        MAX(daily_total) AS max_daily_total
    FROM daily_totals
    GROUP BY order_day
)
SELECT
    d.first_name,
    d.daily_total AS total_cost,
    d.order_day AS order_date
FROM daily_totals d
JOIN max_per_day m
    ON d.order_day = m.order_day
   AND d.daily_total = m.max_daily_total
ORDER BY d.order_day, d.first_name;