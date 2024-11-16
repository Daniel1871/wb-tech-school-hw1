SELECT 
    first_name, 
    last_name, 
    salary, 
    industry,
    FIRST_VALUE(CONCAT(first_name, ' ', last_name)) OVER w as name_lowest_sal,
    LAST_VALUE(CONCAT(first_name, ' ', last_name)) OVER w as name_highest_sal
FROM Salary
WINDOW w AS (
    PARTITION BY industry
    ORDER BY salary, id
   	ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)
ORDER BY industry, salary, id;