WITH daily_events AS (
    SELECT
        user_id,
        timestamp::DATE AS day,
        -- latest page_load on that day
        MAX(CASE WHEN action = 'page_load' THEN timestamp END) AS last_load,
        -- earliest page_exit on that day
        MIN(CASE WHEN action = 'page_exit' THEN timestamp END) AS first_exit
    FROM facebook_web_log
    WHERE action IN ('page_load', 'page_exit')
    GROUP BY user_id, timestamp::DATE
),

valid_sessions AS (
    -- keep only days where load happened before exit
    SELECT
        user_id,
        day,
        last_load,
        first_exit,
        first_exit - last_load AS session_duration
    FROM daily_events
    WHERE
        last_load IS NOT NULL
        AND first_exit IS NOT NULL
        AND last_load < first_exit
)

SELECT
    user_id,
    -- average in seconds, then cast back to interval
    (AVG(EXTRACT(EPOCH FROM session_duration)) || ' seconds')::INTERVAL AS avg_session_time
FROM valid_sessions
GROUP BY user_id
ORDER BY user_id;
