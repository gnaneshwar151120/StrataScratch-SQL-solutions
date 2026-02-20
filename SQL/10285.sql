WITH lst AS (
    SELECT
        date,
        user_id_sender,
        user_id_receiver
    FROM fb_friend_requests
    WHERE action = 'sent'
),

accept AS (
    SELECT
        date,
        user_id_sender,
        user_id_receiver
    FROM fb_friend_requests
    WHERE action = 'accepted'
)

SELECT
    a.date,
    COUNT(b.user_id_receiver) / CAST(COUNT(a.user_id_sender) AS DECIMAL) AS percentage
FROM lst AS a
LEFT JOIN accept AS b
    ON a.user_id_sender = b.user_id_sender AND a.user_id_receiver = b.user_id_receiver
GROUP BY a.date;
