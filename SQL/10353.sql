select t.worker_title as best_paid_title
from title t
join worker w
on t.worker_ref_id=w.worker_id
where w.salary=(select max(salary) from worker a
                join title b
             on b.worker_ref_id=a.worker_id)
order by best_paid_title
;