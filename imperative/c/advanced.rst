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

Un processus est un programme + tout l'environnement dans lequel il s'exécute.

pid
	Il s'agit de l'identifiant d'un processus, il est utilisé
	par toutes les fonctions qui permettent de toucher au processus (tuer, attendre, ...).

On crée généralement des processus pour déléguer un travail à faire parallèlement
au processus principal (le main).

On peut communiquer entre des processus en utilisant des signaux ou des canals
appelés tubes.

.. toctree::
	 :maxdepth: 1

		Processus           <advanced/process/index>
		Recouvrement        <advanced/process/exec>
		Signaux             <advanced/process/signals>
		Tubes               <advanced/process/pipe>

5. Threads et concurrence
==========================================

Un thread est un processus léger. Contrairement à un processus,
il est exécuté dans un processus et donc son environnement est
celui du processus (mêmes variables....).

Le principe est que vous allez donner une tâche à un thread,
dont le code est dans une fonction. Une fois
le thread lancé, le code est exécuté. Le thread s'arrête
si le processus meurt ou la fonction est terminée.

Il est possible que plusieurs Thread essayent d'écrire/lire
une même variable en même temps : cela pose un problème de concurrence
car on n'a aucune garantie si l'écriture s'est bien passée ou un thread
n'a pas lu une mauvaise valeur.

Attention ! La librairie des threads doit être chargée à la compilation
avec l'option :code:`-lpthread` de gcc.

.. toctree::
	 :maxdepth: 1

		Threads            <advanced/threads/index>
		Concurrence        <advanced/threads/mutex>
		Sémaphores         <advanced/threads/sema>

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