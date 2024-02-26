use epharmacy;
-- Exercice 2
-- 1. La liste des utilisateurs de l’application selon leur rôle.
SELECT u.full_name AS 'Nom complet', r.name AS 'Rôle'
FROM `user` u
JOIN `role` r ON u.role_id = r.id;


-- 2. Noms et quantités des produits achetés par Oumar Moussa.





-- 3. Quel sont les noms de produits dont le fournisseur est basé à Moncton ?