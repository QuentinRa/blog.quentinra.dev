=====================================
Partiel 04/01 Système d'exploitation
=====================================

Quentin RAMSAMY--AGEORGES

Exercice 1 (Commandes shell, 5 points)
================================================

1. Donner une commande shell qui imprime le contenu du répertoire de
login de l’utilisateur user quel que soit le répertoire coutant.

ls -la /home/user

# alternative

find /home/user -maxdepth 1

2. Donner une commande shell différentes qui impriment le nom du répertoire
de login de l’utilisateur user quel que soit le répertoire courant

getent passwd user | cut -d: -f6
	récupère dans le fichier /etc/passwd la 6e partie avec : comme séparateur

3. Donner une commande shell qui affiche les noms de tous les fichiers
de suffixe .h du répertoire /tmp.

find /tmp -type f  -name \"\*.h\"
	Dans /tmp on affiche tous les fichiers qui terminent par .h (récursif)

4. Donner une commande shell qui affiche le nombre de fichiers contenant
la chaîne de caractères \"Bob\" du répertoire \"/tmp\"

find /tmp -type f -exec grep -l \"Bob\" {} \\; | wc -l
	Sur tous les fichiers de /tmp on fait un grep (avec -l pour retourner un boolean) et on compte
	le nombre de lignes (donc de match)

5. On rappelle que la variable d’environnement PATH donne les noms des
répertoires dans lesquels le système va chercher les commandes séparés
par des : (deux points). Donner une commande shell qui affiche les
premier et troisième répertoire.

echo $PATH | cut -d: -f1,3 | tr \':\' \'\\n\'
	On affiche path, on considère : comme séparateur et on affiche le 1er et le 3 (1,3) puis au lieu de séparer
	par :, on sépare par un saut de ligne.

	Si on laisse ':' alors on a  :code:`echo $PATH | cut -d: -f1,3`

Exercice 2 (sed 2 points)
=============================

On considère le script sed suivant

:code:`sed -e ’s/\([a-z]+\)\([0-9]+].*/\2\1/’`

quel est son comportement sur les entrées

.. note::

	Ce sed ne marche pas selon moi car il manque une parenthèse. L'idée est que l'on va considérer deux variables

		* '1' : qui contient une chaine d'au moins un caractères (a-z minuscule)
		* '2' : qui contient une chaine d'au moins un nombre (0-9)

	Et remplace si on a 1 et 2 par l'inverse donc 2,1.

— abc123

On a bien 1 (abc) puis 2 (123) donc on inverse : :code:`123abc`.

— 123abc

On ne fait rien.

— abc123def

On a bien 1 (abc) puis 2 (123) donc on inverse : :code:`123abcdef`.

— 123abc123

On a 1 (abc), 2 (123) donc on inverse : :code:`123123abc`.

Exercice 3 (Script shell 3 points)
====================================

Écrire un script bash qui prend trois arguments "s", "n" et "f" et qui affiche
1 fois la chaîne de caractères s puis deux fois puis i avec un espace les séparant
dans le fichier f du répertoire "/tmp" et ainsi de suite jusque n. Si le fichier
f n’existe pas ou si il existe déjà ou si on a pas pu le créer on affichera un
message d’erreur pertinent.

