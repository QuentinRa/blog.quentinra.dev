===================================
Gestion des permissions
===================================

Les utilisateurs sous Linux sont répartis en 3 groupes :
	* :code:`u` : utilisateur, vous êtes le seul dans ce groupe
	* :code:`g` : groupe, il s'agit de votre "groupe principal"
	* :code:`o` : tous les autres utilisateurs

.. note::

		Pour :code:`g`, vous pouvez par exemple créer un groupe "Famille" ou "Promo-année"
		parce que vous pourrez définir des permissions particulières pour les membres de ce
		groupe (ex: ils peuvent tous lire les dossiers de /pub/cours/ ...).

Les permissions sont
	* `r` : read, sa valeur est `4` (lire un fichier)
	* `w` : write, sa valeur est `2` (modifier dossier/fichier)
	* `x` : execute, sa valeur est `1` (exécuter script ou traverser répertoire)

Assigner des permissions, c'est donner une valeur à chacun des groupes
d'utilisateurs :code:`u`, :code:`g`, :code:`o`.

Si vous assignez u=7 alors vous aurez les droits 4 (read) + write (2) + x (exécuter).

.. note::

	Vous pouvez retrouver la notation 751 pour une permission donc du style chiffre1chiffre2chiffre3 qui signifie
	u=chiffre1, g=chiffre2, o=chiffre3

Il existe un groupe d'utilisateur spéciaux : les `super administrateurs`. Certaines actions
nécessitent des permissions ultra élevées (a.k.a :code:`root`) donc vous devrez
élever vos privilèges (comme le exécuter en tant qu'administrateur sous Windows).
