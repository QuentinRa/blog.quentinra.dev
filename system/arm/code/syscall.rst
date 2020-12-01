============================================
2. Coder en ARM - Appels systèmes
============================================

Plus d’infos : less /usr/include/arm-linux-gnueabihf/asm/unistd.h

	*	sys_exit : :code:`void exit(int status);`
		* mettre fin au programme, donc votre dernière instruction
		* code : :code:`1`
	*	sys_fork : :code:`pid_t fork(void);`
		* vous n'allez pas l'utiliser ici, permet de créer un processus
		* code : :code:`2`
	*	sys_read : :code:`ssize_t read(int fd, void *buf, size_t count);`
		* lecture dans un fichier/console (flux)
		* code : :code:`3`
	*	sys_write : :code:`ssize_t write(int fd, const void *buf, size_t count);`
		* écriture dans un fichier/console (flux)
		* code : :code:`4`
	*	sys_open : :code:`int open(const char *pathname, int flags, mode_t mode);`
		* ouvrir un fichier (flux)
		* devra être fermé
		* code : :code:`5`
	*	sys_close : :code:`int close(int fd);`
		* fermer un fichier (flux)
		* code : :code:`6`

Appel système
	Il s'agit d'une fonction du système qui sont les instructions les plus basiques
	que sait exécuter le système. Vous avez une liste plus haut, certains systèmes ont en plus.
