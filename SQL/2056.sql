SELECT to_char(shipment_date, 'YYYY-MM') AS year_month,
       count(distinct (shipment_id, sub_id))
FROM amazon_shipment
GROUP BY year_month