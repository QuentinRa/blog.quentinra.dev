============================================
Déclaration d'un bloc de code
============================================

.. code:: sql

		[DECLARE]
		-- declaration des variables
		BEGIN
		-- instructions

		-- COMMIT ou ROLLBACK
		EXCEPTION
		--traitement des erreurs
		END NomProcedure;
		/ -- compiler

Explications :

	* une partie [DECLARE] pour déclarer les variables
	* une partie [BEGIN] pour le code
	* une partie [EXCEPTION] pour les erreurs appelés exceptions
	* END; pour indiquer que la déclaration du bloc est finie.

COMMIT et ROLLBACK
	Il s'agit de deux instructions ULTRA IMPORTANTES donc a connaître.

	Lorsque vous faites une ordre DML, le SGBD ne sauvegarde pas automatiquement les changements sur le serveur.
	Si vous êtes sûr de vos changements, allez vous utiliser la requête SQL :code:`COMMIT;` sinon vous pouvez annuler
	vos modifications locales avec :code:`ROLLBACK`.

	Donc généralement la dernière ligne avant les exceptions d'une procédure contenant un ordre DML est COMMIT.