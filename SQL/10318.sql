WITH prod_2020 as(
select company_name,product_name from car_launches where year=2020),
 prod_2019 as(
select company_name,product_name from car_launches where year=2019)

select a.company_name,(count(distinct a.product_name)-count(distinct b.product_name)) as net_prod
from prod_2020 a
join prod_2019 b
on a.company_name=b.company_name
group by a.company_name;
