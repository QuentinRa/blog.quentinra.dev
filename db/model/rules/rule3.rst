=============================================================
Règle 3 : association * vers 0..1 ou * vers 1
=============================================================

L’identifiant de la classe du côté de 0..1/1 va
dans la classe du côté de \*. Si on a une classe d’association, elle va dans la classe du côté de \*.

La différence entre 0..1 et 1, est que l'attribut
peut être null si 0..1 et ne peux pas être null si 1.

Le fait d'avoir 0..* ou 1..* détermine si 1..* que la clef ajoutée dans relation du côté du \*
doit prendre toutes les valeurs de l'autre relation, au moins une fois.

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

	contraintes

		* tous les patriarches doivent être présents au moins une fois dans Membre.patriarche
		* Membre.patriarche peut être NULL