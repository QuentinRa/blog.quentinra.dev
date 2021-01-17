==============================================
Exercices Scripts Bash
==============================================

Niveau débutant
***********************

1. Convertisseur d'adresses
----------------------------------

| On récupère le fichier :download:`bin_ipv4_address.dat <../../../assets/system/linux/exercices/bin_ipv4_address.dat>`.

On lit des adresses ipv4, en représentation binaire, à partir d’un fichier
bin_ipv4_address.dat qui contient, disons, pour simplifier, une adresse par ligne. A l’aide
d’un script, on écrit ces adresses, en notation décimale pointée, dans un autre fichier.

1. \
		On écrit un script bin2dot-with-for.sh qui prends deux arguments. Le premier est un fichier contenant
		des adresses ipv4 en représentation binaire. Le deuxième est un fichier qui contiendra
		les mêmes adresses ipv4 mais en notation décimale pointée. On affectera une variable,
		disons addr, successivement à l’aide d’une commande composée for.

.. code:: bash

		$ cat bin_ipv4_address.dat
		10110010111000101000011101110010
		11100101110001010101100101010010
		00110010111001101000010001110010
		$ ./bin2dot-with-for.sh bin_ipv4_address.dat
		Usage: ./bin2dot-with-for.sh <SRC_FILE> <DEST_FILE>
		$ ./bin2dot-with-for.sh bin_ipv4_address.dat dot_ipv4_address.dat
		$ cat dot_ipv4_address.dat
		178.226.135.114
		229.197.89.82
		50.230.132.114
		$ cat >> bin_ipv4_address.dat
		11110000111111110000000010101010
		$ cat bin_ipv4_address.dat
		10110010111000101000011101110010
		11100101110001010101100101010010
		00110010111001101000010001110010
		11110000111111110000000010101010
		$ ./bin2dot-with-for.sh bin_ipv4_address.dat dot_ipv4_address.dat
		dot_ipv4_address.dat exists. Overwrite? Yes/No --> Yes
		$ cat dot_ipv4_address.dat
		178.226.135.114
		229.197.89.82
		50.230.132.114
		240.255.0.170

2. \
	On écrit un script bin2dot-with-read.sh, qui a exactement les mêmes arguments que
	bin2dot-with-for.sh, qui se comporte exactement comme bin2dot-with-for.sh,
	en utilisant les arguments exactement comme le fait bin2dot-with-for.sh, mais qui
	affecte la variable addr par une commande composée while et la commande read.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<scripts/d1>

| :code:`[TAG] IUTSF ASR TP13 2018 S1`

2. Tables de multiplications
-----------------------------------

On écrit le script mult_mat.sh qui utilise deux arguments numériques entiers positifs
ARG1, ARG2. Il affiche sous forme de matrice la table de multiplication de
{ARG1, ARG1+1,...,ARG2} par {ARG1, ARG1+1,...,ARG2} :

.. code:: bash

		$ ./mult_mat.sh 7
		Usage: ./mult_mat.sh <NUM_ARG1> <NUM_ARG1>
		$ ./mult_mat.sh 7 11
		49 56 63 70 77
		56 64 72 80 88
		63 72 81 90 99
		70 80 90 100 110
		77 88 99 110 121

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<scripts/d2>

| :code:`[TAG] IUTSF ASR TP13 2018 S1`

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

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<scripts/s1>

| :code:`[TAG] IUTSF ASR TP14 2018 S1`

2. Bases et scripts
---------------------

Écrire un script check-data.sh qui prend 3 paramètres à la ligne de commande. Le
premier est un fichier contenant des représentations ; une représentation par ligne du
fichier. Le deuxième paramètre du script est un nombre entier entre 2 et 36. Le script
écrit dans le fichier donné en troisième argument, pour chaque représentation dans le
fichier donné en premier argument, la liste des digits non conformes à la base donnée en
deuxième argument.

Voici le comportement attendu du script :

.. code:: bash

	$ ./check-data.sh
	Usage: ./check-data.sh <STRINGS_REPRESENTATIONS_FILE> <radix> <REPORTS_FILE>
	$ ./check-data.sh none.dat 3 reporting_file.dat
	none.dat does not exist or is not regular.
	$ cat strings_representations.dat
	101
	1011011
	12010
	11011201040
	24A5204
	15E12A122G84K48
	493B6H
	789810924
	$ ./check-data.sh strings_representations.dat 37 reports_file.dat
	The radix is a decimal between 2 and 36.
	$ ./check-data.sh strings_representations.dat 2 reports_file.dat
	$ cat reports_file.dat
	101 :
	1011011 :
	12010 : 2
	11011201040 : 24
	24A5204 : 24A524
	15E12A122G84K48 : 5E2A22G84K48
	493B6H : 493B6H
	789810924 : 7898924
	$ ./check-data.sh strings_representations.dat 17 reports_file.dat
	File reports_file.dat exists. Overwrite? Yes/No --> Yes
	$ cat reports_file.dat
	101 :
	1011011 :
	12010 :
	11011201040 :
	24A5204 :
	15E12A122G84K48 : K
	493B6H : H
	789810924 :

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<scripts/s2>

| :code:`[TAG] IUTSF ASR TP14 2018 S1`

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

| :code:`[TAG] ENSIIE OS TP3 2020 S1`

-----

**Crédits**
	* Selma NABOULSI (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)