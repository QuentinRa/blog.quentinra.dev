.. _sql_table_create:

=========================================
5. Gestion des table - Création
=========================================

Pour créer une table, on utilise CREATE TABLE. On liste les attributs (nom type contraintes)
sur lesquels on peut placer des contraintes

	* NULL : peut prendre la valeur nulle
	* NOT NULL : ne peut pas prendre la valeur nulle
	* UNIQUE : une valeur ne peut pas être prise deux fois
	* PRIMARY KEY : la seule clef primaire, unique et non NULL
	* REFERENCES table.key : cet attribut (clé étrangère) ne peut prendre que des valeurs de l'attribut key de table
	* une contrainte personnalisée avec constraint

Si vous voulez plusieurs clés primaires, plusieurs attributs uniques ou alors
créer une clef étrangère pointant sur un couple de clef d'une autre table, alors vous devrez spécifier
la contrainte sur une ligne à part, de la forme :code:`PRIMARY KEY(key1, key2, ...)`.

.. code:: sql

		CREATE TABLE nom_table (
			nom_attribut type_attribut [ contrainte_attribut ]
			, ...
			-- ex :
			-- nom varchar(50) primary key,
			-- age number NOT NULL
		);

		-- crée une table avec plusieurs attributs uniques/en clef primaires...
		CREATE TABLE nom_table (
			...,
			PRIMARY KEY(attribut1, attribut2),
			UNIQUE(attribut1, attribut2),

			-- on parle de foreign key quand un attribut dans la table ne prends que des valeurs
			-- qui existent dans une autre table
			FOREIGN key(attribut1, attribut2) references une_autre_table(attribut)
		);

		-- création complexe :
		-- contraintes (par exemple, un attribut doit contenir une valeur entre 0 et 3, ....)
		-- une condition peut être attribut > 10 ou encore primary key etc...
		CREATE TABLE nom_table (
			...,
			constraint nom
				check (condition) [ trigger_contrainte ]
		);

.. note::

	Un exemple de constraint serait :code:`constraint v_range check v > 3 AND v < 10`
	qui place une contrainte sur l'attribut v, appelée v_range, et qui oblige l'attribut
	v a être entre 3 et 10 (non inclus).

	Plus d'informations dans triggers.