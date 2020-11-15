=============================================================
Règle 3 : association * vers 0..1 ou * vers 1
=============================================================

Processus
	* \
		L’identifiant de la classe du côté de 0..1/1 va dans la classe du côté de \*.
	* \
		Si on a une classe d’association, elle va dans la classe du côté de \*.
	* \
		Si on a 1 et pas 0..1, alors l'attribut est non null.
	* \
		Tout en respectant les contraintes de multiplicité (Soit A,B nos relations)

			* si (0..1,0..*) : aucune contrainte
			* si (1,0..*) : clef de A doit être non nulle
			* si (1,1..*) : clef de A doit être non nulle et A in B = toutes les clef de A doivent apparaitre au moins une fois dans B
			* si (0..1,1..*) : A in B = toutes les clef de A doivent apparaitre au moins une fois dans B

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

		Patriarche "0..1" - "1..*" Membre
		(Patriarche, Membre) .. Dirige

		class Dirige {
			années : number
		}
		@enduml

Donne la relation

.. code-block:: none

	Patriarche(nom:varchar, #nomClan: varchar,age : number)
	Membre(nom:varchar, #code_secret: varchar,  patriarche=>Patriarche.nomClan, années: number)

	Patriarche in Membre