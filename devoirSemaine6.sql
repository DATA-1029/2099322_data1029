-- 1. Noms complets des employés de plus haut grade par employeurs. 

SELECT e.fname, e.lname, p.pub_name FROM employees AS e
JOIN
publishers AS p ON p.pub_id = e.pub_id
WHERE e.job_lvl = 'SEINIOR' ORDER BY p.pub_id DESC;