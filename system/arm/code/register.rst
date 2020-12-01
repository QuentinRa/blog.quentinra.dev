============================================
2. Coder en ARM - Registres
============================================

Toutes les opérations se font en manipulant des registres. Vous stocker des variables dans des registres et appelez des appels
système ou transmettez des variables à des fonctions

	*	les registres r0-r6 (inclus) et r8-r10 (inclus) sont utilisés pour stocker des valeurs.
	*	le registre r7 contient la valeur de l'appel système
	*	le registre r12 contient ip (Intra Procedural Call)
	*	le registre r13 contient sp (Stack Pointer)
	*	le registre r14 contient lr (Link Register)
	*	le registre r15 contient pc (Program Counter)

Rappel sur les registres spéciaux

	* :code:`pc` : correspond à un registre qui contient l'instruction exécuté.
	* :code:`lr` : correspond à un registre qui contient la prochaine instruction à exécuter.
	* :code:`sp` : correspond au registre contenant la pile des valeurs des précédents instructions
	* :code:`ip` : ...