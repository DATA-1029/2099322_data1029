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


-- 8. Pour chaque boutique, les 2 livres les plus vendus et leurs prix.ALTER


SELECT s.stor_name, t.title, t.price FROM stores AS s
JOIN
sales AS sa ON s.stor_id = sa.stor_id
JOIN
titles AS t ON sa.title_id = t.title_id
WHERE sa.stor_id IN (
	SELECT stor_id FROM sales
	GROUP BY stor_id
	ORDER BY sum(qty) desc
	limit 2
) AND t.title_id IN (
	SELECT title_id FROM sales
	GROUP BY title_id
	ORDER BY sum(qty) desc
	limit 2
);


-- 9. Les auteurs des 5 livres les plus vendus.

SELECT a.au_fname, a.au_lname FROM authors AS a
JOIN
titleauthor AS ta ON a.au_id = ta.au_id
JOIN
titles AS t ON t.title_id = ta.title_id
JOIN
sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
limit 5;


-- 10. Prix moyens des livres par maisons d’édition.

SELECT round(avg(t.price)) AS average_price, p.pub_name FROM publishers AS p
JOIN titles AS t ON t.pub_id = p.pub_id
GROUP BY p.pub_name;


-- 11. Les 3 auteurs ayant les plus de livres

SELECT a.au_fname, a.au_lname , count(*) AS amount_of_books FROM authors AS a
JOIN
titleauthor AS ta ON ta.au_id = a.au_id
GROUP BY a.au_id
ORDER BY amount_of_books DESC
limit 3;