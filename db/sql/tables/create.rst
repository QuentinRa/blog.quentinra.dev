.. _sql_table_create:

=========================================
5. Gestion des table - Création
=========================================

Pour créer une table, on utilise CREATE TABLE. On liste les attributs (nom type contraintes)
avec contrainte pouvant être par exemple

	* NULL : peut prendre la valeur nulle
	* NOT NULL : ne peut pas prendre la valeur nulle
	* UNIQUE : une valeur ne peut pas être prise deux fois
	* PRIMARY KEY : la seule clef primaire (si plusieurs voir après), unique et non NULL
	* REFERENCES table.key : cet attribut (clé étrangère) ne peut prendre que des valeurs de l'attribut key de table
	* une contrainte personnalisée avec check

.. code:: sql

		CREATE TABLE nom_table (
			nom_attribut type_attribut [ contraintes_attribut ]
			, ...
			-- ex :
			-- nom varchar(50) primary key,
			-- age number NOT NULL

			nom_attribut type_attribut [ contraintes_attribut ]
				check [condition] -- ici vous placez une contrainte personnalisée, sur la même syntaxe que where
		);

Plutôt que de déclarer les contraintes sur la ligne de l'attribut, on les déclare généralement
à la fin (c'est obligatoire **si vous les déclarez** qu'elles soient à la fin).

Si vous voulez plusieurs clés primaires, plusieurs attributs uniques ou alors
créer une clef étrangère pointant sur un couple de clef d'une autre table, alors vous devrez spécifier
la contrainte sur une ligne à part, de la forme :code:`PRIMARY KEY(key1, key2, ...)`.

.. code:: sql

		-- crée une table avec plusieurs attributs uniques/en clef primaires...
		CREATE TABLE nom_table (
			...,
			PRIMARY KEY(attribut1, attribut2),
			UNIQUE(attribut1, attribut2),

			-- on parle de foreign key quand un attribut dans la table ne prends que des valeurs
			-- qui existent dans une autre table
			FOREIGN KEY (attribut1) REFERENCES une_autre_table(attribut1),
			FOREIGN KEY (attribut1, attribut2) REFERENCES une_autre_table(attribut1, attribut2),

			-- contraintes personnalisés
			-- ex: constraint v_range check (v > 3 AND v < 10)
			constraint nom check (condition) [ trigger_contrainte ],
			-- pas de nom pour cette contrainte
			check (condition) [ trigger_contrainte ],
		);

**Note sur FOREIGN KEY**

Il est généralement voulu que lorsqu'une table référencée est supprimée alors
la table référençant soit aussi supprimée (par défaut une erreur est affichée car la table est référencée).

.. code:: sql

		CREATE TABLE nom_table (

		-- si une_autre_table est supprimé alors cette table aussi
		FOREIGN KEY (attribut1) REFERENCES une_autre_table(attribut1) ON DELETE CASCADE,
		-- défaut : ça bloque
		FOREIGN KEY (attribut1) REFERENCES une_autre_table(attribut1) ON DELETE RESTRICT,

		-- si une_autre_table est modifiée alors cette table aussi
		FOREIGN KEY (attribut1) REFERENCES une_autre_table(attribut1) ON UPDATE CASCADE,
		-- défaut : ça bloque
		FOREIGN KEY (attribut1) REFERENCES une_autre_table(attribut1) ON UPDATE RESTRICT

		);

Plus d'infos dans la partie triggers.