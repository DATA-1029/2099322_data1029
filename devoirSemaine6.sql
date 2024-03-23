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


-- 3. Noms complets des employés des éditeurs canadiens.

SELECT e.fname, e.lname, p.pub_name FROM employees AS e
JOIN
publishers AS p ON e.pub_id = p.pub_id
WHERE country = 'Canada';


-- 4. Noms complets des employés qui ont un manager

SELECT e.fname AS first_name, e.lname AS last_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.max_lvl = 'MANAGER';


-- 5. Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur.

SELECT e.fname, e.lname, p.pub_name FROM employees AS e
JOIN
publishers AS p ON p.pub_id = e.pub_id
WHERE e.salary > (
	SELECT AVG(salary) FROM employees 
	WHERE e.pub_id = p.pub_id
);


-- 6. Noms complets des employés qui ont le salaire minimum de leur grade

SELECT e.fname, e.lname, e.salary FROM employees AS e
JOIN
jobs AS j ON j.job_id = e.job_id
WHERE e.salary = (
	SELECT min(salary) FROM employees 
	WHERE job_id = e.job_id
);


-- 7. De quels types sont les livres les plus vendus?

SELECT t.`type` FROM titles AS t
WHERE title_id =(
	SELECT title_id FROM sales
	GROUP BY title_id ORDER BY sum(qty)desc limit 1
);