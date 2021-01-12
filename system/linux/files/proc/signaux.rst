============================
Signaux
============================

Les signaux sont des suites de touches qui sont réceptionnées par la session au premier plan (voir
ci-après pour session et arrière plan) et provoquent l'exécution d'une fonction par le processus.

Il y en a 34.

	* :code:`CTRL-C` (signal SIGINT) : exit donc met fin au processus
	* :code:`CTRL-Z` (signal SIGTSTP) : suspend donc met fin à une action (saisie, ...)

.. hint::

	:code:`CTRL-D` n'est pas un signal, il s'agit de EOF (End Of File) donc l'arrêt donc provoque
	l'arrêt d'une saisie.