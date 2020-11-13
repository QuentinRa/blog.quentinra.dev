============================
7. Concurrence - Verrous
============================

Pour garantir la validité des contraintes, des verrous sont placés sur une colonne/table
pour éviter que deux transactions correctes qui s'effectuent en même temps,
se superposent et plongent la base dans un état incorrect.

La base de donnée crée un verrou

	* partagé avant chaque lecture
	* exclusif avant un insert/update/delete

=============== ================= ====================
Posé \ Demandé  Partagé           Exclusif
=============== ================= ====================
Partagé	        Pas d'attente     Attente de Unlock
Exclusif        Attente de Unlock Attente de Unlock
=============== ================= ====================

.. code:: sql

	-- forcer un verrou exclusif = verrou d'intention au select
	select * FROM ... for update;
	commit; -- unlock