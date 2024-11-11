with t as (
	select 
		seller_id, 
		count(distinct category) as total_categ,
		round(avg(rating), 2) as avg_rating,
		sum(revenue) as total_revenue
	from sellers
	where category <> 'Bedding'
	group by seller_id
)
select 
	*,
	case 
		when total_revenue > 50000 then 'rich'
		else 'poor'
	end as seller_type
from t
where total_categ > 1
order by seller_id;