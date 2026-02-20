WITH out AS (
    SELECT
        date,
        SUM(downloads) FILTER (WHERE paying_customer = 'no') AS non_paying,
        SUM(downloads) FILTER (WHERE paying_customer = 'yes') AS paying
    FROM ms_download_facts AS fact
    LEFT JOIN ms_user_dimension AS a
        ON fact.user_id = a.user_id
    INNER JOIN ms_acc_dimension AS acc
        ON a.acc_id = acc.acc_id
    GROUP BY date
    ORDER BY date
)

SELECT
    date,
    non_paying,
    paying
FROM out
WHERE non_paying > paying
