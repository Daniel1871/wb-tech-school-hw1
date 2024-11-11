select round(avg(price), 2) as avg_price, category
from products
where name ilike '%hair%' or name ilike '%home%'
group by category;