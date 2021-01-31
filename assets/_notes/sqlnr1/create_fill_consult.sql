--##############################################################
--# Script SQL
--# Author: Adapté d'un script de xxx yyy
--# Function: Création schéma BD et remplissage des tables
--# Test: SQL-LMD, intégrité, SQL-LDD, triggers
--###############################################################

DROP TABLE IF EXISTS consultation;
DROP TABLE IF EXISTS malade;
DROP TABLE IF EXISTS med_plage_consult;
DROP TABLE IF EXISTS medecin;


CREATE TABLE medecin(
       n_med		INTEGER CONSTRAINT cleprim_medecin PRIMARY KEY,
       identite_med 	VARCHAR(30) NOT NULL,
       tel_med 		CHAR(10),
       email_med	VARCHAR(30),
       prof_serv 	VARCHAR(30) NOT NULL,
       statut 		VARCHAR(7) CONSTRAINT dom_statut_medecin CHECK(statut IN ('PH-ASSO',
                        'PH-ATTH', 'PU-PH', 'CCA')) NOT NULL
);

CREATE TABLE med_plage_consult(
       c_med		INTEGER CONSTRAINT cle_etr_med_plage_consult_medecin REFERENCES
       				medecin(n_med) ON DELETE CASCADE NOT DEFERRABLE,
       jour_sem		VARCHAR(8) CONSTRAINT dom_jour_sem_med_plage_consult CHECK(jour_sem IN (
       			'lundi','mardi', 'mercredi', 'jeudi', 'vendredi','samedi')),
       h_deb		INTEGER CONSTRAINT dom_h_deb_med_plage_consult CHECK(h_deb BETWEEN 8 AND 17) NOT NULL,
       h_fin		INTEGER CONSTRAINT dom_h_fin_med_plage_consult CHECK(h_fin BETWEEN 11 AND 19),
       CONSTRAINT cleprim_med_plage_consult PRIMARY KEY (c_med, jour_sem)
);	

CREATE TABLE malade(
       n_mal		INTEGER CONSTRAINT cleprim_malade PRIMARY KEY,
       nom_mal		VARCHAR(20) NOT NULL,
       prenom_mal	VARCHAR(15) NOT NULL,
       adr_mal		TEXT,
       tel_fixe_mal	CHAR(10),
       tel_mob_mal	CHAR(10)
);

CREATE TABLE consultation(
       n_med		INTEGER CONSTRAINT cle_etr_consultation_medecin REFERENCES
       				medecin(n_med) ON DELETE RESTRICT NOT DEFERRABLE,
       n_mal		INTEGER CONSTRAINT cle_etr_consultation_malade REFERENCES
       			        malade(n_mal) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
       date_h_consult	TIMESTAMP,
       prescription	TEXT,
       examen		TEXT,
       CONSTRAINT cleprim_consultation PRIMARY KEY(n_med, n_mal, date_h_consult)
);	

-- remplissage médecin
INSERT INTO  medecin 
VALUES(104,'Amber VOLAKIS','0149282592','amber.volakis@diag.hosp-pp.com','Gregory HOUSE','PH-ASSO');
INSERT INTO  medecin 
VALUES(123,'Eric FOREMAN','0149282594','eric.foreman@diag.hosp-pp.com','Gregory HOUSE','PH-ATTH');
INSERT INTO  medecin 
VALUES(107,'Gregory HOUSE','0149282678','gregory.house@diag.hosp-pp.com','Gregory HOUSE','PU-PH');   
INSERT INTO  medecin 
VALUES(131,'Remy HADLEY','0149282598','remy.hdaley@diag.hosp-pp.com','Gregory HOUSE','PH-ATTH');
INSERT INTO  medecin 
VALUES(146,'Robert CHASE','0149282584','robert.chase@diag.hosp-pp.com','Gregory HOUSE','PH-ATTH');
INSERT INTO  medecin 
VALUES(124,'Marta MASTERS','0149282567','marta.masters@diag.hosp-pp.com','Gregory HOUSE','CCA');
INSERT INTO  medecin 
VALUES(130,'John CHEMSEVEN','0149285690','john.chemseven@er.hosp-pp.com','Alison CAMERON','CCA');
INSERT INTO  medecin 
VALUES(138,'Alison CAMERON','0149285690','alison.cameron@er.hosp-pp.com','Alison CAMERON','PU-PH');
INSERT INTO  medecin 
VALUES(152,'Mark BLOODGAS','0149285694','mark.bloodgas@er.hosp-pp.com','Alison CAMERON','CCA');

