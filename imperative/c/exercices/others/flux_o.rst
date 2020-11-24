================================
Flux d'octets
================================

Niveau débutant
***********************

1. Records
-------------------

Le fichier :download:`top10 <../../../../assets/imperative/c/exercice/files/top10>` contient la liste des dix meilleurs scores
d'un jeu video ainsi que le sigle des joueurs qui les ont obtenus.

Les scores sont des entiers au format int little-endian. Les sigles sont formés de trois caractères ASCII tous imprimables.
Dans le fichier il y a d'abord le score du meilleur joueur, puis son sigle, puis le score du second meilleur joueur,
puis son sigle, et ainsi de suite.

Écrivez un programme qui lit ce fichier puis affiche le «Hall of Fame».

.. code:: bash

		bob@box:~$ ./a.out
		004867123 BOB
		004854739 <O>
		002587684 \o/
		002483729 KIX
		001982491 :-)
		001444726 ALF
		000758162 LOL
		000758161 T_T
		000048214  GG
		000000001 @_@

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/d1>

| :code:`[TAG] IUTSF APL S1 TP18 2019`

2. Challenger
-------------------

Écrivez un programme qui prend en argument sur la ligne de commande un score et un nom et qui met à jour le fichier top10 de
l'exercice précédent.

.. code:: bash

		bob@box:~$ ./a.out 1581427 '>_>'
		004867123 BOB
		004854739 <O>
		002587684 \o/
		002483729 KIX
		001982491 :-)
		001581427 >_>
		001444726 ALF
		000758162 LOL
		000758161 T_T
		000048214  GG

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/d2>

| :code:`[TAG] IUTSF APL S1 TP18 2019`

3. Copie
-------------------

Écrivez un programme qui copie un fichier sur le modèle de la commande cp.

.. code:: bash

	bob@box:~$ ./a.out cute_overload.gif chaton.gif

Cette commande doit créer un nouveau fichier nommé chaton.gif dont le contenu soit identique à celui de cute_overload.gif.

.. code:: bash

	bob@box:~$ ./a.out -a part2.txt part1.txt

Cette commande doit ajouter le contenu du fichier part2.txt à la fin du contenu préexistant dans le fichier part1.txt.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/d3>

| :code:`[TAG] IUTSF APL S1 TP18 2019`

4. Compteur
----------------

Écrivez un programme qui affiche le nombre de fois qu'il a été exécuté.

.. code:: bash

		bob@box:~$ ./a.out
		14
		bob@box:~$ ./a.out
		15
		bob@box:~$ ./a.out
		16

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/d4>

| :code:`[TAG] IUTSF APL S1 TP19 2019`

5. Image
----------------

Le fichier :download:`image.bin <../../../../assets/imperative/c/exercice/files/image.bin>` contient une image dans un format exotique.
On y trouve :

	* un int représentant la largeur de l'image en pixels,
	* un int représentant la hauteur de l'image en pixels,
	* la couleur du pixel supérieur gauche de l'image,
	* la couleur du pixel immédiatement en dessous,
	* et ainsi de suite, de haut en bas puis colonne par colonne.

Écrivez un programme qui affiche l'image dans une fenêtre graphique.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/d5>

| :code:`[TAG] IUTSF APL S1 TP19 2019`

6. Hexadécimal
----------------

La commande hexdump permet l'affichage d'un fichier à la console, dans le cas où le fichier ne contient pas que du texte.
Chaque ligne contient les valeurs de 16 octets du fichier affichés en notation hexadécimale.

Écrivez un programme qui donne le même résultat que hexdump (sans option).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/d6>

| :code:`[TAG] IUTSF APL S1 TP19 2019`

7. Listes
-------------------

Dans le cadre de cet exercice, une liste est un fichier contenant un ou plusieurs réels au format double little-endian.

Écrivez un programme qui crée une liste en demandant une par une les valeurs à inclure à l'utilisateur.

Écrivez un programme qui affiche une liste.

Écrivez un programme qui vérifie si une liste est croissante.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/d7>

| :code:`[TAG] IUTSF APL S1 TP19 2019`

8. Fusion
-------------------

Écrivez un programme qui prend deux listes croissantes (au sens de l'exercice précédent) et qui crée une troisième
liste croissante formée de l'union des éléments de chaque liste.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/d8>

| :code:`[TAG] IUTSF APL S1 TP19 2019`

Niveau supérieur
***********************

1. Chiffrement
-------------------

Écrivez un programme qui permette de chiffrer/déchiffrer un fichier par la méthode suivante :

	* les octets de rang pair sont complémentés à 1,
	* les octets de rang impair sont remplacés par leur xor avec l'octet précédent.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/s1>

| :code:`[TAG] IUTSF APL S1 TP18 2019`

2. Rectangles
-------------------

Un rectangle est représenté par les coordonnées entières de son coin supérieur gauche et par
ses dimensions entières (largeur et hauteur).

Définissez la structure correspondante. En vous basant sur ce type, écrivez une fonction qui affiche un rectangle,
et une fonction qui demande à l'utilisateur de cliquez deux fois et qui renvoie le rectangle ayant un coin à chaque position cliquée.

Écrivez avec un programme qui permet
à son utilisateur de dessiner autant de rectangles qu'il le souhaite, les uns par dessus les autres.
En appuyant sur une touche, on termine le programme, mais à la prochaine exécution, tous les rectangles dessinés
précédemment devront être encore là.

| :code:`[TAG] IUTSF APL S1 TP18 2019`

3. Image
------------------

Le fichier :download:`image.bin <../../../../assets/imperative/c/exercice/files/image.bin>` contient une image dans un format exotique.
On y trouve :

	* un int représentant la largeur de l'image en pixels,
	* un int représentant la hauteur de l'image en pixels,
	* la couleur du pixel supérieur gauche de l'image,
	* la couleur du pixel immédiatement en dessous,
	* et ainsi de suite, de haut en bas puis colonne par colonne.

Écrivez un programme qui affiche l'image dans une fenêtre graphique.

Modifiez-le pour que la fenêtre contienne seulement le quart inférieur droit de l'image.
Le programme ne devra pas lire dans le fichier d'information dont il n'a pas besoin.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_o/s3>

| :code:`[TAG] IUTSF APL S1 TP21 2019`

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Luc HERNANDEZ (enseignant à l'IUT de Sénart-Fontainebleau)