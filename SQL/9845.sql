SELECT COUNT(joining_date) FROM worker
WHERE department = 'Admin' AND EXTRACT(MONTH FROM joining_date) > 3;
