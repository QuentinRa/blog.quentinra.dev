============================================
Triggers/Déclencheurs
============================================

Voici la syntaxe d'un trigger. Un événement est

	* INSERT, UPDATE DELETE, ALTER, ....
	* Update(colonne) ou UPDATE OF colonne : seulement la mise à jour d'une colonne déclenche le trigger
	* vous pouvez mettre plusieurs événements avec OR

.. code:: sql

		CREATE [OR REPLACE] TRIGGER nom trigger
		BEFORE/AFTER evenement ON table
		[FOR EACH ROW]
		[WHEN condition]
		-- code (DECLARE, BEGIN ...)

		-- autre version

		CREATE [OR REPLACE] TRIGGER nom trigger
		BEFORE/AFTER evenement ON table
		[FOR EACH ROW]
		[WHEN condition]
		-- renvoi vers une procédure
		EXECUTE PROCEDURE nom fonction (arguments)

		-- Forme complète

		CREATE [OR REPLACE] TRIGGER nom trigger
		BEFORE/AFTER/INSTEAD OF evenement [OR ... ] ON table
		[FOR [EACH] ROW/STATEMENT]
		[WHEN condition]
		-- code (DECLARE, BEGIN ...)
		-- ou
		EXECUTE PROCEDURE nom fonction (arguments

Before et After
	Le trigger peut être exécuté avant un ordre DML (before) ou après (after).

For each row et/ou when
	Exécuté sur tous les lignes de l'événement sinon vous pouvez spécifier seulement
	certaines lignes avec when.

	Si aucun des deux n'est présent, alors le trigger est déclenché pour chaque ligne
	modifiée dans l'événement.

Trigger DML
----------------------

Les variables NEW et OLD
	Lorsque vous faites un Ordre DML : insert, update, delete, ... alors une copie de la ligne
	avant est crée et mise dans OLD et la nouvelle ligne est mise en NEW (on appelle ces variables
	des variables de corrélation).

	Ces deux variables sont a votre disposition dans le trigger si vous voulez les utiliser.

		* Si une variable n'existe pas (OLD pour insert), alors elle vaut NULL.
		* On accède a un attribut avec OLD.attribut

	Vous pouvez renommer les variables NEW et OLD en :new et :old (ce qui est généralement) fait
	avec :code:`REFERENCING OLD :old NEW :new` juste avant le FOR EACH ROW.

Commit et ROLLBACK
	Attention, il n'y a pas de COMMIT ou ROLLBACK dans un trigger, car le jeu d'instruction
	qui exécute le trigger va automatiquement COMMIT.

