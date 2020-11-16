=============================================================
Règle 4 : associations 1 vers 1 ou 0..1 vers 0..1
=============================================================

Processus
	* \
		On choisit une des relations on va dire B (on peut faire l'inverse) et on met la
		clef de l'autre donc A dans B mais en tant qu'attribut normal.
	* \
		Si on a une classe d’association, elle va dans la classe choisie.
	* \
		Tout en respectant les contraintes de multiplicité (Soit A,B nos relations)

			* si (0..1,0..1) : "clé" de A dans B unique
			* si (0..1, 1) : "clé" de A dans B unique et non null
			* si (1, 1) : A in B = attribut ajouté dans B prends toutes les valeurs de la clef de A et "clé" de A dans B unique et non null

	* \
		on peut également fusionner les deux classes si cela est pertinent. La clef primaire de l'un des
		deux devient un attribut normal, mais avec une contrainte unique (et not null selon la multiplicité).


**Exemple de cas**

.. uml::

		@startuml
		class Patriarche {
			 nom : varchar
			 "<u>nomClan" : varchar
			 age : number
		}

		class Membre {
			 nom : varchar
			 "<u>code_secret" : varchar
		}

		Patriarche "1" - "1" Membre
		(Patriarche, Membre) .. Dirige

		class Dirige {
			années : number
		}
		@enduml

Donne la relation

.. code-block:: none

	Patriarche(nom:varchar, #nomClan: varchar,age : number, code_secret=>Membre.code_secret, années : number)
	Membre(nom:varchar, #code_secret: varchar)

	ou

	Patriarche(nom:varchar, #nomClan: varchar,age : number)
	Membre(nom:varchar, #code_secret: varchar, nomClan=>Patriarche.nomClan, années : number)

Cas tordus
===============================

Il se peut que vous tombiez (R.I.P x100) sur deux classes avec un seul attribut qui est une clef primaire.

Cas
	* (0..1,1) : A devient un attribut a unique
	* (0..1,1) : On créé une relation A et une relation B qui a pour clef primaire la relation A, ancienne clef de B est unique et non null
	* (0..1,1) : On créé une relation A et une relation B qui a un attribut qui est la clef de A avec contraintes unique et non null
	* (1,1) : les 3 solutions possibles plus hautes mais avec les contraintes : A in B et projection(A.clef) = projection(B.clef)

.. note::

	Projection vient de l'algèbre matriciel et signifie la sélection de tout ce que contient un ensemble. Donc
	projection(A.clef) = projection(B.clef) signifie que toutes les clefs qui sont dans A sont dans B, en même quantité.