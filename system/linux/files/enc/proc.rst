============================================
Processeur (familles, encodage,...)
============================================

Il existe deux grandes familles de jeux d’instructions qui sont exécutés par le processeur :

	* RISC : 32 bits, même type d'instruction qu'au niveau de l'UL
	* CISC : 64 bits, instructions faut directement appel à ce qu'il y a dans la mémoire

Ex : L’adresse OX 37 FE 1D 60 35 12 34 56 est d’une longueur de 8 octets soit 64 bits.

Sur 64 bits, un int va prendre 4 octets en mméoire (car int = 32bits) mais occuperas 8 octets
en place car les registres sont de taille 64 bits et sera placé dans un registre.

	* Little endian : octet de poids faible en premier
	* Big endian : octet de poids fort en premier

Composants

		* UL/ALU/UAL : Unité arithmétique et logique donc celui qui fait les calculs
		* UC : Unité de contrôle
		* Registre : truc dans lesquels ont met des valeurs

Représentation d'une Instruction
----------------------------------

Une instruction est codée sur 32/64 bits et ressemble à ça

.. image:: /assets/system/linux/images/ins.png

Opcode
	Contient le code de l’opération à effectuer (4bits).

Registre 1/2 + destination
	Les registres contenant les valeurs sur lesquels ont fait l'opération qui est mise
	dans le registre destination.

IP ou PC (Instruction pointer ou Program Counter)
	registre qui contient l’adresse de la mémoire où se trouve la prochaine instruction à exécuter.

IR (instruction register)
	registre qui contient l’instruction en cours d’exécution.

:code:`Note` : Plus de détails dans le cours d'Assembleur ARM.

Exécution d'une Instruction
----------------------------------

Il y a 5 étapes

	1. \
		:code:`FETCH` : aller chercher à l’adresse indiquée dans IP ou PC l’instruction et la placer dans IR.
	2. \
		:code:`Decode` : décompose le code de l’instruction et IC établit le
		chemin des données à réaliser et envoie les signaux de contrôle à l’UAL.
	3. \
		:code:`Read register` : lecture des valeur des registres
	4. \
		:code:`Execute` : UL exécute l’opération élémentaire (obtient ses infos de l’Opcode) sur les valeurs
		envoyés en argument (Registre1/2).
	5. \
		:code:`Write dest` : écriture du résultat (Registre destination)