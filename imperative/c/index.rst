.. _language-c:

================================
Langage C
================================

| :math:`\color{grey}{Version \ 0.1.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 22/11/2020}`

.. note::

	Si le C est votre premier langage, lisez la documentation d'introduction
	au C (ici: :ref:`c_initiation`).

1. Introduction
================

Le langage C est un langage s'exécutant principalement sur des machines
sous UNIX mais pouvant s'exécuter sous windows si les bonnes librairies sont installées.

On considère donc que vous savez utiliser un terminal et tapper une commande. Un fichier
:code:`c` ressemble à quelque chose comme ça. Le nom du fichier n'a pas d'importance.

.. code:: c

	// ici on importe des librairies
	#include<stdio.h>
	#include<stdlib.h>

	// ici on déclare une fonction main, la fonction principale
	int main(int argc, char *argv[]){
			printf("Hello World"); //affiche dans la console
			return EXIT_SUCCESS; //travail terminé sans erreurs
	}

Pour compiler un fichier .c, on peut utiliser gcc. Par défaut cela crée un fichier
:code:`a.out`, qui est un fichier exécutable donc doit être appelé :code:`./a.out`.
C'est la fonction :code:`main` qui est exécuté lors que vous appelez :code:`./a.out`.

.. code:: bash

		gcc file.c #donne un fichier a.out
		./a.out # exécute le code

		#compiler les .h et plusieurs .c
		gcc -c file1.c file2.c file2.h
		gcc -o files.out file1.o file2.o #after -o, nom de l'exécutable
		./files.out
		./files.out <argument> <argument> #Arguments passés à la fonction main

2. Spécificité du C
============================

Cette partie contient un synthèse générale du c.
Vous aurez plus de détails dans les parties suivantes.

.. toctree::
		:maxdepth: 1

		Les Types et le casting       <notions/type>
		Structures and symboles       <notions/structures>
		Librairies                    <notions/libraries>
		Notions d'adresse             <notions/address>
		Afficher un résultat          <notions/print>

3. Coder en C
==================================

La fonction :math:`main` est appelée à l'exécution et execute le code
dedans, puis retourne un résultat avec return généralement : 0 (ok) et 1 (problème).

La déclaration d'une variable se fait avec :code:`type nom_variable;` ou :code:`type nom_variable = valeur;`.
Si vous ne donnez pas de valeur, alors la compilateur va donner une valeur par défaut (généralement
0 si la variable est un entier etc...).

Une instruction finit toujours par un :code:`;`.

Bloc
	Il s'agit de la structure la plus basique, un bloc commence par { et finit par }.

	Toutes les variables déclarées dans le bloc n'existent pas en dehors.

	Le code dans un bloc est indenté de 1 tabulation (4 espaces) généralement.

.. code:: c

	//programme fait (a+b)^2 avec a=5 et b=6 puis affiche le résultat
	int main(void) {
	 int a = 5;
	 int b = 6;
	 int r;
	 r = a+b;
	 r *= r; // pareil que r = r * r; ou r = (a+b) * (a+b)
	 print("r=%d", r);
	 return EXIT_SUCCESS; //constante qui vaut généralement 0 (ok)
	}

4. Fonctions
==================================

...

5. Fichier .h (en-tête ou header)
=====================================

...

6. Tableaux en C
===================

...

7. Adresses
==========================

...

8. Autres notions
==========================

Voici quelques notions diverses

.. toctree::
		:maxdepth: 1

		Tris en C                   <more/tris>
		Récursivité en C            <more/recursive>
		Piles, Files et Listes      <more/manage>
		Structures                  <more/structures>

9. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

Resources associées au cours

.. toctree::
    :maxdepth: 3

	Langage C - initiation <initiation>
	Langage C - avancé <advanced>

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