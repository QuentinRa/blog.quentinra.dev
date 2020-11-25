============================================
Capturer des exceptions
============================================

Vous mettez vos exceptions dans le bloc EXCEPTIONS.

.. code:: sql

		-- Pas de données trouvés
		WHEN NO_DATA_FOUND THEN instructions END

		-- Division par zero
		WHEN ZERO_DIVIDE_THEN THEN instructions END

		--	Requête retourne plus d’éléments que on n’as déclaré de variables dans le into (voir curseurs)
		WHEN TOO_MANY_ROWS THEN instructions END

		--	Autres
		WHEN OTHERS THEN instructions END