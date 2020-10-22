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

Vous pouvez changer le langage du terminal courant avec :code:`bash`.

**.bashrc**

Le fichier .bashrc est exécuté à chaque création d'un terminal.

Il contient des commandes que vous voulez éviter de faire à chaque fois que vous ouvrez un terminal,
par exemple définir des variables d'environnement, ou encore des raccourcis pour des commandes.

*
	La commande :code:`alias` permet de créer une commande depuis une instruction.

	.. note::

			:code:`alias la=`ls -la`` crée une commande :code:`la` qui fait l'instruction :code:`ls -la`.
* vous pouvez écrire des fonctions comme dans un script (:ref:`bash_sh`).

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

2.3 Environnement
***********************

...

3. Système de fichiers et Permissions
========================================

...

3.1 Chemins
***********************

...

3.2 Utilisateurs et Groupes
*****************************

...

3.3 Permissions
*****************************

...


4. Motifs (glob pattern) et Manipulations de textes
====================================================

...

5. Encodage des entiers
========================================

...

.. _bash_sh:

6. Scripts
========================================

...

7. Processus et signaux
========================================

...

8. Appels systèmes
========================================

...


9. Exercices
================================

.. toctree::
    :name: exercices
    :maxdepth: 1

    Exercices Scripts			      <exercices/scripts>


--------

**Crédits**
	* Denis Monnerat (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)

**Sources**
	* bash
		* https://iq.opengenus.org/bash-bourne-again-shell/
		* https://en.wikipedia.org/wiki/Bash_(Unix_shell)