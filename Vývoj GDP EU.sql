SELECT
country,
YEAR,
GDP 
FROM economies e 
WHERE country ='European Union'
AND e.`year`  BETWEEN 2006 AND 2018
ORDER BY `year` ASC  ;

SELECT
    country,
    `year`,
    GDP,
    ROUND((GDP / LAG(GDP) OVER (ORDER BY `year`) - 1) * 100, 2) AS avg_annual_growth_percent
FROM 
    economies e 
WHERE 
    country = 'European Union'
    AND `year` BETWEEN 2006 AND 2018
ORDER BY 
    `year` ASC;
    
   
   

  
  
  
  
  
  
  
  
  
  
  
 
  
  
  
  
  
  
   