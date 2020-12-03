-- ***
-- *** f_verifie_stock()
-- *** si stock est négatif alors retourne une exception
-- ***
CREATE OR REPLACE FUNCTION f_verifie_stock () RETURNS TRIGGER AS
$fvs$
DECLARE
    v_stock INTEGER;
BEGIN
    SELECT stock-sum(c_qte) as "r" INTo v_stock
    FROM commande NATURAL JOIN vin
    WHERE New.n_vin=n_vin
    GROUP BY n_vin,stock;
    RAISE NOTICE '% value', v_stock;
    if v_stock <= 0 THEN
        RAISE 'stock invalide (%)', stock;
    END IF;
    RETURn NULL;
END;
$fvs$ LANGUAGE plpgsql;

-- ***
-- *** d_verifie_stock()
-- *** avant chaque insert et update dans commande,
-- *** vérifie qu'il reste assez de vins en stock. Retourne une exception sinon
DROP TRIGGER IF EXISTS d_verifie_stock ON commande;
CREATE TRIGGER d_verifie_stock
    BEFORE INSERT OR UPDATE ON commande
EXECUTE PROCEDURE f_verifie_stock();

-- personnellement, les insertions ne sont pas bloqués car le trigger
-- n'est pas appelé, je ne sais pas pourquoi