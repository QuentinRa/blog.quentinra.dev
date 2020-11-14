=============================================================
Règle 1 : une classe donne une relation
=============================================================

Une Classe donne une relation, les identifiants deviennent des clés.

.. uml::

		@startuml
		class Patriarche {
			 nom : varchar
			 "<u>nomClan" : varchar
			 age : number
		}
		@enduml

Donne la relation

.. code:: none

	Patriarche(nom:varchar, #nomClan: varchar,age : number)