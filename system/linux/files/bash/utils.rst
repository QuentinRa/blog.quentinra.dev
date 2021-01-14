===================
Utilitaire de dev
===================

S'il vous manque des pages man vous pouvez
télécharger le version développeur : :code:`aptitude install manpages-dev`.

:code:`build-essential` permet d'installer make, gcc, etc. soit pleins d'outils
que vous risquez d'utiliser en tant que programmeur.

Commande :code:`gcc` : permet de compiler un executable
	| :code:`-o <nom>` : renommer le a.out créé
	| :code:`-g` : ajoute des informations au a.out, généralement si vous allez utiliser :code:`gdb` derrière
	| :code:`-lm` : pour utiliser :code:`math.h`
	| :code:`-lpthread` : pour utiliser :code:`threads.h` (attention, il est recommandé d'utiliser :code:`-pthread`).
	| :code:`-c` : créer fichiers .o (donc objets)
	| :code:`-MM` : donne les dépendances
	| :code:`-ansi` : obsolète, vérifie que le code suit le standard 89
	| :code:`-Wall` : avertissements
	| :code:`-pedantic` : check qui affiche des erreurs de compilations si le code n'est pas conforme
	| :code:`-E` : fichiers intermédiaires