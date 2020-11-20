-- ###################################################################
-- # Application : SQL script
-- # File        : fill_show.sql
-- # Author      : novembre 2013 (Marie Szafranski)
-- # Function    : Fill the database "show"
-- ###################################################################

-- ###################################################################
-- # Spectacle
-- ###################################################################



CREATE SEQUENCE spectacle_n_spectacle_seq
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    START WITH 1
    OWNED BY Spectacle.n_spectacle;
ALTER TABLE Spectacle
    ALTER COLUMN n_spectacle
        SET DEFAULT nextval('spectacle_n_spectacle_seq');

-- theatre
INSERT INTO Spectacle(nom, s_type)
VALUES('Britanicus', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Andromaque', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Berenice', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Iphigenie', 'theatre');

INSERT INTO Spectacle(nom, s_type)
VALUES('Le malade imaginaire', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Le misanthrope', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Les femmes savantes', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Psyche', 'theatre');

INSERT INTO Spectacle(nom, s_type)
VALUES('Le Cid', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Attila', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Andromede', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('La mort de Pompee', 'theatre');

INSERT INTO Spectacle(nom, s_type)
VALUES('Hamlet', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Le songe d''une nuit d''ete', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Beaucoup de bruit pour rien', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Comme il vous plaira', 'theatre');
INSERT INTO Spectacle(nom, s_type)
VALUES('Romeo et Juliette', 'theatre');

INSERT INTO Spectacle(nom, s_type)
VALUES('L''importance d''etre Constant', 'theatre');

-- danse
INSERT INTO Spectacle(nom, s_type)
VALUES('Don Quichotte', 'danse');
INSERT INTO Spectacle(nom, s_type)
VALUES('Le lac des cygnes', 'danse');
INSERT INTO Spectacle(nom, s_type)
VALUES('Romeo et Juliette', 'danse');
INSERT INTO Spectacle(nom, s_type)
VALUES('Casse-noisette', 'danse');
INSERT INTO Spectacle(nom, s_type)
VALUES('Carmen', 'danse');
INSERT INTO Spectacle(nom, s_type)
VALUES('Le sacre du printemps', 'danse');
INSERT INTO Spectacle(nom, s_type)
VALUES('Petrouchka', 'danse');

-- ###################################################################
-- # Salle
-- ###################################################################
INSERT INTO Salle(n_salle, nb_places)
VALUES(1, 100);
INSERT INTO Salle
VALUES(2, 400);
INSERT INTO Salle
VALUES(3, 350);
INSERT INTO Salle
VALUES(4, 250);
INSERT INTO Salle
VALUES(5, 500);

-- ###################################################################
-- # Representation
-- ###################################################################

-- janvier
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(1, 4, '2013-01-05', 70);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(1, 4, '2013-01-15', 70);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(1, 4, '2013-01-25', 70);

INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(17, 2, '2013-01-05', 100);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(17, 2, '2013-01-15', 100);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(17, 2, '2013-01-25', 100);

INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(25, 5, '2013-01-05', 220);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(25, 5, '2013-01-15', 220);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(25, 5, '2013-01-25', 220);

-- février
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(2, 4, '2013-02-05', 85);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(2, 4, '2013-02-15', 85);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(2, 4, '2013-02-25', 85);

INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(18, 2, '2013-02-05', 150);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(18, 2, '2013-02-15', 150);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(18, 2, '2013-02-25', 150);

INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(13, 5, '2013-02-05', 110);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(13, 5, '2013-02-15', 110);
INSERT INTO Representation(n_spectacle, n_salle, r_date, prix)
VALUES(13, 5, '2013-02-25', 110);

-- mars
-- ...

-- ###################################################################
-- # Billet
-- ###################################################################

-- remplacer /pub/IBD/tp_ldd_lcd/ par le chemin correspondant si
-- necessaire
\copy Billet(n_spectacle, n_salle, b_date, nom_client)
FROM '/pub/IBD/tp_sql_ldd_lcd/billet.csv' WITH DELIMITER AS ','
