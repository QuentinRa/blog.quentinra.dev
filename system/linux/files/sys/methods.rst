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

.. method:: void exit(int status);

	Sert à quitter le programme. Généralement on met un status négatif lorsqu'il a eu une erreur.

Petit rappel sur les flux. On appelle flux, un flux de données donc par exemple
un fichier ou encore la console. Un flux est représenté ici parce qu'on appelle un
descripteur (fd généralement pour file descriptor),
c'est-à-dire que les méthodes vont utiliser ce descripteur pour savoir de quel flux vous parlez. Un flux
devra être fermé si vous l'avez ouvert.

Les 3 flux à connaître sont : le descripteur 0 (lecture sur la console), 1 (écriture dans la console),
2 (écriture sur la sortie d'erreur de la console). Donc si vous voulez écrire dans la console, alors
vous allez passer un descripteur : soit 1 (=stdout) soit 2 (=stderr).

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

.. method:: int read(int descripteur, char *buf_r, int taille);

	Lis taille caractères et retourne le nombre de caractères lus. Si read retourne -1 alors
	il n'y a plus rien a lire. Vous pouvez par exemple faire une boucle "while read ne retourne pas -1"
	(si le flux est finit comme un fichier).

	.. attribute:: buf_r

		Vous devez créer un tableau ou donner une adresse dans laquelle sera mise le/les caractères lus.

	.. attribute:: taille

		Le nombre d'éléments à lire.

.. method:: int write(int descripteur, const char *buf, int taille_w);

	Écris taille caractères et retourne le nombre de caractères écris. Si write retourne -1 alors
	l'écriture a échouée.

	.. attribute:: buf

		Une adresse d'une variable/tableau de ce qu'il faut écrire.

	.. attribute:: taille_w

		Le nombre d'éléments à écrire.

.. method:: int close(int descripteur);

	Ferme un flux. Obligatoire si vous avez fait open.

Quelques autres méthodes utiles

.. method:: off_t lseek(int descripteur, off_t saut, int depuis);

	Un off_t est un long. Vous permet de vous déplacer dans le fichier et retourne
	votre nouvelle position depuis le début du fichier (appelé offset).

	.. attribute:: saut

		Un long qui correspond au nombre à sauter.

	.. attribute:: depuis

		Depuis quelle position voulez vous appliquer l'offset :

			* SEEK_CUR : depuis votre position actuelle
			* SEEK_SET : depuis le début
			* SEEK_END : depuis le fin

		En particulier, avec un offset de 0 il est facile de revenir au début/aller à la fin.

.. method:: int stat(const char *path, struct stat *buf);

	Vous donnez le chemin d'un fichier + une variable vide de type stat et si la fonction
	ne retourne pas -1, alors elle a remplie la variable vide avec des infos sur le fichier.

	Voici la forme de la structure stat, généralement les types sont des alias pour int, long,
	ou unsigned int.

	.. code:: c

		// tiré de la doc officielle
		struct stat {
		 dev_t     st_dev;     /* ID of device containing file */
		 ino_t     st_ino;     /* inode number */
		 mode_t    st_mode;    /* protection */
		 nlink_t   st_nlink;   /* number of hard links */
		 uid_t     st_uid;     /* user ID of owner */
		 gid_t     st_gid;     /* group ID of owner */
		 dev_t     st_rdev;    /* device ID (if special file) */
		 off_t     st_size;    /* total size, in bytes */
		 lksize_t st_blksize; /* blocksize for file system I/O */
		 blkcnt_t  st_blocks;  /* number of 512B blocks allocated */
		 time_t    st_atime;   /* time of last access */
		 time_t    st_mtime;   /* time of last modification */
		 time_t    st_ctime;   /* time of last status change */
		};