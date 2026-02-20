WITH prorated_costs AS (
    SELECT
        p.id AS project_id,
        p.title,
        p.budget,
        (p.end_date - p.start_date) AS project_days,
        e.salary * (p.end_date - p.start_date) / 365.0 AS prorated_salary
    FROM linkedin_projects AS p
    INNER JOIN linkedin_emp_projects AS ep
        ON p.id = ep.project_id
    INNER JOIN linkedin_employees AS e
        ON ep.emp_id = e.id
),

project_totals AS (
    SELECT
        project_id,
        title,
        budget,
        CEIL(SUM(prorated_salary)) AS total_prorated_cost
    FROM prorated_costs
    GROUP BY project_id, title, budget
)

SELECT
    title AS project_name,
    budget,
    total_prorated_cost
FROM project_totals
WHERE total_prorated_cost > budget;
