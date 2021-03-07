================
AbstractFactory
================

Aussi appelé Kit.

Une AbstractFactory est une usine utilisant plusieurs Factory.

Imaginons vous avez une factory pour créer des monstres, une pour créer
des héros et une pour créer des personnages non joueurs (PNJ, NPC en anglais),
alors une AbstractFactory aurait 3 méthodes, chacune utilisant une factory.

En fait c'est un peu plus complexe

	* une AbstractFactory est groupe de Factory
	* les Factory ont la même sémantique (donc ça a un sens de les mettre ensemble)
	* on fait une méthode par Factory
	* chaque méthode de l'AbstractFactory retourne **une factory** !

More

	* :code:`➡️` : par exemple un gestionnaire de drivers SQL ?
	* :code:`✅` : fait une super isolation, facile de changer les classes concrètes
	* :code:`🚫` : trop de code, parfois très complexe

C'est beaucoup trop de code donc pas d'exemple, mais je résume

	* imaginons deux interfaces : Monstre et Humain
	* qui auront des sous-classes : Gobelin, Troll ... et Héros, PNJ
	* On va créer une AbstractFactory (abstraite)

		* la méthode monster(...) va créer des monstres (et retourne un Montre)
		* la méthode human(...) va créer des humains (et retourne un Humain)

	* on va maintenant créer MonstreFactory et HumainFactory qui extends AbstractFactory et qui créent des monstres/humains
	* Enfin, on code notre UnitCreator (concrète)

		* on va retourner une AbstractFactory !
		* mais dans le code de la méthode, ce sera une MonstreFactory/HumainFactory
		* on peut appeler la méthode getFactory par exemple

	* dans votre code, on va manipuler

		* UnitCreator : pour créer une AbstractFactory
		* AbstractFactory : pour créer des monstres/humains
		* Monstre et Humain : car ce sont les trucs créées

	* et donc on ne manipulera pas Gobelin, Troll, ... Héros, PNJ car ils sont cachés !!!
	* et donc on ne manipulera pas MonstreFactory et HumainFactory car ils sont cachés !!!