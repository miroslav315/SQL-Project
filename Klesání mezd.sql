
 
WITH yearly_avg AS (
    SELECT 
        industry_branch_code,
        payroll_year,
        AVG(value) AS avg_value
    FROM 
        czechia_payroll
    WHERE 
        value_type_code = 5958 
        AND industry_branch_code IS NOT NULL 
    GROUP BY 
        industry_branch_code, 
        payroll_year
),
yearly_change AS (
    SELECT 
        industry_branch_code,
        payroll_year,
        avg_value,
        LAG(avg_value) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS previous_avg_value
    FROM 
        yearly_avg
)
SELECT 
    industry_branch_code,
    payroll_year,
    avg_value
FROM 
    yearly_change
WHERE 
    ( avg_value < previous_avg_value);
   
   
   








