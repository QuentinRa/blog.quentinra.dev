================================================================
2. Spécificité du C - Librairies
================================================================

Une librairie est un fichier qui contient pleins de fonctions, constantes
(et variables dites globales).

Il existe deux types de librairies :

	* les librairies système importées comme suit : :code:`#include <math.h>`
	* vos librairies importées comme suit : :code:`#include "math.h"`

Les fichiers .h (fichier d'en tête) sont des fichiers
dans lesquels on déclare des fonctions (signature) et des constantes.
Ils sont associés à un .c du même nom qui contient le code des fonctions. Plus
de détails dans la section correspondante.

.. note::

	Une fonction qui retourne un entier, retourne généralement -1 pour dire qu'il y a eu
	une erreur. Une fonction qui retourne une adresse retourne généralement NULL pour dire
	qu'il y a eu une erreur.

Librairie standard

.. code::

	#include<stdlib.h>

	rand() //nombre aléatoire, rand()%(max-min)+min+1 donne les valeurs ]min, max[.
	// utiliser srand(time(NULL)); de time.h pour des vraies valeurs aléatoires

	system(command) //exécute une commande system, comme clear ou gunzip

Librairie des lectures/écriture dans un fichier/flux (ex: terminal)

.. code:: c

	#include <stdio.h>

	printf(string, args) //types d'arguments spéciaux: %o, %x, %p, %zu
	// formatage: %xTYPE, %vxTYPE, %.xTYPE, %.vxTYPE avec x le nombre de
	// chiffres à afficher et v la valeur a mettre s'il manque des chiffres

Librairie des fonctions de maths

.. code:: c

		// librairie des fonctions de maths
		#include<math.h> // attention, option -lm à la compilation donc gcc ... -lm

		// arrondir
		round(), ceil(), trunc(), fabs(), floor(),
		// fonctions ln, racine, puissance, exp, log
		log(), sqrt(x), pow(x, y), exp(), log10(),
		// fonctions trigonométriques
		sin(), cos(), tan(), asin(), acos(), atan(),
		// constantes : euler et pi
		M_E, M_PI

Librairie des chaines de caractères

.. code:: c

	#include<string.h>

	strlen(), strcmp()
	strcpy(), strcat(),

	strtol(string, erreur, base) // convertit un char* en long (ou int/double/... si casté)

	strtoul, strtod // variantes de strtol pour unsigned et réels

Autres

.. code:: c

	// termine un processus, donc quitte généralement le programme
	exit(int code);