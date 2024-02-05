use library;

-- 1. La liste des paires (auteur, éditeur) demeurant dans la même ville.
select au_fname, au_lname, pub_name from library.authors as la join library.publishers as lp where lp.city = la.city;