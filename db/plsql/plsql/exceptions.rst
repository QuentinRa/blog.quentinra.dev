============================================
Capturer des exceptions
============================================

Vous mettez vos exceptions dans le bloc EXCEPTIONS.

En gros si une erreur arrive, alors le code s'arrête et va directement
dans EXCEPTION, on regarde si vous avez capturer cette exception

	* si oui alors on fait votre code et on termine l'exécution.
	* si non alors on arrête l'exécution et on affiche un message d'erreur

Remarque
	Si votre procédure est dans une autre procédure, alors avant d'afficher un message
	d'erreur on va également passer par son bloc EXCEPTION.

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

Lever une exception programmatiquement
--------------------------------------------------

Vous pouvez levez programmatiquement une exception avec RAISE.
Cela aura le même comportement que si l'exception été survenue toute seule.

.. code:: sql

	-- formats les plus courants
	RAISE 'format', valeurs
	RAISE 'format', valeurs USING ERRCODE = 'valeur'
	RAISE exception
	RAISE exception USING MESSAGE = 'information additionnelle'

	RAISE [niveau] ['format' [, expression [, ... ]] | condition | SQLSTATE 'état sql'][USING option = expression [, ... ]];

Explications

	*
		format fonctionne comme un printf en c : vous mettez % pour indiquer un élément a remplacer
		et dans valeurs vous indiquez la valeur par laquelle remplacer le premier % puis le second etc...
		Le format est celui du message d'erreur

	* USING permet d'ajouter une information telle que un code d'erreur associé ou une exception
	* vous pouvez directement lever une exception avec RAISE exception, et vous pouvez ajouter un message d'erreur


