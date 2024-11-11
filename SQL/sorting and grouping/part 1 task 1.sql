select 
	city,
	age,
	count(id) as count_customers
from users
group by city, age
order by city, count_customers desc;


select 
	city,
	case
		when age <= 20 then 'young'
		when age <= 49 then 'adult'
		else 'old'
	end as age_category,
	count(id) as count_customers
from users
group by city, age_category
order by city, count_customers desc;