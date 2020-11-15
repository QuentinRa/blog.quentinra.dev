=============================================================
Règle 2 : association n..* vers m..*
=============================================================

Processus
	* \
		On crée une relation avec comme nom celui de l’association.
	* \
		Ses attributs sont les identifiants des deux classes, et éventuellement les
		attributs de la classe d’association si présente.
	* \
		Son identifiant est un couple d’identifiant, qui sont les identifiant des deux classes.
	* \
		Tout en respectant les contraintes de multiplicité (Soit A,B nos relations et C la relation de l'association)

			*	si (0..*,0..*) : aucune contrainte
			* si (0..*,1..*) : A in C = toutes les clef de A doivent être au moins une fois dans C
			*	si (1..*,1..*) : A in C, B in C = toutes les clef de A et B doivent être au moins une fois dans C

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
	Dirige(#(clan=>Patriarche.nomClan,code=>Membre.code_secret), années : number)

	clan IN Dirige

ou

.. code:: none

	Patriarche(nom:varchar, #nomClan: varchar,age : number)
	Membre(nom:varchar, #code_secret: varchar)
	Dirige(#code_secret=>Membre.code_secret, #clan=>Patriarche.nomClan, années : number)

	clan IN Dirige

ou

.. code:: none

	Patriarche(nom:varchar, #nomClan: varchar,age : number)
	Membre(nom:varchar, #code_secret: varchar)
	Dirige(#code_secret=>Membre(code_secret), #clan=>Patriarche(nomClan), années : number)

	clan IN Dirige