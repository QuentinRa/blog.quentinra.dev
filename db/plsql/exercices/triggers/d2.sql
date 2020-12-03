--
-- Créez un "miroir" de la table vin, que l’on appellera par exemple vin_m, dont le schéma et les contraintes sont les
-- mêmes que pour vin, à l’exception de l’attribut n_vin qui sera de type TEXT.
--

CREATE TABLE vin_m(
n_vin TEXT,
cru VARCHAR(20) NOT NULL,
millesime INTEGER NOT NULL,
region VARCHAR(15),
n_viticulteur INTEGER NOT NULL,
    CONSTRAINT pk_vin_m PRIMARY KEY(n_vin),
    CONSTRAINT ck_vin_m UNIQUE(cru, millesime, n_viticulteur),
    CONSTRAINT fk_viticulteur_m FOREIGN KEY (n_viticulteur) REFERENCES viticulteur(n_viticulteur),
    CONSTRAINT dom_millesime_m CHECK(millesime > 1970 AND millesime <2012)
);

--
-- Créez une fonction, qui pour chaque tuple présent dans la table vin, remplit la table vin_m avec les informations
-- correspondantes en prenant soin d’intégrer à la clé primaire l’information concernant le millésime.
--

CREATE OR REPLACE FUNCTION f_initialise_vins_m() RETURNS void AS $fun$
DECLARE
-- Probablement un curseur, entre autres
    vins_c CURSOR FOR SELECT * FROM vin;
    n_vin text;
BEGIN
    -- Probablement une boucle sur le curseur permettant de récupérer les informations voulues
    FOR vin in vins_c LOOP
        -- L'insertion des informations dans la table vin m
        -- La fonction permettant de convertir un entier en chaîne de caractère est 'to char'
        -- Par exemple to char('42', 'FM00')
            n_vin := vin.n_vin::varchar(11);
            -- L'opérateur de concaténation est '||'
            n_vin := vin.millesime||n_vin;
            -- Pour mémoire, la doc est ici: http://docs.postgresqlfr.org/9.4/
            -- Et bien sûr la plupart des réponses à vos questions sont là: http://www.google.com
            INSERT INTO vin_m(n_vin, cru, millesime, region, n_viticulteur)
            VALUES (n_vin, vin.cru, vin.millesime, vin.region, vin.n_viticulteur);
        END LOOP;
EXCEPTION
    -- Si on appelle la fonction alors que vin_m contient déjà des valeurs (unique violation)
    WHEN UNIQUE_VIOLATION THEN
        RAISE EXCEPTION 'duplicate value';
END;
$fun$ LANGUAGE plpgsql;

SELECT f_initialise_vins_m();

-- vérification
SELECT * from vin_m;

-- Créez un déclencheur qui, avant chaque insertion dans vin_m, vérifie si la valeur de millésime correspond bien au
--	code entré dans n_vin. Si c’est le cas ou si millésime est NULL, on insère le tuple. Dans le cas contraire, on n’insère
--	pas le tuple.

DROP TRIGGER IF EXISTS d_calcule_millesime ON commande;

CREATE OR REPLACE FUNCTION f_calcule_millesime() RETURNS TRIGGER AS $fun$
    -- La fonction permettant de récupérer une sous-chaîne de caractères est 'substring'
-- Par exemple substring('toto' from 1 for 2) donne 'to'
-- Pour convertir une chaîne en entier on utilisera 'CAST'
-- Par exemple CAST('42' AS INTEGER)
DECLARE
    millesime_v char(4);
BEGIN
    IF NEW.millesime IS NULL THEN RETURN NULL; END IF;
    millesime_v :=  SUBSTRING(NEW.n_vin from 1 for 4);
    IF NEW.millesime = CAST(millesime_v AS INTEGER) THEN
        RETURN NULL;
    END IF;
    RAISE EXCEPTION 'error invalid millesime (% in key)', millesime_v;
END
$fun$ LANGUAGE plpgsql;

CREATE TRIGGER d_calcule_millesime BEFORE INSERT ON vin_m FOR EACH ROW
EXECUTE PROCEDURE f_calcule_millesime();

INSERT INTO vin_m VALUES ('1400155', 'BORDEAUX', 1500, 'BORDEAUX', 27); -- fail
INSERT INTO vin_m VALUES ('1500155', 'BORDEAUX', 1500, 'BORDEAUX', 27);