====================================
Code théorique
====================================

À titre de référence, voici à quoi ressemble un programme
(les idées sont en vrac et bien sûr il ne compile pas).

.. code:: c

		#include<fcntl.h>
		#include<unistd.h>

		// Arguments
		//tests de argc , stderr , exit(1)

		// Ouverture d'un fichier
		int fr;
		//modes : O_RDONLY, O_WRONLY, O_CREAT, O_TRUNC, perms(0600)
		fr = open(path, mode);
		if(fr==-1) {
			perror("message"); exit(2);
		}

		// Lecture
		//Vérifier le retour -> perror si retour==-1
		while(n=read(quoi, ou mettre la lecture, combien lire)){
			...
		}

		// Ecriture
		//Vérifier le retour -> perror si retour==-1
		//Si retour ==0 alors on est a la fin
		// write(ou,quoi,combien);

		// Déplacement
		// depuis : SEEK_CUR, SEEK_SET, SEEK_END
		// Vérifier le retour -> perror si retour==-1
		L (off_t) = lseek(quoi,(off_t) combien,depuis)
		long int offset = strtol(quoi,NULL,10)*sizeof(int) ;

		// Fermeture
		close(fr);