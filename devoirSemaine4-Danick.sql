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
        WHERE pub_name = "Eyerolles"
    )
);