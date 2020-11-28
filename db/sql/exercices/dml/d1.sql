-- 1. Donnez les expressions SQL permettant d’ajouter les personnes suivantes :

-- Personne(’A01’, ’Boss of the’, ’Base’)
INSERT INTO personne(id_personne, nom, prenom) VALUES ('A01', 'Boss of the', 'Base');
-- Personne(’S01’, ’Boss of the’, ’Show’)
INSERT INTO personne(id_personne, nom, prenom) VALUES ('S01','Boss of the','Show');
-- Personne(’G01’, ’Boss of the’, ’Guichetier’) -- à référencer comme Guichetier
INSERT INTO personne(id_personne, nom, prenom) VALUES ('G01','Boss of the','Guichetier');
INSERT INTO guichetier(id_guichetier) values ('G01');
-- Personne(’G02’, ’Another one’, ’Guichetier’) -- à référencer comme Guichetier
INSERT INTO personne(id_personne, nom, prenom) VALUES ('G02','Another of one','Guichetier');
INSERT INTO guichetier(id_guichetier) values ('G02');

-- 2. Donnez les expressions SQL permettant de répondre aux questions suivantes :
-- (a) Quels sont les noms et prénoms des guichetiers.

SELECT nom, prenom from personne JOIN guichetier g on personne.id_personne = g.id_guichetier;

-- devient

SELECT nom, prenom from v_guichetier;

-- (b) Pour chaque type de spectacle, combien de spectacles ont eté proposés en 2013 ?

SELECT s_type, count(*)
FROM representation join spectacle s on representation.n_spectacle = s.n_spectacle
where extract(YEAR from r_date) = '2013'
GROUP BY s_type;

-- devient

SELECT s_type, count(*)
FROM guichet
where extract(YEAR from b_date) = '2013'
group by s_type;

-- (c) Quel est le prix moyen d’une place de type 'theatre' pour l’année 2013 ?

SELECT avg(prix)
FROM spectacle JOIN representation r on spectacle.n_spectacle = r.n_spectacle
where extract(YEAR from r_date) = '2013' AND s_type='theatre';

-- devient

SELECT avg(prix)
FROM guichet
where extract(YEAR from b_date) = '2013' AND s_type='theatre';

-- (d) Quel est le chiffre d’affaire des spectacles de type 'theatre' pour l’année 2013 ?
-- CA = qté * prix de vente

-- trop chiant de faire la version sans vue donc je met direct la réponse

-- devient

-- on va calculer une requête qui retourne pour chaque salle
-- qté * nombre de places vendues
-- puis on fait la somme du résultat de cette requête
SELECT SUM(Montant.result)
FROM
    -- ici on créé une table depuis une requête avec un attribut result pour résultat
    (Select prix * (nb_places - nb_places_libres) as "result"
     FROM Guichet NATURAL JOIN Salle
     where s_type='theatre' AND extract(YEAR from b_date) = '2013')
        as Montant;

-- (e) Quelle requête permettrait d’obtenir l’attribut dérivé n_spectacle de la relation Billet ?
--     Sans définir explicitement un déclencheur, on se placera dans le cadre où l’on a accès aux attributs
--     NEW.n_billet, NEW.n_salle, NEW.b_date, NEW.nom_client d’un billet qu’on est en train d’insérer

-- en gros je reformule :
-- un attribut dérivé est obtenu à partir des valeurs de d'autres attributs.
-- sachant que NEW.n_billet, NEW.n_salle, NEW.b_date, NEW.nom_client contienne les valeurs à insérer,
-- comment calculer NEW.n_spectacle

SELECT n_spectacle
FROM representation
where r_date=NEW.b_date AND n_salle=NEW.salle;