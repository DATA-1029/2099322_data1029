use library;

-- 1. La liste des paires (auteur, éditeur) demeurant dans la même ville.
select au_fname, au_lname, pub_name from library.authors as la join library.publishers as lp where lp.city = la.city;

-- 2. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère.
select au_fname, au_lname, pub_name from library.authors as la left join library.publishers as lp on lp.city = la.city;

-- 3. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les éditeurs qui ne répondent pas à ce critère.
select au_fname, au_lname, pub_name from library.authors as la right join library.publishers as lp on lp.city = la.city;

-- 4. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les auteurs et les éditeurs qui ne répondent pas à ce critère.
select au_fname, au_lname, pub_name from library.authors as la left join library.publishers as lp on lp.city = la.city union select au_fname, au_lname, pub_name from library.authors as la right join library.publishers as lp on lp.city = la.city;

-- 5. Effectif(nombre) d'employes par niveau d'experience.
select count(*), job_lvl from employees group by job_lvl;

-- 6. Liste des employes par maison d'edition
select fname, lname, lp.pub_name from  library.publishers as lp join employees as e on lp.pub_id = e.pub_id;