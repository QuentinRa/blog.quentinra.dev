=============================================================
Règle 4 : associations 1 vers 1
=============================================================

On choisit une relation et on met l’identifiant de l’autre relation dans celle qu’on a choisie
(il existe donc deux façons différentes).

Si on a une classe d’association, elle va dans la classe choisie.

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