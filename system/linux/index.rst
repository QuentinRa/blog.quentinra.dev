.. _linux:

================================
Architecture Linux
================================

| :math:`\color{grey}{Version \ 2.1.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 12/01/2021}`

Ce cours est une approche principalement théorique de linux, vous y trouverez notamment
des explications sur

	* entiers signés/non signés
	* chemins
	* appels systèmes
	* Permissions
	* etc.

1. Introduction à Linux
=========================

Linux est gratuit (la plupart des distributions), léger, généralement plus performant et open-source
(vous avez le code-source, et pouvez le modifier et vous savez ce qu'il y a dedans).

La plupart des serveurs tournent sous Linux, et de nombreux ordinateurs sont également sous Linux pour les raisons
plus hautes.

.. toctree::
	 :maxdepth: 1

		Choix de la version et installation   <files/base/install>
		Explication rapide du fonctionnement  <files/base/intro>

2. Vue générale du système informatique :code:`technique`
===========================================================

On considère 5 couches de la plus proche a le plus loin de l'utilisateur on a

	1. utilisateur : application
	2. utilitaires & processus système
	3. Langage de Haut Niveau
	4. Langage d'assemblage (code propre à une catégorie de machines)
	5. Matériel

Pour la couche 3 : cours C++, Python, ... Pour la couche 4 : cours Assembleur ARM.

On appelle appel système, un processus (=script/~commande) qui effectue au niveau
utilisateur du code noyau (couche matérielle). Ainsi, un programmeur peut créer une application
plus performante sur sa machine, mais qui en revanche ne marchera que sur les machines ayant le
même type de noyau, en utilisant les appels systèmes. En voici quelque-uns : write, read, fork, exit,
close, open, ...

3. Permissions et chemins
==========================

Linux utilise 4 groupes de permissions : root (administrateur sous windows),
user, group et other.

Un considère un chemin quelque chose comme :code:`/etc/passwd` pour décrire
le chemin vers la location d'un dossier/fichier.

.. toctree::
	 :maxdepth: 1

		Comprendre la notion de chemin  <files/perms/path>
		Gestion des permissions         <files/perms/gestion>
		Variables d'environnement       <files/perms/env>

4. Motifs (glob pattern) et Manipulations de textes
========================================================

Les motifs vous permettent de faire des recherches d'un fichier
ou de remplacer quelque chose etc. mais sur un ensemble de départ
inconnu (par exemple dire vaguement, tous les fichiers qui commencent par a).

Par Manipulations de textes, on entends l'utilisation d'expression régulières (regex)
pour modifier facilement un fichier si un pattern est trouvé.

.. toctree::
	 :maxdepth: 1

		Motifs (glob pattern)  <files/glob/motifs>
		Expression régulières  <files/glob/er>

Les motifs/regex sont utilisés partout :
	* vous recherchez un fichier dont vous ne connaissez que l'extension par exemple
	* vous voulez obtenir tous les fichiers (*)
	* vous voulez modifier les lignes d'un fichiers qui sont d'un certain format.

5. Encodage des entiers et flottants :code:`technique`
=======================================================

Voici des explications sur comment une machine unix manipule un entier ou un flottant. Les termes
Big Endian et Little Endian (bits poids fort/faible) sont expliqués dans la première partie.

.. toctree::
	 :maxdepth: 1

		Processeur (familles, encodage,...)   <files/enc/proc>
		Encodage des entiers signés           <files/enc/int>
		Encodage des entiers non signés       <files/enc/uint>
		Manipulation des entiers              <files/enc/use>
		Encodage des flottants                <files/enc/float>

6. Processus et Signaux
================================

Un processus est une sorte de boite crée lorsque vous exécutez une commande.

Il contient entre autres

	* code (à exécuter)
	* l'environnement d'exécution : nom du programme, fichiers ouverts, droits, ...
	* des données (pile, tas, variables)

Chaque processus a un identifiant unique, appelé PID.

.. toctree::
	 :maxdepth: 1

		Hiérarchie                        <files/proc/born>
		Ordonnancement                    <files/proc/ordo>
		Signaux                           <files/proc/signaux>
		Session et terminaux              <files/proc/session>
		Session et premier/arrière plan   <files/proc/plan>

7. Scripts
===================================

Les scripts sont des fichiers qui contiennent des commandes, on peut voir ça comme un programme
qui une fois lancé va exécuter des instructions.

Un script peut contenir des fonctions (des bouts de code répétitif qui ont été factorisés
pour éviter de recopier du code). On appelle ces fonctions des :code:`buildin`.

.. note::

	On appelle une :code:`buildin` de la même façon que l'on appelle une commande, soit
	:code:`buildin [[-option] [argument]]`.

Les scripts demande la permission :code:`x` pour être exécutés, ou vous pouvez appeler
un langage en lui donnant un entrée le script : :code:`$ bash < script.sh` avec :code:`bash` ici
le langage dans lequel exécuter le script.

La première ligne d'un script défini le langage du script, pour un script bash, la première ligne
serait

.. code::

	#!/bin/bash
	#
	# usage: utilisation du script
	#
	# détails
	#
	# ...

	ici votre code

8. Exercices
======================

.. toctree::
	 :maxdepth: 1

		Introduction et utilisation générale    <exercices/begin>
		Utilisateurs et Permissions        			<exercices/perms>
		Motifs et expression régulières 			  <exercices/motifs>
		Processus          			                <exercices/proc>
		Recherche          			                <exercices/find>
		Scripts			                            <exercices/scripts>
		Appels systèmes                         <exercices/sys>
		Bases  (2, 8, 16, ...)                  <exercices/bases>
		Autres Commandes (expr, sort, ...) 	    <exercices/more>
		Annales                                 <annales/index>

-----

**Crédits**
	* enseignants à l'IUT de Sénart-Fontainebleau
		* Denis MONNERAT
		* Luc HERNANDEZ
		* Selma NABOULSI
		* Frédéric GERVAIS
		* Pierre PETRIK
		* Luc DARTOIS
		* Pierre VALARCHER
	* enseignants à l'ENSIIE
			* Renaud RIOBOO
			* Christophe MOUILLERON
			* Julien FOREST
			* Ivan AUGÉ
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://en.wikipedia.org/wiki/Daemon_(computing)
	* https://systemd.io/
	* https://www.computerhope.com/unix/signals.htm
	* https://www.linuxtricks.fr/wiki/signaux-unix-unix-signals
	* https://gchq.github.io/CyberChef/