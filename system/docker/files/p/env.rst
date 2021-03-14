==============================
Variables d'environnement
==============================

Il est possible de créer/modifier des variables d'environnement [#1]_

.. code-block:: bash

	# déclaration
	ENV variable /home #ou
	ENV variable=/home

	# utilisation
	WORKDIR ${variable}
	WORKDIR $variable

	WORKDIR ${variable:-default} # si la variable n'existe pas, alors la valeur default est prise
	WORKDIR ${variable:+unset} # si la variable existe, alors elle sa valeur est supprimée

.. [#1]
	PATH est une variable d'environnement, contenant tous les endroits susceptibles d'être intéressant à regarder
	lorsque vous cherchez à faire quelque chose.

	Par exemple si vous utilisez la commande ls : le shell regarde dans le path s'il existe une tel commande,
	trouve /bin/ls et l'exécute.