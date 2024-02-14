use library;
select *
from publishers p
where p.pub_id in (select pub_id
from employees
where job_lvl in ('JUNIOR', 'INTERMEDIATE'));
-- Regroupe les employes selon les employeurs
select pub_id, count(emp_id)
from employees
where job_lvl = 'JUNIOR'
group by(pub_id);

-- liste des auteurs ayant plus de 2 publications
select au_id, count(title_id)
from titleauthor
group by au_id
having count(title_id)>2;
