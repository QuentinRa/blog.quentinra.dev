-- Liste des noms des buveurs.
SELECT nom FROM buveur;

-- Liste des différentes villes où habitent les viticulteurs. La liste doit être triée par
-- ordre alphabétique décroissant.
SELECT DISTINCT v_ville FROM viticulteur ORDER BY v_ville DESC;

-- Liste des numéros de commande et de la quantité associée pour les commandes dont la quantité
-- est comprise entre 6 et 15 (bornes comprises).
SELECT n_commande FROM commande where c_qte BETWEEN 6 AND 15;

-- Liste des commandes livrées après le 25/12/2002.
SELECT DISTINCT commande.*, l_date FROM commande
                                            NATURAL JOIN livraison
where l_date > '2002-12-25';

-- Numéros, crus et régions des vins dont la région commence par 'BO' ou se termine par 'NE'.
SELECT n_vin, cru, region FROM vin where region LIKE 'BO%' OR region LIKE '%NE';