select extract(month from time_id) as month,client_id,count(distinct user_id) as num_user
from fact_events
group by client_id,month;
