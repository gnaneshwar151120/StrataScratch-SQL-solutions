SELECT a.user_id from amazon_transactions a
left join  amazon_transactions b
on a.user_id=b.user_id
and a.created_at <> b.created_at
where a.created_at - b.created_at between 0 and 7
group by a.user_id
order by a.user_id;
