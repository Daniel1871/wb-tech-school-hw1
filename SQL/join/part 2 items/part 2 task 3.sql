WITH get_groups AS (
    SELECT 
        product_category, product_name, SUM(order_ammount) AS ctg_prd_order_amount
    FROM 
        Orders 
        RIGHT JOIN Products USING(product_id)
    GROUP BY 
        product_category, product_id, product_name
)
SELECT 
    get_maxes.product_category, product_name, ctg_prd_order_amount
FROM 
    get_groups RIGHT JOIN (
        SELECT product_category, MAX(ctg_prd_order_amount) AS ctg_max_order_amount
        FROM get_groups
        GROUP BY product_category
    ) get_maxes ON get_groups.product_category = get_maxes.product_category 
                   AND get_groups.ctg_prd_order_amount = get_maxes.ctg_max_order_amount
