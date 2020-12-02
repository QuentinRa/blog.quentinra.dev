.. _arm:

================================
Assembleur (ARM)
================================

| :math:`\color{grey}{Version \ 1.1.2}`
| :math:`\color{grey}{Dernière \ édition \ le \ 02/12/2020}`

Attention ! Coder en assembleur peut se révéler assez
compliqué donc si vous n'avez pas les idées claires
prenez une nuit de sommeil ^^.

1. Introduction
===================================

Pour faire de l'assembleur ARM, vous devez avoir un processeur
ARM.

L'assembleur est un langage d'ultra bas niveau juste au dessus du langage machine.
Les instructions font appels aux appels systèmes et aux registres. Donc ce
n'est pas du tout portable sur d'autres architectures.

Vous allez coder des fichiers :code:`.s` qui seront convertit
en :code:`.o` avec la phase d'assemblage. Vous pourrez alors les utiliser
avec :code:`gcc` (gcc -c donne aussi des .o qu'il faut fusionner pour avoir a.out)
ou alors directement "linker" pour obtenir une exécutable.

.. code:: bash

		#Phase d’assemblage
		as -gstabs -o file.o file.s # donne un fichier file.o
		#Phase d’édition de liens
		ld -O0 file.o # donne a.out
		#Lancement
		./a.out

2. Coder en ARM
================

Quelques propriétés de l'assembleur

.. toctree::
	 :maxdepth: 1

		 Structure du code          <code/structure>
		 Types                      <code/types>
		 Appels systèmes            <code/syscall>
		 Registres                  <code/register>
		 Constantes immédiates      <code/const>

3. Opérations
===============================

Explication
	Une opération est de la forme :code:`nom Rd, Rn, Operand2` (par exemple).
		* nom en minuscules ou majuscules de l'opération
		* généralement s'il y a un registre nommé Rd dans la déclaration, alors l'opération va mettre le résultat dans le registre Rd
		* s'il y a Operand2 alors on peut mettre une constante immédiate
		* ex: add r0,r1,#4 va faire r0 = valeur(r1) + 4

Voici la liste des opérations généralement utilisées.

.. toctree::
	 :maxdepth: 1

			Manipulation des registres         <op/move>
			Opérations arithmétiques           <op/arithmetic>
			Exemple de code commenté           <op/example>

4. Fonctions
============================

.. toctree::
	 :maxdepth: 1

			Fonctions                          <fonction/index>
			Appel d'un appel système           <fonction/swi>

5. Conditions
===================================

Tous les {cond} des opérations indique qu'on peut ajouter
à la suite une condition, c'est a dire un if qui fait l'opération
si le if est vrai, sinon ne fait pas l'opération.

Il existe 4 'flags' (drapeaux) NZCV qui contiennent des booléens valant true
s'ils ont étés levés par une opération

	*	N: résultat est négatif ?
	*	Z: résultat vaut zéro ?
	*	V: bit de sortie vaut 1 ? (dernière retenue d'une opération de bits, voir cours linux)
	*	C: il y a eu débordement ? (voir cours linux)

Vous allez ajouter des qualificatifs (ex: :code:`ne`, ...) et ces qualificatifs
vont vérifier des valeurs des flags NZCV et si les valeurs associés au qualificatif
valent True (vrai) alors l'opération est exécutée.

Il existe des opérations qui ont pour put de changer les flags. Vous pouvez ajouter
un :code:`s` à la fin d'un opération pour que l'opération modifie les flags (seulement
pour certaines opérations comme add).

.. toctree::
	 :maxdepth: 1

			Opérateurs et Flags                <cond/flag>
			Opérations qui changent les flags  <cond/c_flag>
			Exemples de code avec conditions   <cond/example>

7. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

-----

**Crédits**
	* Denis MONNERAT (enseignants à l'IUT de Sénart-Fontainebleau)
	* Luc HERNANDEZ (enseignants à l'IUT de Sénart-Fontainebleau)
	* Selma NABOULSI (enseignants à l'IUT de Sénart-Fontainebleau)
	* Frédéric GERVAIS (enseignants à l'IUT de Sénart-Fontainebleau)
	* Pierre PETRIK (enseignants à l'IUT de Sénart-Fontainebleau)
	* Luc DARTOIS (enseignants à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* http://www.toves.org/books/arm/#s2
	* https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm
	* https://en.wikipedia.org/wiki/Stack_register
	* https://www.elprocus.com/what-is-stack-stack-pointer-types-operations-its-application/