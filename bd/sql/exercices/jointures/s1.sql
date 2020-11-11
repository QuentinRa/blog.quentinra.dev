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