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

-- -----------------------------------
-- Exercice JOINTURES
-- -----------------------------------

-- 1. Numéros et noms des différents viticulteurs qui proposent des vins de 'LOIRE' de millesime 1993.
-- Réponse: 1 tuple.

-- sql 92
SELECT DISTINCT nom, v.n_viticulteur FROM viticulteur v NATURAL JOIN
VIN WHERE region='LOIRE' AND millesime=1993;

-- sql 89
SELECT DISTINCT nom, v.n_viticulteur FROM viticulteur v, vin
WHERE region='LOIRE' AND millesime=1993 AND vin.n_viticulteur=v.n_viticulteur;

-- 2. Numéros et noms des buveurs ayant commandé un vin de cru 'POMMARD'.
-- Réponse: 4 tuples.

-- sql 92
SELECT DISTINCT nom, b.n_buveur
FROM buveur b NATURAL JOIN commande c JOIN vin v on c.n_vin = v.n_vin
where cru='POMMARD';

-- sql 89
SELECT DISTINCT nom, b.n_buveur
FROM buveur b, commande c, vin v
where cru='POMMARD' AND c.n_vin = v.n_vin and b.n_buveur=c.n_buveur;

-- 3. Noms des viticulteurs à qui le buveur 'DUPOND' a commandé du vin.
-- Réponse: 2 tuples.

-- sql 92
SELECT  v.nom
FROM viticulteur v NATURAL JOIN vin
NATURAL JOIN commande c JOIN buveur b ON c.n_buveur=b.n_buveur
WHERE b.nom='DUPOND';

-- sql 89
SELECT  v.nom
FROM viticulteur v, vin, commande c, buveur b
WHERE b.nom='DUPOND' AND
c.n_buveur=b.n_buveur AND vin.n_vin=c.n_vin AND v.n_viticulteur=vin.n_viticulteur;

-- 4. Numéros et noms des viticulteurs qui habitent la même ville qu'un de leurs clients.
-- Réponse: 1 tuple.

-- sql 92
SELECT DISTINCT n_viticulteur, v.nom
FROM viticulteur v JOIN buveur b ON v.v_ville=b.b_ville;

-- sql 89
SELECT DISTINCT n_viticulteur, v.nom
FROM viticulteur v, buveur b
where v.v_ville = b.b_ville;

-- 5. Numéros et noms des buveurs qui n'ont rien commandé. Vous exprimerez cette requête de 3 façons :
--      a) en testant l'appartenance (ou pas) à un ensemble, (NOT) IN ou EXCEPT
--      b) en testant les propriétés que certains attributs doivent vérifier, (NOT) EXISTS ou ALL (ANY)
--      c) en testant le résultat d'une jointure externe. [LEFT/RIGHT] OUTER JOIN|
-- Réponse: 7 tuples.

-- a
SELECT DISTINCT n_buveur, nom
FROM buveur
where n_buveur NOT IN (select n_buveur from commande);

(SELECT DISTINCT n_buveur, nom
FROM buveur)
EXCEPT
(SELECT DISTINCT n_buveur, NULL
FROM commande);

-- b
SELECT DISTINCT n_buveur, nom
FROM buveur b
where NOT EXISTS (select DISTINCT n_buveur from commande c where
c.n_buveur=b.n_buveur);

-- c
SELECT DISTINCT b.n_buveur, nom
FROM buveur b LEFT OUTER JOIN commande c on b.n_buveur = c.n_buveur
where c.n_buveur IS NULL;

-- 6. Liste des crus qui ont été commandés mais pas en quantité supérieure ou égale à 12, en utilisant les mêmes approches que précédemment.
-- Réponse: 3 tuples.

-- a
SELECT DISTINCT cru
FROM vin NATURAL JOIN commande
WHERE vin.n_vin NOT IN (select n_vin from commande where c_qte >= 12);

-- b
SELECT DISTINCT cru
FROM vin v NATURAL JOIN commande c1
WHERE NOT EXISTS(SELECT * from commande c2 where c1.n_vin=c2.n_vin AND c2.c_qte >= 12);

-- c
SELECT DISTINCT cru
FROM vin v NATURAL JOIN commande c1
LEFT OUTER JOIN commande c2 on (v.n_vin = c2.n_vin AND c2.c_qte >= 12)
Where c2.n_commande IS NULL;

-- 7. Numéros et noms des buveurs qui n'ont commandé que des vins de la région de 'BOURGOGNE', en utilisant les approches a) et b) présentées précédemment.
-- Réponse: 3 tuples.

-- a
SELECT DISTINCT n_buveur, nom
FROM buveur NATURAL JOIN commande c
WHERE c.n_vin NOT IN (select n_vin from commande NATURAL JOIN vin where region='BOURGOGNE');

-- b
SELECT DISTINCT n_buveur, nom
FROM buveur NATURAL JOIN commande c1
WHERE NOT EXISTS(select n_vin from commande c2 NATURAL JOIN vin where c1.n_vin=c2.n_vin AND region='BOURGOGNE');

