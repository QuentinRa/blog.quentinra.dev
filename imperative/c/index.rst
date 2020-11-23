.. _language-c:

================================
Langage C
================================

| :math:`\color{grey}{Version \ 1.1.2}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/11/2020}`

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

Déclaration d'une fonction en C

.. code:: c

		// ceci est une fonction qui s'appelle main
		// elle retourne un entier, ici cet entier indique si le travail a été fait sans erreur
		// ou s'il y a eu une erreur
		// Cette fonction a des arguments : argc, le nombre d'arguments passés à la fonction à son
		// appel et argv, un tableau des valeurs des arguments également passés à son appel.
		int main(int argc, char *argv[]){}

		// appel de main (appelé automatiquement en faisant ./a.out)
		int retour = main(2, ["nom du programme", "argument 1"]);

Une fonction peut être utilisée dans une autre fonction,
si elle a été déclarée avant. On parle de **signature** ou de **prototype**.

.. code:: c

		int addition(int); // déclare une fonction
		int main(void){
		 addition(5); // on peut appeler la fonction
		}
		//écris le code d'addition
		int addition(int nombre){
		 return nombre+nombre;
		}

5. Fichier .h (en-tête ou header)
=====================================

Les fichiers d'en-tête sont des fichiers .h dans lequel on déclare des constantes,
des types et des fonctions (prototypes).

Pour utiliser la constante, fonction... dans le code, il suffit d'inclure le fichier .h.
Un fichier .h est généralement associé à un .c du même nom dans lequel on trouve le code des fonctions.

.. code:: c

		// dans votre fichier qui utilise ce .h
		#include "path/.../main.h"

Code du .h

.. code:: c

		// ici main.h donc on met MAIN_H
		#Ifndef MAIN_H	// si l’en-tête n’est pas déjà défini
		#define MAIN_H //début définition

		 // définitions de constantes
		 #define UNE_CONSTANTE VALEUR //nom de la constante en Majuscules !, la valeur peut être du code

		 // éventuelles variables globales (à éviter)
		 int variable_globale;

		 // signatures des fonctions
		 int une_fonction(char un_parametre);

		 // inclusion des en-têtes
		 #include <stdlib.h>
		 // éventuelles structures (enregistrements/records)
		 struct s_list {
		  int entier;
		  struct s_list *next;//adresse du suivant
		 };

		// nouvelles définitions de types
		 typedef struct s_list list;//création d'un type list qui correspond à struct s_list
		#endif //fin

6. Tableaux en C
===================

Un tableau est un ensemble contenant des valeurs.
Par exemple "Bonjour" est un tableau avec les caractères ['b','o', ...,'r'] de type char.

.. code:: c

	// création d'une boite pour 6 entiers
	int tableau[6] = {0,5,7,9,8,3};
	// affiche 0, la première valeur du tableau
	printf("valeur 1: %d", tableau[0]);
	// affiche 3, 5 correspond à taille du tableau - 1 car on commence à zéro
	printf("dernière valeur: %d", tableau[5]);

On peut créer des tableaux multi-dimensionnels (matrices par exemple).

.. code:: c

		int[5][] matrice;//matrice de 5 lignes (préciser lignes est obligatoire), ? colonnes
		// 1, 0
		// 0, 1
		int[2][2] matriceIdentite = {{1,0},{0,1}};

7. Adresses et tableaux dynamiques
======================================

Toutes les variables sont stockées à un endroit dans la mémoire.
On dit qu'une variable pointe sur une adresse ou pointeur sur adresse.

On peut obtenir l'adresse d'une variable avec :code:`&` devant son nom.
On peut obtenir la valeur a une adresse avec :code:`*` devant l'adresse.

Un pointeur est déclaré type* (au moins une étoile pour indiquer qu'il contient une adresse).

.. code:: c

		double* d; // case qui contiendra une adresse
		int valeur = 17;
		d = &valeur;
		printf("%p", &a); // affiche une valeur par exemple Ox15612349
		printf("%p", d); // affiche une valeur par exemple Ox15612349
		printf("%p", &d); // affiche une valeur par exemple Ox17171235
		printf("%p", *d); // affiche une valeur par exemple Ox15612349
		printf("%d", *d); // affiche 17
		// &d retourne (l'adresse de) la case d. * dessus affiche la valeur dans la case
		printf("%p", *(&d));//affiche une valeur par exemple Ox15612349

.. toctree::

	Exemple d'adressage     <address/example>
	Pointeur de fonction    <address/function>
	Tableau dynamique       <address/array>

8. Flux et Fichiers
==========================

Un flux est une route en lecture ou écriture par
laquelle on peut récupérer des données, ce qui comprends écrire ou lire dans un terminal,
écrire ou lire dans un fichier...

Tous les flux sont des flux d'octets (=byte) cependant pour qu'il soit
plus facile de lire/écrire du texte, il existe un type de flux dérivé qui
sont les flux de caractères (donc les octets sont interprétés comme des caractères ASCII)
par exemple un terminal est un flux de texte.

Curseur
	Vos position dans le fichier est définie par un curseur qui pointe sur
	le prochain caractère lu. Généralement on lit en avancement de un et on ne
	cherche jamais à reculer.

Tampon
	Lorsque vous lisez/écrivez, l'opération n'est pas faite tout de suite. Les entrées/sorties (I/O)
	sont très couteuses donc le système attends généralement que vous avez beaucoup écrit/lu avant
	de procéder à la lecture/écriture et de vous renvoyer le résultat. Il conserve vos demandes
	dans ce qu'on appelle un buffer/tampon.

.. toctree::
  :maxdepth: 1

     Manipulation de flux                             <flux/principe>
     Manipulation de flux via appels système linux    <flux/system>

9. Autres notions
==========================

Voici quelques notions diverses

.. toctree::
		:maxdepth: 1

		Arguments à la ligne de commande           <more/args>
		Tris en C                                  <more/tris>
		Récursivité en C                           <more/recursive>
		Piles, Files et Listes                     <more/manage>
		Structures                                 <more/structures>

10. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

Resources associées au cours

.. toctree::
    :maxdepth: 2

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