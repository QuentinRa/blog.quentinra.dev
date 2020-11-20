-- ###################################################################
-- # Application : SQL script
-- # File        : create_show.sql
-- # Author      : novembre 2018 (Marie Szafranski)
-- # Revision    : novembre 2020 (Quentin Ra)
-- # Function    : Create the database "show"
-- ###################################################################

DROP TABLE IF EXISTS Billet;
DROP TABLE IF EXISTS Representation;
DROP TABLE IF EXISTS Salle;
DROP TABLE IF EXISTS Spectacle;
DROP TABLE IF EXISTS Guichetier;
DROP TABLE IF EXISTS Personne;
DROP VIEW IF EXISTS Guichet;
DROP VIEW IF EXISTS V_Guichetier;

-- création de personne
CREATE TABLE Personne(
                         id_personne VARCHAR(10),
                         nom VARCHAR(50),
                         prenom VARCHAR(50),
-- contrainte "pk_personne" qui fait de "id_personne" une clef primaire
                         CONSTRAINT pk_personne PRIMARY KEY (id_personne));

-- création de guichetier
CREATE TABLE Guichetier(
                           id_guichetier VARCHAR(10),
-- clef
                           CONSTRAINT pk_guichetier PRIMARY KEY (id_guichetier),
-- clef étrangère
-- ON DELETE CASCADE = si la personne n'existe plus, alors le guichetier non plus
-- par défaut, bloque la suppression
                           CONSTRAINT fk_personne_guichetier
                               FOREIGN KEY (id_guichetier) REFERENCES Personne(id_personne) ON DELETE CASCADE);

-- création de spectacle
CREATE TABLE Spectacle(
                          n_spectacle INTEGER,
                          nom VARCHAR(100),
                          duree INTEGER, -- on considère c'est des minutes
                          s_type VARCHAR(10),
-- clef
                          CONSTRAINT pk_spectacle PRIMARY KEY (n_spectacle),
-- contrainte durée, on aurait pu mettre between
                          CONSTRAINT dom_duree_spectacle CHECK (duree >= 60 AND duree <= 240),
-- contrainte valeur
                          CONSTRAINT dom_type_spectacle CHECK (s_type IN ('theatre', 'danse', 'concert'))
);

-- création de la table salle
CREATE TABLE Salle(
                      n_salle INTEGER,
                      nb_places INTEGER,
-- clef
                      CONSTRAINT pk_salle PRIMARY KEY (n_salle),
-- contrainte places, on aurait pu mettre between
                      CONSTRAINT dom_places_salle CHECK (nb_places >= 100 AND nb_places <= 500)
);

-- création de la table représentation
CREATE TABLE Representation(
                               r_date DATE,
                               n_salle INTEGER,
                               prix INTEGER,
                               n_spectacle INTEGER,
-- clef avec deux attributs
                               CONSTRAINT pk_representation PRIMARY KEY (n_salle, r_date),
-- supprimer un spectacle supprime la représentation
                               CONSTRAINT fk_representation_spectacle
                                   FOREIGN KEY (n_spectacle) REFERENCES Spectacle (n_spectacle) ON DELETE CASCADE,
-- le numéro de la salle doit pointer sur une salle. On peut pas supprimer
-- la salle sans supprimer d'abord les représentations (RESTRICT, par défaut)
                               CONSTRAINT fk_representation_salle
                                   FOREIGN KEY (n_salle) REFERENCES Salle (n_salle) ON DELETE RESTRICT,
-- contrainte prix, on aurait pu mettre between
                               CONSTRAINT dom_prix_representation CHECK (prix >= 10 and prix <= 500)
);

-- création de la table billet
CREATE TABLE Billet(
                       n_billet SERIAL,
                       n_salle INTEGER,
                       b_date DATE,
                       nom_client VARCHAR(50) NOT NULL,
                       n_spectacle INTEGER,
-- clef
                       CONSTRAINT pk_billet PRIMARY KEY (n_billet),
-- spectacle supprimé alors on supprime les billets
                       CONSTRAINT fk_billet_spectacle
                           FOREIGN KEY (n_spectacle) REFERENCES Spectacle(n_spectacle) ON DELETE CASCADE,
-- si la salle/date du spectacle est changée, alors on change la salle/date du billet
                       CONSTRAINT fk_billet_representation
                           FOREIGN KEY (n_salle, b_date)
                               REFERENCES Representation (n_salle, r_date) ON UPDATE CASCADE
);

