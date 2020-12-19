=============================================
4. CyberSécurité - ReverseEngineering
=============================================

Assembleur
	Un programme est converti via un compilateur dans le langage de la machine (dit binaires)
	sur laquelle il est exécuté.

	L'assembleur (fichier :code:`.s`)
	est un langage utilisant des instructions propre à une catégorie de machines (machines Intel, ...).

	Vous avez un cours sur l'assembleur, malheureusement c'est un cours sur l'assembleur ARM mais c'est très similaire.

	L'objectif du ReverseEngineering est de trouver le code qui a donné les fichiers binaires.

	radare2
		Il s'agit d'un framework qui convertit un binaire en langage assembleur.

		Utilisation : :code:`r2 -d ./a.out` (a.out correspond au fichier exécutable)

		Une fois dans le mode d'analyse

			* :code:`aa` : analyser le programme (peut être long)
			* :code:`?` : affiche l'aide
			* :code:`...?` : affiche l'aide de la commande ...
			* :code:`afl | grep main` : trouver le main/le point d'entrée (entrypoint) du programme
			* :code:`pdf @nom` : affiche la fonction nom (par exemple main), @nom optionnel

				* première ligne avec l'appel de la fonction
				* x lignes de la forme :code:`; var ...` qui correspondent aux variables de la fonction
				* ensuite les lignes avec les instructions, et un petit b s'il y a un breakpoint

			* :code:`db memory_address` : place un breakpoint (stoppe l'exécution)
			* :code:`dc` : lance le programme
			* :code:`px @memory-address` : voir le contenu d'une adresse (donc valeur d'une variable)
			* :code:`ds` : avance d'une instruction
			* :code:`dr` : voir les valeurs de tous les registres
			* :code:`ood` : relancer le programme
