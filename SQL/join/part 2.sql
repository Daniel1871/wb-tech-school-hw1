WITH task1 (category, total_sum) AS (
    SELECT 
        product_category, 
        COALESCE(SUM(order_ammount), 0)
    FROM 
        Orders 
        RIGHT JOIN Products USING(product_id)
    GROUP BY 
        product_category
), 
task2 (category_max, max_total_sum) AS (
    SELECT *
    FROM task1
    ORDER BY total_sum DESC
    LIMIT 1
),
get_groups AS (
    SELECT 
        product_category, product_name, SUM(order_ammount) AS ctg_prd_order_amount
    FROM 
        Orders 
        RIGHT JOIN Products USING(product_id)
    GROUP BY 
        product_category, product_id, product_name
),
task3 (category, product_name_max_sum, max_product_sum) AS (
    SELECT 
        get_maxes.product_category, product_name, ctg_prd_order_amount
    FROM 
        get_groups RIGHT JOIN (
            SELECT product_category, MAX(ctg_prd_order_amount) AS ctg_max_order_amount
            FROM get_groups
            GROUP BY product_category
        ) get_maxes ON get_groups.product_category = get_maxes.product_category 
                       AND get_groups.ctg_prd_order_amount = get_maxes.ctg_max_order_amount
)
SELECT *
FROM
    task1 
    CROSS JOIN task2 
    JOIN task3 USING(category)