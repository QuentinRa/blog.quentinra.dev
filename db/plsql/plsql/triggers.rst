============================================
Triggers/Déclencheurs
============================================

.. code:: sql

		CREATE [OR REPLACE] TRIGGER nom trigger
		BEFORE | AFTER | INSTEAD OF evenement [OR ... ]
		ON nom table
		[FOR [EACH] ROW | STATEMENT]
		[WHEN (condition)]
		-- code (DECLARE, BEGIN ...)

		-- ou
		CREATE [OR REPLACE] TRIGGER nom trigger
		[BEFORE | AFTER | INSTEAD OF] evenement [OR ... ]
		ON nom table
		[FOR [EACH] (ROW | STATEMENT)]
		[WHEN (condition)]
		-- renvoi vers une procédure
		EXECUTE PROCEDURE nom fonction (arguments)

Trigger DML
----------------------

Les variables NEW et OLD
	Lorsque vous faites un Ordre DML : insert, update, delete, ... alors une copie de la ligne
	avant est crée et mise dans OLD. La nouvelle ligne est mise en NEW.

	Ces deux variables sont a votre disposition dans le trigger si vous voulez les utiliser.

		* Si une variable n'existe pas (OLD pour insert), alors elle vaut NULL.
		* On accède a un attribut avec OLD.attribut

Before et After
	Le trigger peut être exécuté avant un ordre DML (before) ou après (after).

