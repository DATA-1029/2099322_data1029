use library;
-- 1 : UNION
-- Afficher les nom et id des éditeurs ayant publié des livres de type « business » ou des livres de type «psychology ».

select distinct pub_name, titles.pub_id from publishers
join titles on publishers.pub_id = titles.pub_id
where titles.type rlike "[business]" or "[psychology]"

-- 2 : INTERSECT
-- Afficher les nom et id des éditeurs ayant publié des livres de type « business » et des livres de type «psychology ».


-- 3 : EXCEPT
-- Afficher les nom et id des éditeurs ayant publié des livres de type « business » mais pas de livre de type «psychology ».