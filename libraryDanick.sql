use library;
-- Exercice 1 :
-- À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » Afficher le titre et le prix de chaque livre.
select title, price from titles where title like "%computer%" group by title_id;

-- Exercice 2 :
-- À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » (au singulier). Afficher le titre et le prix de chaque livre.
select title, price from titles where (title like "%computers%") and (title not like "%computers%") group by title_id;

-- Exercice 3 :
-- À partir de la table « titles », obtenir la liste des titres dont l’identifiant débute par SU ou BU. Afficher le titre et le prix de chaque livre.
select title, price from titles where titles.title rlike "[BS]U%" group by title_id;

-- Exercice 4 :
-- À partir de la table « titles », obtenir la liste des titres dont l’identifiant ne débute pas par SU ou BU. Afficher le titre et le prix de chaque livre.
select title, price from titles where title_id not rlike "[BS]U%" group by title_id;

-- Exercice 5 :
-- À partir de la table « titles », obtenir la liste des titres ne débutant ni par S, ni par B, mais dont la seconde lettre est « o ». Afficher le titre et le prix.
select title, price from titles where (title not rlike "[SB]%") and (title like "_o%") group by title_id;

-- Exercice 6 :
-- À partir de la table « titles », obtenir la liste des titres ne débutant ni par S, ni par B, mais dont la 3ème lettre est « f ». Afficher le titre et le prix.
select title, price from titles where (title not rlike "[SB]%") and (title like "__f%") group by title_id;

-- Exercice 7 :
-- À partir de la table « titles », obtenir la liste des titres débutant par l’une des 10 premières lettres de l’alphabet. Afficher le titre et le prix. 
select title, price from titles where (title rlike "^[A-J]") group by title_id;