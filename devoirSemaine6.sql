-- 1. Noms complets des employés de plus haut grade par employeurs. 

SELECT e.fname, e.lname, p.pub_name FROM employees AS e
JOIN
publishers AS p ON p.pub_id = e.pub_id
WHERE e.job_lvl = 'SEINIOR' ORDER BY p.pub_id DESC;


-- 2. Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo.

SELECT fname, lname FROM employees AS e 
WHERE salary>(
	SELECT salary FROM employees 
	WHERE fname = 'Norbert' 
	AND lname = 'Zongo'
);