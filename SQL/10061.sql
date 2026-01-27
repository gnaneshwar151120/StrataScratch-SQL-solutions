select avg(fh.popularity) as avg_popularity, f.location
from facebook_employees f
join 
facebook_hack_survey fh
on f.id=fh.employee_id
group by f.location;