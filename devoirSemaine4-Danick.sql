-- 1. Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre
use library;
SELECT au_fname, au_lname
FROM authors AS a
WHERE a.au_id NOT IN(
	SELECT pub_id
    FROM titles
    WHERE pub_id IN(
		SELECT pub_id
        FROM publishers
        WHERE pub_name = "Harmattan"
	)
);

-- 2. Obtenir la liste des auteurs dont l’éditeur «Eyrolles » a publié tous les livres
SELECT au_fname, au_lname
FROM authors AS a
WHERE a.au_id IN(
	SELECT pub_id
    FROM titles
	WHERE pub_id IN(
		SELECT pub_id
        FROM publishers
        WHERE pub_name = "Eyrolles"
    )
);

-- 3. Obtenir la liste des noms d’auteurs ayant touché une avance supérieure à toutes les avances versées par l'éditeur "Harmattan".
SELECT au_fname, au_lname
FROM authors
WHERE au_id IN(
    SELECT au_id
    FROM titleauthor AS ta
    JOIN titles as t ON ta.title_id = t.title_id
    WHERE advance > ALL(
        SELECT advance
        FROM titles AS t
        JOIN publishers AS p ON t.pub_id = p.pub_id
        WHERE pub_name = 'Harmattan'
    )
);