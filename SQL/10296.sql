SELECT 
    AVG(CASE WHEN status_date = '2020-01-10' AND status = 'closed' THEN 1 ELSE 0 END)
FROM fb_account_status
WHERE status_date = '2020-01-10';
