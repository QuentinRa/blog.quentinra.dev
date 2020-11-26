-- ###################################################################
-- # Application : SQL script
-- # File        : create_vins.sql
-- # Revision    : septembre 2018 (Marie Szafranski)
-- # Revision    : novembre 2020 (Quentin Ra)
-- # Author      : Olivier Hubert (email: olivier.hubert@iie.cnam.fr)
-- # Function    : Create the structure of the VINS database
-- ###################################################################

-- If tables exist already
DROP TABLE IF EXISTS livraison;
DROP TABLE IF EXISTS commande;
DROP TABLE IF EXISTS buveur;
DROP TABLE IF EXISTS vin;
DROP TABLE IF EXISTS viticulteur;

CREATE TABLE viticulteur(
                            n_viticulteur INTEGER,
                            nom VARCHAR(30),
                            prenom VARCHAR(20),
                            ville VARCHAR(30),
                            CONSTRAINT pk_viticulteur PRIMARY KEY(n_viticulteur));

CREATE TABLE vin(
                    n_vin INTEGER,
                    cru VARCHAR(20) NOT NULL,
                    millesime INTEGER NOT NULL,
                    region VARCHAR(15),
                    n_viticulteur INTEGER NOT NULL,
                    CONSTRAINT pk_vin PRIMARY KEY(n_vin),
                    CONSTRAINT ck_vin UNIQUE(cru, millesime, n_viticulteur),
                    CONSTRAINT fk_viticulteur FOREIGN KEY (n_viticulteur) REFERENCES
                        viticulteur(n_viticulteur),
                    CONSTRAINT dom_millesime CHECK(millesime > 1970 AND millesime <
                                                                        2012));

CREATE TABLE buveur(
                       n_buveur INTEGER,
                       nom VARCHAR(20),
                       prenom VARCHAR(20),
                       ville VARCHAR(30),
                       CONSTRAINT pk_buveur PRIMARY KEY (n_buveur));

CREATE TABLE commande(
                         n_commande INTEGER,
                         n_buveur INTEGER NOT NULL,
                         n_vin INTEGER NOT NULL,
                         c_date DATE  NOT NULL,
                         c_qte INTEGER ,
                         CONSTRAINT pk_commande PRIMARY KEY (n_commande),
                         CONSTRAINT ck_commande UNIQUE (n_buveur, n_vin, c_date),
                         CONSTRAINT fk_buveur FOREIGN KEY(n_buveur) REFERENCES
                             buveur(n_buveur),
                         CONSTRAINT fk_vin FOREIGN KEY(n_vin) REFERENCES vin(n_vin),
                         CONSTRAINT dom_c_qte CHECK(c_qte =6 OR c_qte = 12 OR c_qte = 18));

CREATE TABLE livraison(
                          n_commande INTEGER,
                          l_date DATE,
                          l_qte INTEGER NOT NULL,
                          CONSTRAINT pk_livraison PRIMARY KEY(n_commande, l_date),
                          CONSTRAINT fk_commande FOREIGN KEY (n_commande) REFERENCES
                              commande(n_commande));

-- ALTER TABLE buveur RENAME ville TO b_ville;
-- ALTER TABLE viticulteur RENAME ville TO v_ville;

-- équivalent mariasql, ne marche pas ailleurs
alter table buveur RENAME COLUMN ville TO b_ville;
alter table viticulteur RENAME COLUMN ville TO v_ville;

DELETE FROM livraison where true;
DELETE FROM commande where true;
DELETE FROM buveur where true;
DELETE FROM vin where true;
DELETE FROM viticulteur where true;

-- load data local infile 'C:/Users/quent/Downloads/fill_viticulteurs.csv' into TABLE
--    viticulteur fields terminated by ',' (n_viticulteur, nom, prenom, ville);

-- load data local infile 'C:/Users/quent/Downloads/fill_vins.csv' into TABLE
--    vin fields terminated by ','
--    (n_vin, cru, millesime, region, n_viticulteur);

-- load data local infile 'C:/Users/quent/Downloads/fill_buveurs.csv' into TABLE
--     buveur fields terminated by ',' (n_buveur, nom, prenom, ville);

INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (1,'MOULIN','JEAN','MACON');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (3,'MORIN','JULES','BENAIS');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (4,'VALLEE','CLAUDE','SAINT NICOLAS');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (5,'COULIS DUTHEIL','','CHINON');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (10,'PARENT','JEAN','MONTHELIE');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (15,'BARANCOURT','','TOURS SUR MARNE');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (16,'JADOT','LOUIS','BEAUNE');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (18,'MEDEVILLE','CHARLES','PREIGNAC');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (21,'LYNCH-BAGES','','PAUILLAC');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (23,'CHATEAU MOULIN A VENT','','CASTELNAU DU MEDOC');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (20,'TISSOT','JACQUES','ARBOIS');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (22,'CHATEAU MONBRISON','','MARGAUX');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (24,'PERRIER','','REIMS');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (26,'VEUVE CLIQUOT','','REIMS');
INSERT INTO viticulteur (n_viticulteur, nom, prenom, v_ville) VALUES (27,'RUINHART','','REIMS');

INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(170,'BOUZY',1994,'CHAMPAGNE',15);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(175,'MEURSAULT',1990,'BOURGOGNE',16);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(180,'SAUTERNES',1992,'BORDEAUX',18);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(184,'PAUILLAC',1992,'BORDEAUX',21);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(190,'MARGAUX',1998,'BORDEAUX',22);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(198,'MOULIS',1991,'BORDEAUX',23);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(186,'CHINON',1998,'LOIRE',4);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(185,'CHINON',1993,'LOIRE',5);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(188,'CHAMBERTIN',1990,'BOURGOGNE',1);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(120,'CHINON',1995,'LOIRE',4);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(191,'SAINT EMILION',1991,'BORDEAUX',18);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(160,'BOURGUEIL',1994,'LOIRE',3);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(128,'BOURGUEIL',1995,'LOIRE',4);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(140,'POMMARD',1996,'BOURGOGNE',10);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(150,'MONTHELIE',1998,'BOURGOGNE',10);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(100,'CHAMPAGNE BRUT',1998,'CHAMPAGNE',24);
INSERT INTO vin (n_vin, cru, millesime, region, n_viticulteur) VALUES(200,'BOURGUEIL',1993,'LOIRE',5);

INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1400, 'GAUTHIER','ROBERT','PARIS');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1500,'FRADET','PHILIPPE','MACON');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1300,'JAMET','FLORENCE','VERSAILLES');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1200,'MAURY','FRANOIS','PARIS');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1100,'COMBET','ALINE','DIJON');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1600,'DUPOND','ALAIN','PARIS');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1700,'COMBES','EDOUARD','PARIS');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1350,'GRAVINEL','SOPHIE','NICE');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1450,'PASCAL','YVES','MACON');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1750,'DURIEUX','BLAISE','CHINON');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1850,'DURIEUX','MARIE','PARIS');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1460,'GAUTHIER','PAUL','PARIS');
INSERT INTO buveur (n_buveur, nom, prenom, b_ville) VALUES (1900,'MOULIN','JEAN','PARIS');

INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (8, 1400, 140, 12, '2002-01-10');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (3, 1500, 188, 12, '2001-09-10');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (2, 1500, 100, 18, '2000-11-20');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (5, 1300, 140, 6, '2000-03-18');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (4, 1600, 175, 6, '2000-02-12');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (1, 1600, 190, 6, '2001-06-30');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (6, 1100, 140, 12, '2002-12-24');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (7, 1200, 188, 12, '2002-12-24');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (11, 1200, 140, 12, '2002-12-12');
INSERT INTO commande(n_commande, n_buveur, n_vin, c_qte, c_date)
VALUES (12, 1100, 120, 6, '2001-12-13');

INSERT INTO livraison (n_commande, l_qte, l_date)
VALUES (2, 12, '2000-11-30');
INSERT INTO livraison (n_commande, l_qte, l_date)
VALUES (1, 6, '2001-07-20');
INSERT INTO livraison (n_commande, l_qte, l_date)
VALUES (2, 6, '2000-12-20');
INSERT INTO livraison (n_commande, l_qte, l_date)
VALUES (3, 12, '2001-10-23');
INSERT INTO livraison (n_commande, l_qte, l_date)
VALUES (4, 6, '2001-01-11');
INSERT INTO livraison (n_commande, l_qte, l_date)
VALUES (6, 6, '2003-01-15');
INSERT INTO livraison (n_commande, l_qte, l_date)
VALUES (7, 6, '2002-12-28');
INSERT INTO livraison (n_commande, l_qte, l_date)
VALUES (7, 6, '2003-01-05');

-- INSERT INTO buveur (n_buveur, nom, prenom, ville)
-- VALUES (1900, 'MOULIN', 'JEAN', 'MACON');
-- INSERT INTO buveur (n_buveur, nom, prenom, ville)
-- VALUES (1950, 'MOULIN', 'JEAN', 'PARIS');

ALTER TABLE vin
    ADD COLUMN stock INTEGER DEFAULT 0;