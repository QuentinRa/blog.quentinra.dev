====================================
Appels systèmes
====================================

Les includes qui suffisent sont généralement

.. code:: c

	#include <fcntl.h>
	#include <unistd.h>

Voici tous les appels systèmes

.. method:: void perror(const char *s);

	Pour tous les appels systèmes (open, close, read, write, ...), affiche un message pertinent sur la
	sortie d'erreur du dernier appel système qui a échoué. Vous pouvez y ajouter votre propre message
	avec l'attribut :code:`s`.

.. method:: int open(const char *pathname, int flags);

	Ouvre un fichier et retourne le descripteur ou -1 si erreur.

	.. attribute:: pathname

		Chemin vers le fichier

	.. attribute:: flags

		Vous pouvez cumuler des options avec | (pas read et write en même temps). Si vous créez un fichier
		alors il faudra ajouter un 3e argument qui sont les permissions (0600 par exemple).

			* O_RDONLY : Lecture uniquement
			* O_WRONLY : Écriture uniquement
			* O_CREAT : créer le fichier si n'existe pas
			* O_TRUNC : vide le fichier à l'ouverture

À titre de référence, voici à quoi ressemble un programme,
mais beaucoup de parties sont omises donc il ne compile bien évidemment
pas.

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