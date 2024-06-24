SELECT 
    cp.*, 
    cp2.*, 
    cp2.value / cp.value AS celkem_mleka_posledni_obdobi
FROM 
    czechia_price cp 
JOIN 
    czechia_payroll cp2 
ON 
    cp2.payroll_year = YEAR(cp.date_from)
WHERE 
    cp.category_code = 114201 
    AND cp2.value IS NOT NULL 
    AND cp2.value_type_code = 5958 
ORDER BY 
    cp.date_from  DESC;

SELECT 
    cp.*, 
    cp2.*, 
    cp2.value / cp.value AS celkem_chleba_posledni_obdobi,
FROM 
    czechia_price cp 
JOIN 
    czechia_payroll cp2 
ON 
    cp2.payroll_year = YEAR(cp.date_from)
WHERE 
    cp.category_code = 111301 
    AND cp2.value IS NOT NULL 
    AND cp2.value_type_code = 5958 
ORDER BY 
    cp.date_from  DESC;

   SELECT 
    cp.*, 
    cp2.*, 
    cp2.value / cp.value AS celkem_chleba_prvni_obdobi
FROM 
    czechia_price cp 
JOIN 
    czechia_payroll cp2 
ON 
    cp2.payroll_year = YEAR(cp.date_from)
WHERE 
    cp.category_code = 111301 
    AND cp2.value IS NOT NULL 
    AND cp2.value_type_code = 5958 
ORDER BY 
    cp.date_from  ASC ;

SELECT 
    cp.*, 
    cp2.*, 
    cp2.value / cp.value AS celkem_mleka_prvni_obdobi
FROM 
    czechia_price cp 
JOIN 
    czechia_payroll cp2 
ON 
    cp2.payroll_year = YEAR(cp.date_from)
WHERE 
    cp.category_code = 114201 
    AND cp2.value IS NOT NULL 
    AND cp2.value_type_code = 5958 
ORDER BY 
    cp.date_from  ASC ;
