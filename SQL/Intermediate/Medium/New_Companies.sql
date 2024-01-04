
/*
Given the table schemas below, write a query to print:
the company_code, founder name, total number of lead managers, total number of senior managers,
total number of managers, and total number of employees.
Order your output by ascending company_code.
*/

SELECT c.company_code,
        founder,
        COUNT(DISTINCT e.lead_manager_code) AS num_lead_m,
        COUNT(DISTINCT e.senior_manager_code) AS num_senior_m,
        COUNT(DISTINCT e.manager_code) AS num_m,
        COUNT(DISTINCT e.employee_code) AS num_emp
        
FROM company c
    INNER JOIN employee e
        ON c.company_code = e.company_code
    
GROUP BY c.company_code, founder
ORDER BY c.company_code ASC, founder ASC
;
