SELECT 
    product_category, 
    COALESCE(SUM(order_ammount), 0) AS max_total_order_amount
FROM 
    Orders 
    RIGHT JOIN Products USING(product_id)
GROUP BY 
    product_category
ORDER BY 
    max_total_order_amount DESC
LIMIT 1;