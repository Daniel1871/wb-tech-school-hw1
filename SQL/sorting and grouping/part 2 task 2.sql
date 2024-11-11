with t as (
	select
		seller_id,
		min(to_date(date_reg, 'DD/MM/YYYY')) as min_date_reg,
		max(delivery_days) as max_deliv,
		min(delivery_days) as min_deliv
	from sellers
	where category <> 'Bedding'
	group by seller_id
	having count(distinct category) > 1 and sum(revenue) <= 50000
)
select 
	seller_id, 
	('2024-11-11' - min_date_reg) / 30 as month_from_registration, 
	(select max(max_deliv) - min(min_deliv) from t) as max_delivery_difference
from t
order by seller_id;