CREATE VIEW V_Guichetier(id_guichetier, nom, prenom)
as SELECT id_guichetier, nom, prenom
   FROM personne JOIN guichetier
                      ON personne.id_personne = guichetier.id_guichetier;

CREATE VIEW Guichet(n_spectacle, n_salle, b_date, nom, s_type, prix, nb_places_libres)
as SELECT sp.n_spectacle, r.n_salle, r_date, nom, s_type, prix,
          nb_places -  (select count(*)
                        FROM billet
                        where n_spectacle=sp.n_spectacle
          )
   FROM spectacle sp JOIN representation r on sp.n_spectacle = r.n_spectacle
                     JOIN salle s on r.n_salle = s.n_salle;


-- merci à Plutoker#8827
-- merci à ElFamosoRaphiki#1803

DELETE FROM billet WHERE 1;
DELETE FROM guichetier WHERE 1;
DELETE FROM personne WHERE 1;
DELETE FROM representation WHERE 1;
DELETE FROM salle WHERE 1;
DELETE FROM spectacle WHERE 1;

-- équivalent mariadb
-- fait de n_spectacle une clef artificielle : augmente de 1 à chaque tuple ajouté
alter table spectacle modify n_spectacle int auto_increment;

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
INSERT INTO Salle
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

Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',1);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',2);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',3);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',4);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',19);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',20);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',21);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',22);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-05',23);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-15',24);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-15',25);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-15',26);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-15',27);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-15',28);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-15',56);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-15',57);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',62);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',63);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',64);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',65);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',109);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',110);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',111);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',112);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',113);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',114);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',115);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (1,4,'2013-01-25',116);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-25',1785);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-25',1786);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-25',1797);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-25',1798);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-25',1799);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-25',1800);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-25',1801);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-25',1802);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',289);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',290);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',291);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',292);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',309);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',310);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',311);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',317);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',318);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',319);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',320);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',321);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-05',322);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',323);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',324);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',325);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',326);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',327);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',328);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',329);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',330);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',331);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',332);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',333);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (17,2,'2013-01-15',334);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8896);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8897);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8913);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8914);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8915);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8916);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8917);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8926);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8927);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8928);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-05',8929);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1781);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1782);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1783);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1784);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1785);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1786);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1787);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1788);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1789);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1790);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1791);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1813);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1814);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-15',1815);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',356);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',357);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',358);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',359);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',360);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',361);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',362);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',363);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',364);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',365);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',366);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',367);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',368);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',369);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',391);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',392);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',393);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',394);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',395);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',396);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',397);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',398);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',399);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',400);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (25,5,'2013-01-25',401);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4586);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4587);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4607);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4608);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4609);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4610);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4611);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4612);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4613);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4614);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4615);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4616);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4617);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-25',4618);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4619);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4620);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4621);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4622);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4623);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4624);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4638);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4639);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4640);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4641);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4642);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4655);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4656);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4657);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4658);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4659);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4660);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4661);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4662);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4663);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4664);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-15',4665);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',1);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',2);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',3);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',4);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',22);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',23);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',24);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',25);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',26);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',27);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',28);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',29);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (2,4,'2013-02-05',46);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',896);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',897);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',898);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',899);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',900);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',917);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',918);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',919);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',920);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',921);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',922);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',939);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',940);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',941);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',942);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',943);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',944);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',945);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-05',946);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5692);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5693);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5694);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5695);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5696);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5697);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5698);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5699);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5700);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5701);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5702);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5703);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-15',5726);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5963);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5964);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5965);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5966);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5967);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5968);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5969);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5970);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5971);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5972);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5973);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5974);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5975);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (18,2,'2013-02-25',5976);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',778);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',779);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',780);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',781);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',795);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',796);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',797);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',798);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',799);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',800);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',801);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',802);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',812);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-25',813);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-15',4389);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-15',4390);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-15',4391);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-15',4411);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-15',4412);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6841);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6842);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6843);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6871);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6872);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6873);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6874);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6875);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6876);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6877);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6878);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6879);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6880);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6881);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6882);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6883);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6884);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6885);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6886);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6887);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6901);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6902);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6903);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6910);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6911);
Insert into Billet(n_spectacle, n_salle, b_date, nom_client) VALUES (13,5,'2013-02-05',6912);