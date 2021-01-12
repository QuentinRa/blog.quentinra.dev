.. _linux:

================================
Architecture Linux
================================

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