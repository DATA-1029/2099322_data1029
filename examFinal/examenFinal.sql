-- Question 2: A quoi servent les instructions des lignes 12 et 440 dans le fichier epharmacy.sql?
-- ligne 12: SET FOREIGN_KEY_CHECKS = 0  Ne pas vérifier les contraintes de clé étrangère
-- ligne 440:    SET FOREIGN_KEY_CHECKS = 1 Spécifier pour vérifier les contraintes de clé étrangère (c'est la valeur par défaut)

-- Question 3: Création de l'utilisateur pharma avec le mot de passe 1234
CREATE USER 'pharma'@'localhost' IDENTIFIED BY '1234';

-- Question 4: Les noms complets des utilisateurs de la e-pharmacie et la durée moyenne de chacun une fois connecté dans l’application
SELECT CONCAT(firstname, ' ', lastname) AS full_name, AVG(TIME_TO_SEC(onsite_time)) AS avg_duration
FROM users
JOIN connection_history ON users.id = connection_history.user_id
GROUP BY users.id;

-- Question 5: Le rôle de l’utilisateur ayant passé le plus de temps étant connecté dans l’application
SELECT roles.name AS role, CONCAT(users.firstname, ' ', users.lastname) AS full_name
FROM users
JOIN connection_history ON users.id = connection_history.user_id
JOIN roles ON users.role_id = roles.id
GROUP BY users.id
ORDER BY SUM(TIME_TO_SEC(onsite_time)) DESC
LIMIT 1;

-- Question 6: Les fournisseurs des 3 produits les plus commercialisés
SELECT suppliers.name AS supplier_name, products.name AS product_name, COUNT(*) AS sales_count
FROM products
JOIN stock_product ON products.id = stock_product.product_id
JOIN stocks ON stock_product.stock_id = stocks.id
JOIN invoice_elements ON stocks.id = invoice_elements.stocks_id
JOIN invoices ON invoice_elements.invoice_id = invoices.id
JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY suppliers.name
ORDER BY sales_count DESC
LIMIT 3;

-- Question 7: Les chiffres d'affaires par entrepôts
SELECT w.name AS warehouse_name, COALESCE(SUM(o.total_amount), 0) AS total_sales
FROM warehouses w
LEFT JOIN products p ON p.warehouse_id = w.id
LEFT JOIN cart_product cp ON cp.product_id = p.id
LEFT JOIN carts c ON c.id = cp.cart_id
LEFT JOIN orders o ON o.cart_id = c.id
GROUP BY w.id, w.name;

-- Question 8: Modifier la table products pour affecter l'image "medoc.jpg" comme image par défaut aux produits médicaux
ALTER TABLE products
MODIFY COLUMN image VARCHAR(125) DEFAULT 'medoc.jpg';

-- Question 9: Ajouter une colonne gender spécifiant le sexe des utilisateurs de l’application
ALTER TABLE users
ADD COLUMN gender ENUM('MALE', 'FEMALE', 'OTHER');

-- Question 10: Écrire une procédure stockée spProfileImage pour affecter une image de profil par défaut aux utilisateurs
DELIMITER $$
CREATE PROCEDURE spProfileImage()
BEGIN
    UPDATE users SET image = 'male.jpg' WHERE gender = 'MALE' AND image IS NULL;
    UPDATE users SET image = 'female.jpg' WHERE gender = 'FEMALE' AND image IS NULL;
    UPDATE users SET image = 'other.jpg' WHERE gender = 'OTHER' AND image IS NULL;
END$$
DELIMITER ;
CALL spProfileImage();

-- Question 11: Ajouter une contrainte à la table users pour garantir l'unicité des adresses électroniques (email) des utilisateurs
ALTER TABLE users
ADD CONSTRAINT unique_email UNIQUE (email);

-- Question 12: Insertion des données sous forme de transactions
START TRANSACTION;

INSERT INTO products(id, name, description, code_product, supplier_id, warehouse_id, image, min_quantity, price) VALUES
(6, 'Gravol', 'produit anti-douleur', 'T12344', 1, 1, NULL, 1, 5.50), 
(7, 'Ibuprofen','produit anti-douleur','', 1, 1, NULL, 1, 11), 
(8, 'Multi-Vitamine', 'produit inutile', '', 1, 1, NULL, 1, 25),
(9, 'Ducolax', 'produit de marde', '', 1, 1, NULL, 1, 10);

INSERT INTO users (firstname, lastname, country, email, password, image, role_id) VALUES
('Alain', 'Foka', 'Canada', 'Alain.Foka@email.com', '', '', 3);

SET @fati_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Fati' AND `lastname` = 'Amadou');
SET @alain_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Alain' AND `lastname` = 'Foka');

SET @admin_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Abdoulaye' AND `lastname` = 'Mohamed');


SET @advil_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Advile');
SET @ducolax_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Ducolax');
SET @paracetamol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Paracetamol2');
SET @gravol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Gravol');
SET @ibuprofen_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Ibuprofen');
SET @multi_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Multi-Vitamine');
SET @tilenol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Tilenol');
SET @koga_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Bon Koga');

INSERT INTO `orders` (`customer_id`, `order_date`, `total_amount`, `status`, `user_id`, `cart_id`)
VALUES 
(@fati_user_id, NOW(), 175.48, 0, @admin_user_id, 2), 
(@fati_user_id, NOW(), 60.95, 0, @admin_user_id, 2),
(@fati_user_id, NOW(), 38.5, 0, @admin_user_id, 2),

(@alain_user_id, NOW(), 55, 0, @admin_user_id, 3),
(@alain_user_id, NOW(), 30, 0, @admin_user_id, 3),
(@alain_user_id, NOW(), 93.6, 0, @admin_user_id, 3),
(@alain_user_id, NOW(), 38.5, 0, @admin_user_id, 3),

(@fati_user_id, NOW(), 25, 0, @admin_user_id, 2), 
(@fati_user_id, NOW(), 70.2, 0, @admin_user_id, 2),
(@fati_user_id, NOW(), 55, 0, @admin_user_id, 2);


INSERT INTO `carts` (`user_id`, `actif`)
VALUES (@fati_user_id, 1), 
(@alain_user_id, 1), 
(@fati_user_id, 1);

INSERT INTO `cart_product` (`cart_id`, `product_id`, `quantity`, `total`, `tax`, `quantity_remainder`)
VALUES 
  (2, (SELECT `id` FROM `products` WHERE `name` = 'Advile'), 4, 175.48, 10, 0),
  (2, (SELECT `id` FROM `products` WHERE `name` = 'Paracetamol2'), 5, 60.95, 10, 0),
  (2, (SELECT `id` FROM `products` WHERE `name` = 'Gravol'), 7, 38.5, 10, 0),
  (3, (SELECT `id` FROM `products` WHERE `name` = 'Ibuprofen'), 5, 55, 10, 0),
  (3, (SELECT `id` FROM `products` WHERE `name` = 'Ducolax'), 3, 30, 10, 0),
  (3, (SELECT `id` FROM `products` WHERE `name` = 'Tilenol'), 4, 93.6, 10, 0),
  (3, (SELECT `id` FROM `products` WHERE `name` = 'Gravol'), 7, 38.5, 10, 0), 
  (4, (SELECT `id` FROM `products` WHERE `name` = 'Multi-Vitamine'), 1, 25, 10, 0),
  (4, (SELECT `id` FROM `products` WHERE `name` = 'Bon Koga'), 2, 70.2, 10, 0),
  (4, (SELECT `id` FROM `products` WHERE `name` = 'Gravol'), 10, 55, 10, 0);

INSERT INTO `invoices` (`montant`, `tax`, `users_id`)
VALUES 
  ((SELECT SUM(`total`) FROM `cart_product` WHERE `cart_id` = 2), (SELECT SUM(`total`) * 0.1 FROM `cart_product` WHERE `cart_id` = 2), @fati_user_id),
  ((SELECT SUM(`total`) FROM `cart_product` WHERE `cart_id` = 3), (SELECT SUM(`total`) * 0.1 FROM `cart_product` WHERE `cart_id` = 3), @alain_user_id),
  ((SELECT SUM(`total`) FROM `cart_product` WHERE `cart_id` = 4), (SELECT SUM(`total`) * 0.1 FROM `cart_product` WHERE `cart_id` = 4), @fati_user_id);


INSERT INTO `invoice_elements` (`invoice_id` )
VALUES
(1),
(2),
(3);

COMMIT;