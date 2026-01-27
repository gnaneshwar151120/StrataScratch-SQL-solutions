select city,property_type,avg(bathrooms),avg(bedrooms)
from airbnb_search_details
group by property_type,city