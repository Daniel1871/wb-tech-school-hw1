select seller_id, string_agg(distinct category, ' - ' order by category) as category_pair
from sellers
where to_date(date_reg, 'DD/MM/YYYY') >= DATE '2022-01-01' 
	  and to_date(date_reg, 'DD/MM/YYYY') < DATE '2023-01-01'
group by seller_id
having count(distinct category) = 2 and sum(revenue) > 75000;