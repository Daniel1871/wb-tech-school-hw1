WITH get_maxes (industry, max_salary) AS (
    SELECT industry, MAX(salary)
    FROM Salary
    GROUP BY industry
),
get_employees (industry, name_highest_sal) AS (
    SELECT Salary.industry, CONCAT(first_name, ' ', last_name)
    FROM Salary JOIN get_maxes ON Salary.industry = get_maxes.industry AND salary = max_salary
)
SELECT first_name, last_name, salary, industry, name_highest_sal
FROM Salary JOIN get_employees USING(industry)
ORDER BY industry, salary, id, name_highest_sal;


WITH get_mins (industry, min_salary) AS (
    SELECT industry, MIN(salary)
    FROM Salary
    GROUP BY industry
),
get_employees (industry, name_lowest_sal) AS (
    SELECT Salary.industry, CONCAT(first_name, ' ', last_name)
    FROM Salary JOIN get_mins ON Salary.industry = get_mins.industry AND salary = min_salary
)
SELECT first_name, last_name, salary, industry, name_lowest_sal
FROM Salary JOIN get_employees USING(industry)
ORDER BY industry, salary, id, name_lowest_sal;