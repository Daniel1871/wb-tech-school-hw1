SELECT 
    product_category, 
    COALESCE(SUM(order_ammount), 0) AS total_order_amount
FROM 
    Orders 
    RIGHT JOIN Products USING(product_id)
GROUP BY 
    product_category;