.. _arm:

================================
Assembleur (ARM)
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 01/12/2020}`

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
	*