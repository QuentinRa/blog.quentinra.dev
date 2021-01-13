==============================================
Introduction
==============================================

Niveau débutant
***********************

1. Je découvre mon environnement le plus proche
----------------------------------------------------

On attends que vous donniez les commandes associées aux actions
et que vous les expliquez.

1. De quel utilisateur s’agit-il dans la session courante ?

2. Quel système d’exploitation, quel noyau, quel type de machine ai-je entre les mains ?

3. Dans quel répertoire suis-je positionné(e) juste après la connexion, appelé domicile/home ? (indice: voir la variable $HOME)

4. Que contient mon répertoire domicile ?

5. Que contient le répertoire /etc/ ?

6. Quel est mon répertoire de travail ?

7. Donnez le commande pour se placer dans /etc/. Quel est mon répertoire de travail maintenant ?

8. Donnez le commande la plus courte pour retourner au domicile

Commandes utiles : whoami, id, uname, ls, echo, man, pwd, cd, printenv

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<begin/d1>

| :code:`[TAG] IUTSF ASR TP1 2018 S1`

2. Manipulation de fichiers
-------------------------------------

.. code:: none

		~/
		|
		|->ASR/
		| |
		| |->TP1/
		| | |
		| | |->AA/
		| | | |
		| | | |->DIR1/
		| | | | |
		| | | | |->DIR11/
		| | | | |->fi111
		| | | | |->.fi112
		| | | |->DIR2/
		| | | | |->fi21
		| | | |
		| | | |->DIR3/
		| | | | |->fi31
		| | | | |->fi32

1. Sans quitter mon domicile, je crée dans mon domicile le plus long chemin
ASR/TP1/AA/DIR1/DIR11/ de l’arborescence suivante, par une seule ligne de commande

2. Je me place dans ~/ASR/TP1/et sans bouger de cette position, je crée le reste de
l’arborescence.

3. Sans quitter ~/ASR/TP1/ :

		a. Je consulte le contenu du répertoire DIR3/, puis celui du répertoire DIR11/
		b. Je copie fi31 de DIR3/ vers DIR2/ Je consulte...
		c. Je copie fi31 de DIR3/ vers DIR1/ en appelant la copie fi11 Je consulte...
		d. Je fais une copie de fi31 dans DIR3/ en appelant la copie fi31cp Je consulte...
		e. Je déplace fi31 de DIR3/ vers DIR11/ Je consulte...
		f. Je renomme fi31cp en fi31 Je consulte...
		g. Je renomme AA/DIR3/fi32 en AA/DIR1/DIR11/fi113 Je consulte...
		h. Je copie toute l’arborescence AA/ dans ~/ASR/TP1/ en appelant la copie BB Je consulte...

4. Je me place dans ~/ASR/TP1/BB/DIR1/DIR11/ et je veux obtenir le AA de départ. Donnez les commandes à faire.

5. Je retourne à ~/ASR/TP1/, et je supprime DIR2/ de AA/ Je consulte...

Commandes utiles : mkdir, touch, mv, cd, cp, ls, rm

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<begin/d2>

| :code:`[TAG] IUTSF ASR TP1 2018 S1`

3. Commandes et exécutables
--------------------------------

On suppose fi21 créé dans l'exercice 2 sinon il faudra le créer. Vous devez commenter
chaque action et donner la commande associée.

1. Je me place dans mon domicile, je tape fi21

2. Je consulte la valeur de la variable d’environnement PATH

3. En restant dans mon domicile, je tape ./fi21

4. En restant dans mon domicile, je recommence en donnant le chemin complet vers fi21

5. Je me place dans DIR2 et je tape fi21

6. Je reste dans DIR2 et je tape ./fi21

7. J'ajoute la permission "x" au fichier fi21 et je tape ./fi21

8. Je place la commande pwd dans le fichier fi21 et je tape ./fi21

Commandes utiles : cd, echo, printenv, chmod

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<begin/d3>

| :code:`[TAG] IUTSF ASR TP1 2018 S1`

-----

**Crédits**
	* Selma NABOULSI (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)