-- 8. Numéros et noms des buveurs qui n'ont commandé que des vins des régions de 'BOURGOGNE' et de 'BORDEAUX',
--    en utilisant les approches a) et b) présentées précédemment.
-- Réponse: 1 tuple.

-- a
SELECT n_buveur, nom
FROM buveur b
WHERE n_buveur NOT IN (select distinct n_buveur
                 FROM commande NATURAL JOIN vin
                 where (region<>'BOURGOGNE'AND region<>'BORDEAUX'))
  AND n_buveur IN (
        select distinct n_buveur
        FROM commande NATURAL JOIN vin
        where region='BOURGOGNE'
    )
  AND n_buveur IN(
        select distinct n_buveur
        FROM commande NATURAL JOIN vin
        where region='BORDEAUX'
    );

-- b
SELECT n_buveur, nom
FROM buveur b
WHERE NOT EXISTS(select distinct commande.*, region
                 FROM commande NATURAL JOIN vin
                 where (region<>'BOURGOGNE'AND region<>'BORDEAUX') AND commande.n_buveur=b.n_buveur)
AND EXISTS(
        select distinct commande.*, region
        FROM commande NATURAL JOIN vin
        where region='BOURGOGNE' AND commande.n_buveur=b.n_buveur
)
AND EXISTS(
        select distinct commande.*, region
        FROM commande NATURAL JOIN vin
        where region='BORDEAUX' AND commande.n_buveur=b.n_buveur
);

-- 9. Liste des villes dans lesquelles se trouvent soit un viticulteur soit un buveur.
-- Réponse: 17 tuples.

SELECT DISTINCT b_ville
from buveur
UNION
SELECT DISTINCT v_ville
from viticulteur;

-- ---------------------------------------------
-- Exercice Fonctions de calcul et agrégats
-- ---------------------------------------------

-- Nombre de crus différents.
-- Réponse: 13.

SELECT DISTINCT cru FROM vin;
SELECT cru FROM vin GROUP BY cru; -- fusionne les doublons

-- Quantité totale des vins livrés en 2001. Utilisez l'opérateur BETWEEN dans une première requête et la fonction EXTRACT() dans une seconde requête.
-- Réponse: 24.

SELECT sum(l_qte)
FROM livraison
where l_date BETWEEN '2001-01-01' AND '2001-12-31';

SELECT sum(l_qte)
FROM livraison
where extract(YEAR from l_date)='2001';

-- Nombre de vins différents de chaque région. Affichez le nombre de vins dans une colonne nommée "nombre de vins".
-- Réponse: LOIRE : 6, CHAMPAGNE : 2, BORDEAUX : 5, BOURGOGNE: 4.

Select region, count(*) as 'nombre de vins'
FROM vin
GROUP BY region;

-- Nombre de vins différents produits par chaque viticulteur. Affichez le numéro et le
-- nom de chaque viticulteur puis nombre de vins produits dans une colonne nommée "nombre de vins" et ordonnez le résultat en fonction
-- du nombre de vins produits.
-- Réponse: 8 viticulteurs produisent 1 vin, 3 viticulteurs produisent 2 vins et 1 viticulteur produit 3 vins.

SELECT n_viticulteur, nom, count(*) as 'nombre de vins'
FROM vin NATURAL JOIN viticulteur
GROUP BY n_viticulteur, nom
ORDER BY 3;

-- Quantité de vin moyenne commandée pour chaque buveur habitant 'PARIS'. Affichez le numéro et le nom de chaque buveur
-- puis la quantité de vin moyenne commandée dans une colonne "quantité moyenne commandée".
-- Réponse: MAURY: 12, DUPONT: 6, GAUTHIER: 12.

Select n_buveur, nom, avg(c_qte) as "quantité moyenne commandée"
FROM buveur NATURAL JOIN commande
WHERE b_ville='PARIS'
GROUP BY n_buveur, nom;

-- Quantité de vin totale commandée pour chaque buveur dont la quantité de vin moyenne commandée est supérieure ou égale à 12.
-- Affichez le numéro et le nom de chaque buveur puis la quantité de vin totale commandée dans une colonne "quantité totale commandée".
-- Réponse: GAUTHIER: 12, MAURY: 24, FRADET: 30.

-- noinspection NonAsciiCharacters
Select n_buveur, nom, sum(c_qte) as "quantité totale commandée"
FROM buveur NATURAL JOIN commande
GROUP BY n_buveur, nom
HAVING avg(c_qte) >= 12;

-- Numéros et noms des viticulteurs qui produisent au moins deux vins de crus différents.
-- Affichez le numéro et le nom de chaque viticulteur puis le nombre total de vins produits dans une colonne "nombre de vins produits".
-- Réponse: VALLE: 3, COULIS DUTHEIL: 2, PARENT: 2, MEDEVILLE: 2.

SELECT n_viticulteur, nom, count(*) as "nombre de vins produits"
FROM viticulteur NATURAL JOIN vin
GROUP BY n_viticulteur, nom
HAVING count(*) >= 2;

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