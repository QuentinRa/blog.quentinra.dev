.. _language-c-advanced:

================================
Langage C - avancé
================================

.. warning::

	Cette partie est complémentaire de du tutoriel
	en C et contient des outils et connaissances sur des sujets pas forcément plus compliqués
	mais que vous n'allez pas forcément avoir besoin de connaitre pour savoir faire du c.

1. Débogueur (GDB)
=============================

Débogueur (GDB) : compiler avec l’option -g puis saisir la commande gdb a.out

Une fois dans la console GDB, voici les commandes

================== ================================================================================================================================
Commande           Explication
================== ================================================================================================================================
run                lance l'exécutable (jusqu’à un breakpoint/fin)
b x ou break x     met une pause (breakpoint) au point x (L’instruction actuellement affiché et la prochaine qui sera exécutée)
p ... ou print...  affiche une expression/variable
p[s]@x             pour afficher x cases d'un tableau depuis s
l ou list          liste 10 lignes
step               avance de une ligne
bt ou backtrace    affiche la pile des appels (tout ce qui est mis en attente car ils ont besoin du résultat d’une autre fonction pour continuer)
c ou continue      reprends l’exécution
q                  quitter
================== ================================================================================================================================

2. Makefile en c
=============================

Un makefile est un fichier regroupant toutes
les commandes à faire pour compiler votre projet (ici en c).

L'apport pratique est que tous les fichiers ne sont pas recompilés
à chaque fois, seulement ceux qui ont changé.

.. toctree::

	Syntaxe C d'un MakeFile <advanced/makefile>

3. Réseau
=============================

Il est recommandé (voir obligatoire) d'avoir une idée de ce qu'on entends par réseau
(donc connaitre ce qu'est qu'une adresse IP, un port, un protocole, ...).

.. toctree::
	 :maxdepth: 2

			Rappel de vocabulaire         <advanced/net/rappel>
			Le principe                   <advanced/net/principe>
			Les fonctions                 <advanced/net/fonctions>

4. Processus
==========================================

...

5. Threads et concurrence
==========================================

...

|

------

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
	* aucune