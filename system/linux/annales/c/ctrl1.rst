================================================
1. Contrôle 2018 ASR
================================================

**Exercice 1**

Un utilisateur **sans privilèges** soumet les lignes de commandes ci-après.
Indiquez les réponses du système ainsi que les éventuelles modifications dans le système de fichier.

Énoncé :

.. code:: bash

		$ ls -l
		-rw-r- -r- -  1 selma teachers     20 oct 4 11:03 cif
		drwxr-xr-x 2 selma teachers 4096 oct 4 11:02 DIR/
		$ cat cif
		This is a great day !
		$ ls -l DIR/
		-rw-r- -r- -  1 selma teachers     19 oct 4 11:02 fic

(a)	cp cif /
(b)	cat cif | cp DIR/
(c)	less DIR/fic > log.txt && wc -l cif
(d)	tail cif || mv DIR/ 2> gol.txt
(e)	cp DIR/fic 2>> gol.txt | wc -l

**Exercice 2**

Pour chacune des lignes suivantes, on indiquera ce que l’on cherche à faire
et le résultat obtenu.

(a)	:code:`cat DIR/*[[ :lower :]] ?[[ :digit :]].?`
(b)	:code:`mv   ?*5   ../5?[[ :upper :]]*    /DIR`

**Exercice 3**

Sans aucun calcul intermédiaire, on convertit le nombre décimal 6072 en base 15 en donnant le détail du calcul.

**Exercice 4**

En expliquant la démarche, donner la représentation des entiers non signés suivant dans la base 16.
:code:`(11100100111)_2 ; 026376`
