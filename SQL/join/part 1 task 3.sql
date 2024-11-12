with get_criteria as (
  select 
      customer_id, 
      ((shipment_date::TIMESTAMP - order_date::TIMESTAMP) > INTERVAL '5 days') as is_delay,
      (order_status = 'Cancel') as is_cancel,
      (
          CASE order_status
              WHEN 'Cancel' THEN order_ammount
              ELSE NULL
          END
      ) as cancel_amount
  from Orders
)
select 
    name,
    SUM(is_delay::INTEGER) delay_num,
    SUM(is_cancel::INTEGER) cancel_num,
    sum(cancel_amount) as total_sum
from get_criteria join Customers USING(customer_id)
where is_delay OR is_cancel
group by customer_id, name
order by total_sum DESC nulls last;