WITH get_customer_groups AS (
  SELECT 
    customer_id, 
    COUNT(*) AS order_num, 
    AVG(shipment_date::TIMESTAMP - order_date::TIMESTAMP) AS avg_waiting_time,
    sum(order_ammount) AS total_sum
  FROM 
    Orders
  GROUP BY 
    customer_id
)
SELECT 
    customer_id,
    name,
    order_num,
    avg_waiting_time,
    total_sum
FROM 
    get_customer_groups 
    JOIN Customers USING(customer_id)
WHERE 
    order_num = (SELECT MAX(order_num) FROM get_customer_groups)
ORDER BY 
    total_sum DESC;