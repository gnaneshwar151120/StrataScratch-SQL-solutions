select 
abs(
    (select max(a.salary) from db_employee a
    join 
    db_dept b
    on a.department_id=b.id
    where b.department='engineering') -
    (select max(a.salary) from db_employee a
    join 
    db_dept b
    on a.department_id=b.id
    where b.department='marketing')
) AS salary_difference;