-- remplissage  med_plage_consult
INSERT INTO med_plage_consult VALUES(123,'mardi',8,12);
INSERT INTO med_plage_consult VALUES(123,'jeudi',13,17);
INSERT INTO med_plage_consult VALUES(123,'samedi',9,12);
INSERT INTO med_plage_consult VALUES(107,'jeudi',13,17);
INSERT INTO med_plage_consult VALUES(131,'lundi',17,19);
INSERT INTO med_plage_consult VALUES(131,'samedi',10,12);
INSERT INTO med_plage_consult VALUES(146,'mercredi',13,17);
INSERT INTO med_plage_consult VALUES(146,'lundi',8,12);
INSERT INTO med_plage_consult VALUES(124,'samedi',9,12);
INSERT INTO med_plage_consult VALUES(130,'mardi',13,17);
INSERT INTO med_plage_consult VALUES(130,'jeudi',13,17);
INSERT INTO med_plage_consult VALUES(130,'mercredi',17,19);
INSERT INTO med_plage_consult VALUES(130,'lundi',10,12);
INSERT INTO med_plage_consult VALUES(130,'samedi',10,12);
INSERT INTO med_plage_consult VALUES(138,'mardi',13,17);
INSERT INTO med_plage_consult VALUES(152,'mercredi',13,17);

-- remplissage malade

INSERT INTO  malade
VALUES(5678,'MAYS','Hanna','8 rue des plantes 75005 Paris','0123678767','0745453423');
INSERT INTO malade
VALUES(5430,'DAVIS','Leona','10 boulevard Sébastopol 75003 Paris','0145672312','0678905632');
INSERT INTO  malade
VALUES(5220,'MC NEIL','Richard','34 rue de la Chine 75020 Paris', '0162738473','0687455620');
INSERT INTO  malade
VALUES(5970,'POWEL','Ezra','45 rue de Charenton 75012 Paris','0182567878','0673568098');
INSERT INTO  malade
VALUES(5780,'HATMAN','Alice','20 boulevard de la Bastille 75004 Paris','0134567189','0656787362');
INSERT INTO  malade
VALUES(5632,'SKYE','Irene','27 rue de la Roquette 75011 Paris','0143478372','0607634567');
INSERT INTO  malade
VALUES(5320,'RUSECKAS','Larry','79 rue du Faubourg Saint-Antoine 75011 Paris','0143458578','0663567680');

-- remplissage consultation
INSERT INTO consultation VALUES(123,5780,'2021-01-05 09:20:00');
INSERT INTO consultation VALUES(123,5780,'2021-01-07 15:30:00');
INSERT INTO consultation VALUES(130,5780,'2021-01-06 18:20:00');
INSERT INTO consultation VALUES(138,5780,'2021-01-12 16:40:00');
INSERT INTO consultation VALUES(131,5632,'2021-01-11 17:00:00');
INSERT INTO consultation VALUES(131,5678,'2021-01-11 17:20:00');
INSERT INTO consultation VALUES(131,5430,'2021-01-11 17:40:00');
INSERT INTO consultation VALUES(131,5780,'2021-01-16 10:40:00');
INSERT INTO consultation VALUES(131,5678,'2021-01-18 18:00:00');
INSERT INTO consultation VALUES(152,5220,'2021-01-13 14:20:00');
INSERT INTO consultation VALUES(146,5320,'2021-01-13 14:20:00');
INSERT INTO consultation VALUES(124,5320,'2021-02-06 10:40:00');
INSERT INTO consultation VALUES(130,5320,'2021-01-23 10:00:00');
INSERT INTO consultation VALUES(130,5320,'2021-01-25 10:40:00'); 




