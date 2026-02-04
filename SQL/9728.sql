SELECT
    EXTRACT(YEAR FROM inspection_date) AS year,
    COUNT(violation_id)
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
GROUP BY business_name, year
ORDER BY year;
