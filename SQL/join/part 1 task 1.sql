SELECT customer_id, name, (shipment_date::TIMESTAMP - order_date::TIMESTAMP) AS waiting_time
FROM Orders JOIN Customers USING(customer_id)
ORDER BY waiting_time DESC NULLS LAST
LIMIT 1;


-- В задании сказано "клиента", но если, к примеру, мы хотим как-нибудь сделать клиентам, которые долго ждут, доставку побыстрее, 
-- то какой толк от всего одного клиента, тогда хотелось бы посмотреть на всех таких клиентов:

--with T as (
--	select customer_id, name, (shipment_date::TIMESTAMP - order_date::TIMESTAMP) as waiting_time
--	from Orders join Customers USING(customer_id)
--)
--select *
--from T
--where waiting_time = (select max(waiting_time) from T);