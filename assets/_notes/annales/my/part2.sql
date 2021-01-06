--##############################################################
--# 2. Intégrité, fonctions et triggers
--# Nom : RAMSAMY--AGEORGES
--# Prénom : Quentin
--###############################################################

------> Intégrité

------> 2.1.
-- a) INSERT INTO med_plage_consult(c_med,jour_sem, h_deb,h_fin) VALUES (107, 'jeudi', 9, 12);
-- b) Clef primaire : unique et NOT Null or couple (médecin,jour) est une clef et (107,'jeudi') est déjà utilisé
-- c)

ALTER TABLE med_plage_consult
DROP CONSTRAINT cleprim_med_plage_consult;

ALTER TABLE med_plage_consult
    ADD CONSTRAINT cleprim_med_plage_consult PRIMARY KEY (c_med, jour_sem, h_deb,h_fin);

------> 2.2.
-- a) INSERT INTO medecin VALUES(160, 'Lisa CUDDY', '0149282679', 'lisa.cuddy@dir.hosp-pp.com', 'Lisa CUDDY', 'DR');
-- b) Le statut d'un  médecin ne peut pas être DR ('PH-ASSO', 'PH-ATTH', 'PU-PH', 'CCA')
-- c)

ALTER TABLE medecin
DROP CONSTRAINT dom_statut_medecin;

ALTER TABLE medecin
    ADD CONSTRAINT dom_statut_medecin CHECK(statut IN ('PH-ASSO','PH-ATTH', 'PU-PH', 'CCA','DR'));

------> 2.3.
-- a) DELETE FROM medecin WHERE identite_med='Marta MASTERS';
-- b) Le médecin est référencé dans une autre table, l'insertion cascade n'est pas activé donc ça bloque

------> 2.4.
-- a) DELETE FROM malade WHERE n_mal=5320;
-- b) un malade est présent dans consultation mais l'attribut est ON DELETE CASCADE
-- donc pour malade supprimé, ses consultations sont aussi supprimées.

------> 2.5.
-- a)  INSERT INTO consultation VALUES (125, 5678, '2021-01-06 10:00:00');
-- b) Cela échoue car le médecin n'existe pas. (SELECT * FROM medecin WHERE n_med=125; retourne rien)
-- (et bien sur n_med références medecin)

------> Fonctions et triggers

------> 2.6.

-- prends l'ID d'un médecin et une timestamp
-- retourne 0 si la timestamp n'est pas dans la plage horaire du médecin sinon 1
CREATE OR REPLACE FUNCTION f_check_med_stamp(param_m_code INTEGER, param_date_TS TIMESTAMP)
              RETURNS INTEGER AS $fonc$
DECLARE
c_med CURSOR IS SELECT * FROM med_plage_consult WHERE c_med=param_m_code;
-- on extrait dans ces variables les valeurs
v_heure med_plage_consult.h_deb%Type;
    v_jour INTEGER;

    -- tableau des jours, 0 = dimanche
    days VARCHAR(10) ARRAY[7] := '{"dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"}';
BEGIN
    v_jour := EXTRACT(DOW FROM param_date_TS);
v_heure := EXTRACT(HOUR FROM param_date_TS);
    FOR med IN c_med LOOP
    	if days[v_jour]=med.jour_sem THEN
        	-- regarde que c'est dans la plage
        	IF v_heure >= med.h_deb AND v_heure <= med.h_fin THEN
        		-- RAISE EXCEPTION 'date valide % : %-%', med.jour_sem,med.h_deb,med.h_fin ;
                RETURN 1;
            END IF;
        END IF;
    END LOOP;
    RETURN 0;
END;
$fonc$ LANGUAGE plpgsql;

SELECT f_check_med_stamp(123, '2021-01-06T07:20:00.000Z'); -- pas ok
SELECT f_check_med_stamp(123, '2021-01-06T09:20:00.000Z'); -- ok

------> 2.7.

-- appelle la fonction qui retourne un trigger
-- gestion de l'erreur si retour = 0
CREATE OR REPLACE FUNCTION f_call_check_med_stamp()
              RETURNS TRIGGER AS $fonc$
DECLARE
    retour INTEGER;
BEGIN
    retour := f_check_med_stamp(NEW.n_med, NEW.date_h_consult);
    -- erreur lève exception
    if retour=0 THEN
        RAISE EXCEPTION 'La timestamp n''est pas dans le consultation du médecin';
    END IF;
    -- création
    RETURN NEW;
END;
$fonc$ LANGUAGE plpgsql;

-- trigger avant insertion
DROP TRIGGER IF EXISTS d_check_med_stamp ON consultation;
CREATE TRIGGER d_check_med_stamp
    BEFORE INSERT ON consultation
    FOR EACH ROW
    EXECUTE PROCEDURE f_call_check_med_stamp();

-- test

INSERT INTO consultation VALUES (123,5430, '2021-01-05T15:27:00.000Z', NULL, NULL); -- ko
INSERT INTO consultation VALUES (123,5430, '2021-01-05T11:27:00.000Z', NULL, NULL); -- ok