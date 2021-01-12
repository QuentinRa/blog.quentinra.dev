================================================================
2. Makefile en c
================================================================

Un fichier Makefile est un fichier permettant de compiler un projet (fichier .c, .h, ...).
C'est un fichier sans extensions appelé **Makefile**.

Le concept est :

	* on définit un but : créer a.out
	* on définit tous les fichiers .o à créer dans O_FILES (.o = c compilé mais pas exécutable)
	* on indique que vous créer a.out on doit utiliser tous les fichiers .o
	* on définit pour chaque fichier .o les fichiers dont il dépend

.. code:: make

		# Contenu d'un makefile
		# 1 - création de l'étiquette
		but : nom_programme

		# 2 - On initialise les variables
		# liste de tous vos exécutables, avec l'extension .o
		O_FILES = fichier1.o fichier2.o \
					main.o
		CC = gcc #compilateur
		CFLAGS = -ansi… #options de compilation (-lgraph -lm)

		# 3 - Les dépendances
		# indique comment compiler notre programme (compile tous les .o soit O_FILES)
		programme : $(O_FILES)
			$(CC) $(CFLAGS) -o programme $(O_FILES)

		# indique comment compiler chaque .o
		fichier1.o : fichier1.h #liste les fichiers .h si cette exécutable dépends d'un certain .h
		fichier2.o : fichier.o #un fichier peut dépendre d'un autre fichier.o
		main.o : fichier1.h fichier2.h

		# 4 - buts factices
		clean :
			-rm -f $(OFILES) programme
		.PHONY : clean

Une fois le fichier créé, la commande make permet d'appeler une étiquette du makefile.

.. code:: bash

		make # appelle but
		make clean # appelle clean, qui supprime tous les .o et programme
		...