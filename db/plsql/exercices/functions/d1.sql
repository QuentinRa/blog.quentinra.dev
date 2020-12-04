-- ***
-- *** f_initialise_stock_vin(num_vin, qte)
-- *** prends un vin et une quantité et initialise le stock
-- *** de vin de la valeur de qte. Error si qte négative.
CREATE OR REPLACE FUNCTION
    f_initialise_stock_vin(num_vin INTEGER, qte INTEGER)
    RETURNS void AS $fisv$
BEGIN
    IF qte < 0 THEN
        RAISE EXCEPTION '% pas une quantité valide', qte;
    END IF;
    UPDATE vin set stock = qte WHERE n_vin=num_vin;
END; $fisv$ LANGUAGE plpgsql;

-- ***
-- *** tests de la fonction f_initialise_stock_vin()
-- ***
SELECT f_initialise_stock_vin(170, 12);
SELECT f_initialise_stock_vin(170, -666);

-- ***
-- *** f_initialise_stock()
-- *** Initialise le stock de tous les vins à 24
-- ***
CREATE OR REPLACE FUNCTION f_initialise_stock()
    RETURNS void AS $fis$
DECLARE
c_vin CURSOR IS SELECT n_vin FROM vin;
v_nvin vin.n_vin%type; -- prends le type de n_vin
BEGIN
    OPEN c_vin;

    -- plus simple de faire un foreach mais c'est juste pour montrer des trucs
    LOOP
      FETCH c_vin INTO v_nvin;
      EXIT WHEN not FOUND;
      -- Un appel à la fonction f initialise stock vin serait bienvenu
      EXECUTE f_initialise_stock_vin(v_nvin, 24);
    END LOOP;

    CLOSE c_vin;
END;
$fis$ LANGUAGE plpgsql;

-- alternative

CREATE OR REPLACE FUNCTION f_initialise_stock()
    RETURNS void AS $fis$
DECLARE
    c_vin CURSOR IS SELECT n_vin FROM vin;
BEGIN
    FOR vin IN c_vin LOOP
        EXECUTE f_initialise_stock_vin(vin.n_vin, 24);
    END LOOP;
END;
$fis$ LANGUAGE plpgsql;

-- ***
-- *** tests de la fonction f_initialise_stock_vin()
-- ***
SELECT f_initialise_stock();