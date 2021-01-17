==============================
Chaines de caractères
==============================

Une string est une chaine de caractères soit une suite de caractères (symboles).

**Déclarations**

.. code:: py

		variable = "une string" # vous devez échapper les " qui ne sont pas le " final avec \"
		variable = 'une string' # vous devez échapper les ' qui ne sont pas le ' final avec \'
		variable  = variable+variable # concatenation

**Fonctions utiles**

.. code:: py

		# taille
		len(string)

		# nombre d'occurrence de 'str' dans string
		string.count('str')

		# retourne la première position de pattern dans str
		string.index('pattern')

		# met une string en majuscules
		string.upper() # lower for minuscules

		# retourne True si une chaine commence parce str
		string.startswith('str')

		# retourne True si une chaine finie parce str
		string.endswith('str')

		# découpe une chaine selon un pattern
		string.split('str')

**Découpage**

Il est possible de découper une String/un tableau pour en faire une plus
petite, l'inverser etc...

.. code:: py

		str[3:7] # sous chaine du 3ème au 7ème caractère depuis 0
		str[3:7:2] # " cependant, on prends un caractère tous les 2 caractères
		str[:5] # les 5 premiers
		str[-5:] # les 5 premiers depuis la fin
		str[::-1] # inverse