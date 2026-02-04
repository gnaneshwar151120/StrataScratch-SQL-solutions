SELECT
    department,
    COUNT(joining_date)
FROM worker
WHERE joining_date > '2014-04-01'
GROUP BY department;
