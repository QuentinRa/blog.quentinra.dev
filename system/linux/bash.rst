.. _bash:

================================
Bash et Scripts bash
================================

.. warning::

	Ce cours suppose une bonne connaissance de l'architecture linux (voir :ref:`linux`).

	Ce cours est une approche pratique du cours d'architecture linux.

	Les parties de ce cours sont exactement les mêmes que celles du cours de l'architecture
	linux, ce qui vous permet de facilement passer de la théorie à la pratique et inversement.

1. Introduction
================================

Le bash est le langage le plus répandu sur les machines UNIX.

Sortit en 1988, il contient de nombreuses améliorations par rapport au Bourne Shell
de 1977.

Quelques points à noter sont :
	* :code:`.bashrc` pour configurer vos terminaux bash
	* les scripts :code:`.sh` (shell) sont généralement écris en bash
	* certaines fonctionnalités du bash : [[]] (()) ... ne sont pas portables (norme POSIX).

2. Terminaux et éditeurs de texte
====================================

2.1 Terminaux
***************

Le Bash (Bourne Again Shell) est généralement le langage par défaut des terminaux
sur vos machines.

Vous pouvez changer le langage du terminal courant en bash avec :code:`$ bash`.

**.bashrc**

Le fichier :code:`~/.bashrc` est exécuté à chaque création d'un terminal.

Il contient des commandes que vous voulez éviter de faire à chaque fois que vous ouvrez un terminal,
par exemple définir des variables d'environnement, ou encore des raccourcis pour des commandes.

*
	La commande :code:`alias` permet de créer une commande depuis une instruction.

	.. note::

			:code:`alias la=`ls -la`` crée une commande :code:`la` qui fait l'instruction :code:`ls -la`.

* vous pouvez écrire des fonctions comme dans un script (:ref:`bash_sh`).

.. important::

	Les changements de votre .bashrc ne sont pas appliqués aux anciens terminaux, sauf
	si le "sourcez" : :code:`$ source ~/.bashrc`.

.. warning::

	Notez que linux propose un paquet :code:`man` pour manuel qui permet d'en apprendre plus sur
	le fonctionnement d'une commande.

	Donc par reflexe si vous ne connaissez pas quelque chose (ex: la commande :code:`ls`) alors testez
	:code:`$ man ls`.

2.2 éditeurs de texte
***********************

Vous aurez besoin d'un éditeur de texte pour modifier un fichier.

Nombreux sont cités dans le cours. Leur utilisation est la suivante, pour la plupart :

.. code:: bash

	vim fichier # crée fichier s'il n'existe pas, puis ouvre le fichier
	nano fichier # pareil
	pluma fichier # pareil
	emacs fichier # pareil

.. note::

	Un cours sur vim est disponible :ref:`vim`.

3. Système de fichiers et Permissions
========================================

3.1 Chemins
***********************

Commande :code:`ls`
	Permet de voir le contenu d'un répertoire

	| :code:`-l` : affichage de toutes les informations (long)
	| :code:`-a` : affiche les fichiers cachés
	| :code:`-A` : sans . et ..
	| :code:`-s` : affiche la taille
	| :code:`-S` : tri selon taille
	| :code:`-R` : Récursif

Commande :code:`cd`
	Permet de se déplacer

Commande :code:`cat` ou :code:`less`
	Voir le contenu d'un fichier

Commande :code:`mkdir`
	Crée un répertoire

	| :code:`-p : tous les dossier non-existants du chemin son crées

Commande :code:`touch`
	Permet de créer un fichier ou met à jour sa date de modification s'il existe

Commande :code:`mv`
	Permet de déplacer [et renommer] un fichier/dossier

Commande :code:`cp`
	Permet de copier [et renommer] un fichier/dossier

	| :code:`-r` : copier un dossier
	| :code:`-f` : sans confirmation (si destination existe)
	| :code:`-i` : demander confirmation si destination existe

Commande :code:`rm`
	Permet de supprimer un fichier/dossier

	| :code:`-r` : supprimer un dossier et ses sous-dossier (existe aussi :code:`rmdir`
	| :code:`-f` : sans confirmation (si destination existe)
	| :code:`-i` : demander confirmation si destination existe

3.2 Utilisateurs et Groupes
*****************************

Commande :code:`useradd`
	Créer un utilisateur

	| :code:`-g` : assigner groupe
	| :code:`-b` : définir le domicile
	| :code:`-m` : créer le domicile

Commande :code:`groupadd`
	Créer un groupe

Commande :code:`passwd`
	Changer de mot de passe

Commande :code:`deluser`
	Supprimer un utilisateur

Commande :code:`delgroup`
	Supprimer un groupe

Commande :code:`su`
	Changer d'utilisateur

Commande :code:`id`
	info sur un utilisateur, sans argument affiche celle de l'utilisateur actuel

Commande :code:`whoami`
	nom utilisateur session courante

3.3 Permissions
*****************************

Commande :code:`chmod`
	Change les permissions d'un dossier/fichier.

	Vous pouvez utiliser chmod code fichier avec code 751 par exemple.

	Vous pouvez également faire :code:`e[+ ou -]p` avec :code:`e` : u (user), g (groupe), o (others), a (tous) ;
	:code:`+` : donner permissions, :code:`-` : retirer permissions et :code:`p` des permissions : r, w, x

	Exemples: :code:`chmod 700 fichier` (donne rwx à u (user))
	ou :code:`chmod ug+rwx fichier` (donne (car +) rwx à u (user) et g (groupe).

Commande :code:`umask`
	affiche les permissions manquantes par défaut à la création d'un fichier

	:code:`umask` retourne 0026, celà veut dire que les permissions 751 sont celles par défaut.

4. Motifs (glob pattern) et Manipulations de textes
====================================================

...

5. Encodage des entiers
========================================

...

6. Environnement
========================================

On accède à une variable d'environnement, comme une variable normale.

	* :code:`${NOM}` ou :code:`$NOM` pour lire la valeur
	* :code:`NOM=valeur` pour créer/changer la valeur
	* :code:`export NOM=valeur` : change la valeur de cette variable partout

.. _bash_sh:

7. Scripts
========================================

...

8. Processus et signaux
========================================

...

9. Appels systèmes
========================================

...


10. Exercices
================================

.. toctree::
    :name: exercices
    :maxdepth: 1

    Exercices Scripts			      <exercices/scripts>


--------

**Crédits**
	* enseignants à l'IUT de Sénart-Fontainebleau
		* Denis Monnerat
		* Luc Hernandez
		* Selma Naboulsi
		* Denis Monnerat
		* Frédéric Gervais
		* Pierre Petrik
		* Luc Dartois
		* Pierre Valarcher
	* enseignants à l'ENSIIE
			* Renaud RIOBOO
			* Christophe MOUILLERON
			* Julien FOREST
			* Ivan Augé
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* bash
		* https://iq.opengenus.org/bash-bourne-again-shell/
		* https://en.wikipedia.org/wiki/Bash_(Unix_shell)
	* commandes
		* https://www.tutorialspoint.com/unix_commands/export.htm
	* scripts
		* https://www.diskinternals.com/linux-reader/bash-script/
		* https://medium.com/sysf/bash-scripting-everything-you-need-to-know-about-bash-shell-programming-cd08595f2fba