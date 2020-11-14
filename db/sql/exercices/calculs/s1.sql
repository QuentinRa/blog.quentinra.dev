-- Nombre de crus différents.
-- Réponse: 13.

SELECT count(DISTINCT cru) FROM vin;

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