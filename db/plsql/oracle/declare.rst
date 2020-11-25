============================================
Déclaration d'une procédure
============================================

.. code:: sql

		CREATE OR REPLACE PROCEDURE
		nomProcedure(nom1 type,nom2 type) IS
		-- declaration des variables
		BEGIN
		-- instructions

		-- COMMIT ou ROLLBACK
		EXCEPTION
		--traitement des erreurs
		END NomProcedure;
		/ -- compiler

Explications :

	* :code:`nomProcedure(nom1 type,nom2 type)` est la signature de votre procédure donc le nom et les arguments
	* :code:`-- declaration des variables` dans cet espace, vous devez déclarer toutes vos variables (voir partie correspondante)
	* :code:`-- instructions` ici vous écrivez votre code
	*
		:code:`-- COMMIT ou ROLLBACK` il est recommandé ou obligatoire (si insert) de COMMIT (sauvegarder les modifications
		faites) ou ROLLBACK (annuler les modifications faites).
	* :code:`EXCEPTIONS`, partie facultative permettant de traiter de possibles erreurs

Vous appelez ensuite votre procédure comme suit :

.. code:: sql

		execute nomProcedure(arguments); -- ou execute nomProcedure
		--ou
		call nomProcedure(arguments); -- appelle
		-- ou
		begin
			nomProcedure(arguments);
			--ou
			nomProcedure
		end;
		/