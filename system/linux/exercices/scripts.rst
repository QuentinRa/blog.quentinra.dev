==============================================
Exercices Scripts Bash
==============================================

Niveau débutant
***********************

aucun

Niveau supérieur
***********************

1. Fonction round
------------------------

Écrire un script :code:`round.sh` qui prends deux arguments :

	* un nombre :code:`n`, qui peut être précédé de + ou -
	* un entier strictement positif :code:`r`

Le script doit alors réécrire le nombre v avec f chiffres après la virgules.

En particulier, vous devez gérer que
	* :code:`n` est bien un nombre (entier ou réel, précédé ou non de +/-).
	* :code:`r` est un entier strictement positif

.. code:: bash

	$ ./round.sh
	usage: <number> <round>
	$ ./round.sh eh 0
	"eh" is not a valid number
	$ ./round.sh 0 -1
	round must be >= 0
	$ ./round.sh 120.3 5
	120.30000
	$ ./round.sh -5.1285 1
	-5.1

Niveau avancé
***********************

1. Auto-encrypted archive
-----------------------------

L'objectif est de créer une archive d'une répertoire donné.
Le fichier généré se décompresse automatiquement lorsque l'archive est exécutée.

.. code:: bash

	$ cat dossier/a
	aaaa
	$ ./shzip.sh dossier.shz dossier
		"$0:DEBUG: arguments ok"
	$ cat ./dossier.shz
	#!/bin/bash

	mkdir dossier
	base64 -d > dossier/a.tmp <<EOF
	YWFhYQ==
	EOF
	chmod 644 dossier/a.tmp

	$ ./dossier.shz
	$ cat dossier/a.tmp
	aaaa

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<scripts/a1>

-----

**Crédits**
	* Selma NABOULSI (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)