=======================================
Boucles et lecture à la console
=======================================

Boucles
------------

.. code:: bash

	# boucle for, pas à la norme Posix donc utiliser in for i in sed
	for (( i = 0; i < 10; i++ )); do
	 # statements
	done

	# i va contenir à chaque itération
	# elements peut être
	# - une string
	# - un ensemble de strings séparés par des espaces
	# - `seq 0 10` de 0 à 10
	# vous pouvez mettre plusieurs trucs après in
	#
	for i in elements; do
	 # code
	done

	# les [[ ne sont pas à la norme POSIX donc vous pouvez les retirer
	while [[ condition ]]; do
	 # statements
	done

	# Ceci est un exemple : vous pouvez rediriger l'entrée ou la sortie de la déclaration while
	# ici $1 sera lu par while, sachant que l'élément suivant ne pourra pas lire ce qui a été déjà lu (donc pas de reset)
	# vous pouvez également rediriger tous les affichages de la boucle avec un > f1 à la fin
	#
	# bien sur ici f1 est une représentation pour un flux, vous pouvez donc mettre un fichier etc.
	#
	while ...; do
	 # code
	done < f1

Lecture
------------

Vous pouvez vouloir lire des données de l'utilisateur (on connait déjà echo/print pour afficher).

Commande :code:`read x ...`
	Vous pouvez mettre des variables après read (x, y, ...). read va stocker
	le premier mot dans la première variable, le second dans le deuxième etc. Si vous n'avez pas une variable
	pour chaque mot, alors read va stocker tout ce qui reste dans la dernière variable que vous avez déclaré.

	On rappelle CTRL-D pour arrêter la saisie si besoin.

.. code:: bash

	# lis à la console et affiche le tout dans lecture.txt en utilisant une boucle while
	while read x; do
	 echo $x
	done > lecture.txt