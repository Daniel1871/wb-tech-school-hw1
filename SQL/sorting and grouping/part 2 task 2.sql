with t as (
	select
		seller_id,
		('2024-11-08' - min(date_reg)) / 30 as month_from_registration,
		max(delivery_days) as max_deliv,
		min(delivery_days) as min_deliv
	from sellers
	where category <> 'Bedding'
	group by seller_id
	having count(distinct category) > 1 and sum(revenue) <= 50000
)
select seller_id, month_from_registration, (max(max_deliv) over() - min(min_deliv) over()) as max_delivery_difference
from t
order by seller_id