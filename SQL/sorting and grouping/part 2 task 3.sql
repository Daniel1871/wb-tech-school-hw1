select seller_id, string_agg(distinct category, ' - ' order by category) as category_pair
from sellers
where extract(year from date_reg) = 2022
group by seller_id
having count(distinct category) = 2 and sum(revenue) > 75000;