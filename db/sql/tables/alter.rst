===================================================
5. Gestion des table - Modification et suppression
===================================================

On peut modifier une table avec ALTER TABLE,
ce qui nous permet d'ajouter/supprimer des contraintes sur les attributs,
ajouter/modifier/supprimer des attributs.

Drop Table permet de supprimer une table.

.. code:: sql

		ALTER TABLE table
			add nom type default_value
			add constraint name check ...
			alter nom drop/set default
			drop column nom
			drop constraint nom
		;

		DROP TABLE table