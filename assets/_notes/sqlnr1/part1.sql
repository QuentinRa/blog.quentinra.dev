--##############################################################
--# 1. Interrogation (LMD)
--# Nom : RAMSAMY--AGEORGES
--# Prénom : Quentin
--###############################################################

------> 1.1. (4 tuples)
-- requete

SELECT DISTINCT N.n_mal, nom_mal, prenom_mal
FROM malade N, consultation C, medecin M
WHERE N.n_mal = C.n_mal AND c.n_med = m.n_med AND M.identite_med='Remy HADLEY';

-- resultat

-- 5430 DAVIS Leona
-- 5632 SKYE Irene
-- 5678 MAYS Hanna
-- 5780 HATMAN Alice


------> 1.2. (3 tuples)
-- requete SQL-89

SELECT n_med, identite_med FROM med_plage_consult c, medecin m WHERE C.c_med=m.n_med AND jour_sem='mardi';

-- requete SQL-92

SELECT n_med, identite_med FROM med_plage_consult Join medecin m ON c_med=m.n_med WHERE jour_sem='mardi';

-- resultat 

------> 1.3. (5 tuples)
-- requete SQL-89

SELECT Me.n_med, identite_med, date_h_consult FROM consultation c, malade m, medecin Me
WHERE m.n_mal=C.n_mal AND nom_mal='HATMAN' AND prenom_mal='Alice'
  AND Me.n_med=C.n_med
ORDER BY date_h_consult;

-- requete SQL-92

SELECT Me.n_med, identite_med, date_h_consult
FROM consultation c NATURAL JOIN malade m NATURAL JOIN medecin Me
WHERE nom_mal='HATMAN' AND prenom_mal='Alice'
ORDER BY date_h_consult;

-- resultat

-- 123 Eric FOREMAN 2021-01-05T09:20:00.000Z
-- 123 Eric FOREMAN 2021-01-07T15:30:00.000Z
-- 130 John CHEMSEVEN 2021-01-06T18:20:00.000Z
-- 138 Alison CAMERON 2021-01-12T16:40:00.000Z
-- 131 Remy HADLEY 2021-01-16T10:40:00.000Z

------> 1.4. (3 tuples)
-- HINT :    pour extraire le mois de janvier,
-- 	     utiliser extract(month from xxx)=01

-- a) requete

(SELECT n_med,identite_med, statut
from medecin)
EXCEPT
(SELECT M.n_med,identite_med, statut
from medecin M NATURAL JOIN consultation
WHERE EXTRACT(MONTH FROM date_h_consult)='01');

-- b) requete

SELECT M.n_med,identite_med, statut
from medecin m LEFT OUTER JOIN consultation c ON c.n_med=M.n_med
WHERE EXTRACT(MONTH FROM date_h_consult)<>'01' OR date_h_consult IS NULL;

-- resultat

-- 124 Marta MASTERS CCA
-- 104 Amber VOLAKIS PH-ASSO
-- 107 Gregory HOUSE PU-PH

------> 1.5. (2 tuples)

-- requete

SELECT n_mal, nom_mal, prenom_mal, COUNT(DISTINCT n_med) as "nb medecin consultés"
FROM malade NATURAL JOIN consultation
GROUP BY n_mal
HAVING COUNT(DISTINCT n_med)>=3;

-- resultat

-- 5320 RUSECKAS Larry 3
-- 5780 HATMAN Alice 4

------> 1.6. (4 tuples)

-- requete

SELECT identite_med, statut, COUNT(*) AS "nb_plages_consultation"
FROM med_plage_consult c JOIN medecin m ON  c.c_med=M.n_med
WHERE c_med IN (SELECT c_med FROM med_plage_consult GROUP BY c_med HAVING COUNT(*) >= 2)
GROUP BY identite_med, statut
ORDER BY 3 DESC;

-- resultat

-- John CHEMSEVEN CCA 5
-- Eric FOREMAN PH-ATTH 3
-- Robert CHASE PH-ATTH 2
-- Remy HADLEY PH-ATTH 2
