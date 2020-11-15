=============================================================
Règle 2 : association x..* vers x..*
=============================================================

On crée une relation avec comme nom celui de l’association.

Ses attributs sont les identifiants des deux classes, et éventuellement les
attributs de la classe d’association si présente.

Son identifiant est un couple d’identifiant, qui sont les identifiant des deux classes.

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

		Patriarche "0..*" - "1..*" Membre
		(Patriarche, Membre) "*" .. "*" Dirige

		class Dirige {
			années : number
		}
		@enduml

Donne la relation

.. code:: none

	Patriarche(nom:varchar, #nomClan: varchar,age : number)
	Membre(nom:varchar, #code_secret: varchar)

	et

	Dirige(#(clan=>Patriarche.nomClan,code=>Membre.code_secret), années : number)

	ou

	Dirige(#code_secret=>Membre.code_secret, #clan=>Patriarche.nomClan, années : number)

	ou

	Dirige(#code_secret=>Membre(code_secret), #clan=>Patriarche(nomClan), années : number)

	ou sans spécifier la clef, car il n'y en a qu'une

	Dirige(#code_secret=>Membre, #clan=>Patriarche, années : number)


	contraintes

		* clan IN Dirige (qui veut dire que tous les id des patriarches sont dans Dirige)

.. note::

	Soit A et B deux relations, C la nouvelle relation et (c1,c2) la relation de cardinalité a à gauche et b à droite, alors

		* si (0..*,0..*) : aucune contrainte
		* si (0..*,1..*) : toutes les clef de A doivent être au moins une fois dans C
		* si (1..*,1..*) : toutes les clef de A et B doivent être au moins une fois dans C