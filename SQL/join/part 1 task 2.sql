with get_customer_groups as (
  select 
	customer_id, 
    COUNT(*) as order_num, 
    AVG(shipment_date::TIMESTAMP - order_date::TIMESTAMP) as avg_waiting_time,
    sum(order_ammount) as total_sum
  FROM 
  	Orders
  GROUP BY 
  	customer_id
)
select 
	customer_id,
    name,
    order_num,
    avg_waiting_time,
    total_sum
FROM 
	get_customer_groups 
    JOIN Customers using(customer_id)
WHERE 
	order_num = (select max(order_num) from get_customer_groups)
ORDER BY 
	total_sum DESC;