SELECT DISTINCT user_id
FROM amazon_transactions AS t
WHERE
    created_at > (
        SELECT MIN(created_at)
        FROM amazon_transactions AS t2
        WHERE t2.user_id = t.user_id
    )
    AND created_at <= (
        SELECT MIN(created_at) + INTERVAL '7 day'
        FROM amazon_transactions AS t2
        WHERE t2.user_id = t.user_id
    )
ORDER BY user_id;
