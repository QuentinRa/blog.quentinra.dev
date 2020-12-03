-- ***
-- *** f_verifie_stock()
-- *** si stock est négatif alors retourne une exception
-- ***
CREATE OR REPLACE FUNCTION f_verifie_stock () RETURNS TRIGGER AS
$fvs$
DECLARE
    v_stock INTEGER;
BEGIN
    SELECT stock-sum(c_qte)-NEW.c_qte as "r" INTo v_stock
    FROM commande NATURAL JOIN vin
    WHERE New.n_vin=n_vin
    GROUP BY n_vin,stock;
    RAISE NOTICE '% value', v_stock;
    if v_stock <= 0 THEN
        RAISE EXCEPTION 'stock invalide (%)', v_stock;
    END IF;
    RETURN NULL;
END;
$fvs$ LANGUAGE plpgsql;

-- ***
-- *** d_verifie_stock()
-- *** avant chaque insert et update dans commande,
-- *** vérifie qu'il reste assez de vins en stock. Retourne une exception sinon
DROP TRIGGER IF EXISTS d_verifie_stock ON commande;
CREATE TRIGGER d_verifie_stock
    BEFORE INSERT OR UPDATE ON commande
    FOR EACH ROW
EXECUTE PROCEDURE f_verifie_stock();

SELECT n_vin, stock, sum(c_qte) FROM vin NATURAL JOIN commande GROUP BY n_vin;
INSERT INTO commande VALUES(112,1400,140,'2000-01-03',18);
SELECT n_vin, stock, sum(c_qte) FROM vin NATURAL JOIN commande GROUP BY n_vin;

---
--- Reprenez le déclencheur précédent en diminuant également la quantité de vins disponible
--- chaque fois qu’un vin peut être commandé.
---

DROP TRIGGER IF EXISTS d_diminue_stock ON commande;
CREATE OR REPLACE FUNCTION f_diminue_stock() RETURNS TRIGGER AS $fun$
BEGIN
    UPDATE vin set stock=stock-NEW.c_qte WHERE n_vin=NEW.n_vin;
    RETURN NULL;
END
$fun$ LANGUAGE plpgsql;
CREATE TRIGGER d_diminue_stock AFTER INSERT ON commande
    FOR EACH ROW
EXECUTE PROCEDURE f_diminue_stock();

SELECT * FROM vin;
INSERT INTO commande VALUES(112, 1400, 170, '2000-01-06', 18);
SELECT * FROM vin where n_vin=170; -- vérifie