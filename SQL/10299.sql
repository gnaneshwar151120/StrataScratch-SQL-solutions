select
id,first_name,last_name,department_id,salary
from(
        select * , ROW_NUMBER() OVER(PARTITION BY id ORDER BY salary DESC ) as rn 
        from ms_employee_salary)
where rn=1
order by id;