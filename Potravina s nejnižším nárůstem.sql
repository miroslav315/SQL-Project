WITH yearly_avg AS (
    SELECT 
        category_code,
        YEAR(date_from) AS year,
        AVG(value) AS avg_value
    FROM 
        czechia_price
    GROUP BY 
        category_code,
        YEAR(date_from)
),
yearly_change AS (
    SELECT 
        category_code,
        year,
        avg_value,
        LAG(avg_value) OVER (PARTITION BY category_code ORDER BY year) AS previous_avg_value,
        (avg_value / LAG(avg_value) OVER (PARTITION BY category_code ORDER BY year)) - 1 AS rate_of_change
    FROM 
        yearly_avg
),
average_increase AS (
    SELECT 
        category_code,
        EXP(AVG(LOG(1 + rate_of_change))) - 1 AS average_annual_increase
    FROM 
        yearly_change
    WHERE 
        previous_avg_value IS NOT NULL
    GROUP BY 
        category_code
)
SELECT 
    category_code,
    average_annual_increase
FROM 
    average_increase
ORDER BY 
    average_annual_increase ASC
LIMIT 1;




