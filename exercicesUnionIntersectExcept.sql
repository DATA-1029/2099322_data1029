use library;
-- 1 : UNION
-- Afficher les nom et id des éditeurs ayant publié des livres de type « business » ou des livres de type «psychology ».

select distinct pub_name, pub_id from publishers
join publishers on titles.type = publishers
where titles.type rlike "[business]" or "[psychology]"

-- 2 : INTERSECT
-- Afficher les nom et id des éditeurs ayant publié des livres de type « business » et des livres de type «psychology ».


-- 3 : EXCEPT
-- Afficher les nom et id des éditeurs ayant publié des livres de type « business » mais pas de livre de type «psychology ».