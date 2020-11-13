SELECT * FROM vin NATURAL JOIN viticulteur;
-- Sur quels les attributs portent la jointure ?
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