.. code:: bash

		#!/bin/bash
		#
		# usage: ./script.sh <s> <n> <f>
		# repeat <s> 1 time, <s> 2 times, ..., n times
		# in file <f> in /tmp
		#
		# FileAlreadyExists : if file exists
		# CreateFileFailed : create failed

		# check des arguments
		if [ $# -ne 3 ]; then
			echo "./script.sh <s> <n> <f>"
			exit
		fi

		s=$1
		n=$2
		f=/tmp/$3

		# check f
		# already exists
		if [ -f $f ]; then
			# redirect on error
			echo "Error: FileAlreadyExists ($f)" 1>&2
			exit
		fi

		# create failed
		t=$(touch $f 2>/dev/null)

		if [ ! -z $t ] ; then
			# redirect on error
			echo "Error: CreateFileFailed (touch $f)" 1>&2
			exit
		fi
		if [ ! -w $f ]; then
			# redirect on error
			echo "Error: CreateFileFailed ($f)" 1>&2
			exit
		fi

		for (( i = 0; i < $n; i++ )); do
			# last line
			if [ $(($i+1)) -ge $n ]; then
				for (( j = 0; j <= i; j++ )); do
					echo -n "$s"
				done
			# not last line so space
			else; then
				for (( j = 0; j <= i; j++ )); do
					echo -n "$s"
				done
				echo -n " "
			fi;
		done > $f

		exit

Exercice 4 (fork 5 points)
============================

Écrire un programme C qui crée deux fils. Le père affiché "fait", le premier
fils affiche "il" et le deuxième affiche "ilbeau". Le comportement du du
programme est d’afficher "il fait beau" sur le sortie standard. Le père
attendra la fin de ses fils pour se terminer.

On utilisera uniquement les flux noyaux

.. code:: c

		#include <stdio.h> //printf
		#include <stdlib.h> //EXIT_SUCCESS
		#include <unistd.h> //fork
		#include <wait.h> //wait

		void child1(){
		 printf("il");
		 fflush(stdout); // force affichage
		}

		void child2(){
		  printf("il\b\bbeau"); // reviens de 2 caractères (efface le il)
		  fflush(stdout); // force affichage
		}

		int main(int argc, char ** argv) {
		  pid_t c1, c2;

		  c1 = fork();
		  if (c1 == 0){ //dans le fils 1
		    child1();
		    return EXIT_SUCCESS;
		  }
		  wait(NULL); // attends fils

		  printf(" fait ");
		  fflush(stdout);

		  c2 = fork();
		  if (c2 == 0){ //dans le fils 2
		    child2();
		    return EXIT_SUCCESS;
		  }
		  wait(NULL); // attends fils

		  return EXIT_SUCCESS;
		}

Si printf, ... ne sont pas autorisés alors on peut faire

.. code:: c

		#include <unistd.h> //fork
		#include <wait.h> //wait

		void child1(){
		 write(1,"il",2);
		 exit(0); //vide les buffers car force fermeture
		}

		void child2(){
		  write(1,"il\b\bbeau",8); // reviens de 2 caractères (efface le il)
		  exit(0); //vide les buffers car force fermeture
		}

		int main(int argc, char ** argv) {
		  pid_t c1, c2;

		  c1 = fork();
		  if (c1 == 0){ //dans le fils 1
		    child1();
		  }
		  wait(NULL); // attends fils (on pourrait aussi sleep)

		  write(1," fait ",6);

		  c2 = fork();
		  if (c2 == 0){ //dans le fils 2
		    child2();
		  }
		  wait(NULL); // attends fils (on pourrait aussi sleep)

		  return 0;
		}

Exercice 5 (Généralités 5 points)
=======================================

.. image:: /assets/system/linux/annales/exo5.png

1. Décrire précisément son comportement

Main

	Le programme créé deux pipes : :code:`pos`, :code:`neg`, si la création échoue alors on affiche
	un message sur la sortie d'erreur et on quitte avec le code 1.

	On créé un fils (stock son id dans :code:`pid_pos`) et on ferme l'écriture des deux pipes dans le fils.
	On appelle une fonction :code:`fils` avec le pipe pos en lecture.

	Si on a échoué a créé un fils ou on est dans le père, on réessaye une fois (sauf que on stoke l'id dans :code:`pid_neg`).

	Si on a échoué a créé un fils ou on est dans le père, on refait pareil sauf qu'on appelle  :code:`fils` avec le
	pipe neg en lecture.

	Si on a échoué a créé un fils ou on est dans le père alors on appelle une fonction  :code:`pere`.

	Enfin on affichera "argh!!!" dans le père, seulement si la fonction père n'a pas quitté le programme (et on
	retourne le code d'erreur 255).

Fils
	Les fils vont lire dans leur pipe donné (donc deux vont lire dans pop et un dans neg) et lorsqu'il n'y a plus rien
	a lire alors le fils quitte. (les messages sont de la forme "filsP:pid:nombre_lu" (et filsP est remplacé par filsN
	pour le pipe neg).

Pere
	Le père demande un entier tant que le flux n'est pas terminé (EOF).

	Si l'entier est positif, alors le père écrit sur le pip pos, et donc l'un des fils va afficher la valeur.

	Si l'entier est négatif, alors le père écrit sur le pip neg, et donc le fils associé va afficher la valeur.

	Si l'entier vaut 0, alors le père attends ses fils puis meurt.

2. Expliquer comment le modifier pour créer 3 fils qui impriment respectivement
les entiers congrus à 0, 1 et 2 modulo 3

On a déjà trois fils, on va créer 3 pipes (variables globales).

int zero[2];
int un[2];
int deux[2];

Dans le main

.. code:: c

	if ( pipe(zero) < 0 || pipe(un) < 0 || pipe(deux) < 0){
	 ... (aucun changement) ...
	}

Dans chaque fils on close les 3 pipes avant d'appeler la fonction fils. Voici un exemple
dans filsZero.

.. code:: c

	if ( (pid_zero=fork())==0 ){
	 close(zero[1]);
	 close(un[1]);
	 close(deux[1]);
	 fils("filsZero", zero[0]);
	}

On change les conditions

.. code:: c

    // if( x == -1 ) break; // pas demandé donc commenté mais peut être utile pour remplacer le x == 0 d'avant
    if( x % 3 == 0) write(zero[1],&x, len);
    if( x % 3 == 1) write(un[1],&x, len);
    if( x % 3 == 2) write(deux[1],&x, len);

On ajoute un wait_verbose pour le 3e fils

.. code:: c

    waitverbose(0); //zero
    waitverbose(0); //un
    waitverbose(0); //deux
    exit(0);