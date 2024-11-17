WITH get_groups (DATE_, CITY, date_city_sale) AS (
    SELECT 
        SALES.DATE AS DATE_,
        CITY,
        SUM(PRICE::INT * QTY) 
    FROM
        SALES 
        JOIN GOODS ON SALES.ID_GOOD = GOODS.ID_GOOD 
                      AND CATEGORY = 'ЧИСТОТА'
        JOIN SHOPS USING(SHOPNUMBER)
    GROUP BY 
        DATE_, CITY
)
SELECT 
    DATE_, 
    CITY,
    ROUND(date_city_sale / SUM(date_city_sale) OVER (PARTITION BY DATE_), 2) AS SUM_SALES_REL
FROM 
    get_groups
ORDER BY
    TO_DATE(DATE_, 'DD.MM.YYYY'), CITY;