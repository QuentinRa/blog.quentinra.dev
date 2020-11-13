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

-- 5. Quantité de vin moyenne vendue pour chaque viticulteur de la région 'BOURGOGNE'.
-- Affichez le numéro et le nom de chaque viticulteur
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