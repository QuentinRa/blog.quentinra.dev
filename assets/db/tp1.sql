-- -----------------------------------
-- Introduction
-- -----------------------------------

-- Liste des noms des buveurs.
SELECT nom FROM buveur;

-- Liste des différentes villes où habitent les viticulteurs. La lsite doit être triée par ordre alphabétique décroissant.
SELECT DISTINCT v_ville FROM viticulteur ORDER BY v_ville DESC;

-- Liste des numéros de commande et de la quantité associée pour les commandes dont la quantité est comprise entre 6 et 15 (bornes comprises).
SELECT n_commande FROM commande where c_qte BETWEEN 6 AND 15;

-- Liste des commandes livrées après le 25/12/2002.
SELECT DISTINCT commande.*, l_date FROM commande
NATURAL JOIN livraison
where l_date > '2002-12-25';

-- Numéros, crus et régions des vins dont la région commence par 'BO' ou se termine par 'NE'.
SELECT n_vin, cru, region FROM vin where region LIKE 'BO%' OR region LIKE '%NE';

-- -----------------------------------
-- Pré-Exercices
-- -----------------------------------

SELECT * FROM vin NATURAL JOIN viticulteur;
-- Sur quels les attributs portent la jointure ? Quel est le schéma du résultat de la requête ?
-- réponse : colonnes ayant le même nom donc
--          n_viticulteur

SELECT *
FROM vin, viticulteur vit
WHERE vin.n_viticulteur = vit.n_viticulteur;
-- Pourquoi les attributs n_viticulteur sont ils préfixés ? Quel est le schéma du résultat de la requête ? À partir de quelle opération est-il obtenu ?
-- réponse : On doit préfixer car il existe un attribut
--            ayant cette valeur dans deux tables donc on doit savoir on prends lequel
--            Le schéma est la jointure (opération) sur n_viticulteur.

SELECT * FROM buveur NATURAL JOIN viticulteur;
-- Pourquoi le résultat est-il vide ?
-- réponse : la jointure naturelle affiche les colonnes
--          qui ont une valeur commune, ici on affiche les lignes qui
--          ont le même nom, prénom, ville entre
--          buveur et viticulteur : aucune ligne


SELECT * FROM buveur JOIN viticulteur USING (nom, prenom);
-- Expliquez le résultat
-- réponse : on fait une jointure sur nom et prénom
--           donc on affiche les buveur qui ont le même NOM
--           et prénom.

-- équivalent mariasql, ne marche pas ailleurs
alter table buveur change ville b_ville varchar(30) null;
alter table viticulteur change ville v_ville varchar(30) null;

-- ---------------------------------------------
-- Questions supplémentaires.
-- ---------------------------------------------

-- 1. Nombre de villes différentes chez les personnes enregistrées dans la table buveur.

SELECT count(DISTINCT b_ville)
FROM buveur;

-- 2. Quantité totale des vins commandés en 2002.

SELECT sum(c_qte)
FROM commande
where extract(YEAR from c_date)='2002';

-- 3. Nombre de viticulteurs différents de chaque région. Affichez le nombre de viticulteurs dans une colonne nommée "nombre de viticulteurs".

SELECT region, count(*) as "nombre de viticulteurs"
FROM viticulteur NATURAL JOIN vin
GROUP BY region;

-- 4. Nombre de vins différents commandés par chaque buveur. Affichez le numéro et le nom de chaque buveur puis le nombre de vins
-- commandés dans une colonne nommée "nombre de vins commandés". Faites la requête en intégrant dans un premier temps les buveurs
-- qui n'ont rien commandé, puis en les éliminant dans un second temps.

SELECT b.n_buveur, nom, count(DISTINCT n_vin) as "nombre de vins commandés"
FROM buveur b LEFT OUTER JOIN commande c on b.n_buveur = c.n_buveur
GROUP BY b.n_buveur, nom;

-- puis in retire ceux avec 0 commandes

SELECT b.n_buveur, nom, count(DISTINCT n_vin) as "nombre de vins commandés"
FROM buveur b LEFT OUTER JOIN commande c on b.n_buveur = c.n_buveur
GROUP BY b.n_buveur, nom
HAVING `nombre de vins commandés` > 0;

-- 5. Quantité de vin moyenne vendue pour chaque viticulteur de la région 'BOURGOGNE'. Affichez le numéro et le nom de chaque viticulteur
-- puis la quantité de vin moyenne vendue dans une colonne "quantité moyenne vendue".

SELECT n_viticulteur, nom, avg(c_qte) as "quantité moyenne vendue"
FROM viticulteur NATURAL JOIN vin NATURAL JOIN commande
WHERE region='BOURGOGNE'
GROUP BY n_viticulteur, nom;

-- 6. Quantité de vin totale vendue pour chaque viticulteur dont la quantité de vin moyenne vendue est supérieure ou égale à 12.
-- Affichez le numéro et le nom de chaque viticulteur puis la quantité de vin totale vendue dans une colonne "quantité totale vendue".

SELECT n_viticulteur, nom, sum(c_qte) as "quantité totale vendue"
FROM viticulteur NATURAL JOIN vin NATURAL JOIN commande
GROUP BY n_viticulteur, nom
HAVING avg(c_qte) >= 12;

-- 7. Numéros et noms des buveurs qui ont commandé au moins deux vins de crus différents. Affichez le numéro et le nom de chaque buveur
-- puis le nombre total de vins commandés dans une colonne "nombre de vins commandés".

SELECT n_buveur, nom, count(*) as "nombre de vins commandés"
FROM buveur NATURAL JOIN commande
GROUP BY n_buveur, nom
HAVING count(DISTINCT n_vin) >= 2;

-- 8. Numéros et noms des buveurs qui ont commandé au moins deux vins de crus différents de la même région.
-- Affichez le numéro et le nom de chaque buveur puis la région et le nombre total de vins commandés par région dans une colonne
-- "nombre de vins commandés".

SELECT n_buveur, nom, count(*) as "nombre de vins commandés"
FROM buveur b NATURAL JOIN commande c NATURAL JOIN vin v
GROUP BY n_buveur, nom
HAVING count(DISTINCT n_vin) >= 2 AND count(DISTINCT region) = 1;

-- commande pour vérification
SELECT n_buveur, nom, n_vin, region
FROM buveur b NATURAL JOIN commande c NATURAL JOIN vin v
ORDER BY n_buveur;