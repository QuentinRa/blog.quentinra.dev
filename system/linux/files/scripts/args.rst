=======================================
Arguments à la ligne de commande
=======================================

Lorsque vous appelez un script :code:`./mon_script`
vous pouvez passer un nombre illimité d'arguments : :code:`./mon_script 1 "15" "salut" coucou`.

.. code:: bash

	# on suppose l'appel suivant
	# ./mon_script premier "15" "salut !" 110016

	# contient le nombre d'arguments
	# donc contient 4
	# on fait généralement un if et on vérifie
	$#

	# nom du programme
	echo $0
	# premier argument
	echo $1 # contient "premier"

	# généralement on stocke dans des variables les $... qu'on va utiliser
	# pour 1. éviter de modifier l'original et 2. parce que c'est plus parlant
	nom_programme=$0 # par exemple

	# pour itérer tous les arguments, on a
	$@ # contient 1 "premier" "15" "salut !" "110016"
	# donc voici un exemple
	for i in "$@"; do
		echo $i
	done