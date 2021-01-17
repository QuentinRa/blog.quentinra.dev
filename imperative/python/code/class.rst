==============================
Classes et Objets
==============================

Une classe est un ensemble qui représente de manière abstraite (non concrète) quelque chose.
On va grouper dans une classe des attributs : les propriétés de la chose (taille, ...)
et des méthodes (fonctions pour interagir avec la chose).

Un classe est dite abstraite car vous ne faites que déclarer tel objet à telles propriétés
et telles méthodes mais vous ne donnez aucune valeur. On appel instanciation,
la création d'un objet soit une variable dans laquelle vous avez donné des valeurs aux
propriétés de la classe.

.. code:: py

		# déclaration de la classe
		class personne :
		 nom # On a choisi qu'une personne à un nom, aucune valeur par défaut
		 prenom # On a choisi qu'une personne à un prénom, aucune valeur par défaut
		 pays = 'France' # On a choisi qu'une personne à un pays, France par défaut

			# fonction qui affiche personne{nom:NOM, prenom:PRENOM, pays:PAYS} avec des caractères devant
			def tostring(self, spaces):
			 print(indentation+'personne{nom:%s, prénom:%, pays:%s}' % (self.nom, self.prenom, self.pays)

**Utilisation**

.. code:: py

		# création d'un objet
		i = personne()
		i.nom = 'Monnerat'
		i.prenom = 'Denis'
		i.pays = 'France'

		i.tostring('>>>') # appel d'une fonction avec argument