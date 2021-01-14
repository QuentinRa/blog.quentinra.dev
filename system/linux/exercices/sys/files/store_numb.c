#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>

int main(int argc, char * argv[]) {
	int fd,n;
	char buffer[256];

	if (argc!=2) {
		fprintf(stderr,"Usage : %s <file_name> \n",argv[0]);
		/* envoit l'erreur sur la sortie d'erreur */
		return EXIT_FAILURE;
	}

	fd=open(argv[1],O_WRONLY|O_CREAT|O_TRUNC,0600);
	if (fd==-1) {
		perror("open write mode fails\n");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
	}

	write(1,"Numb -->",9);
	/* ecrit sur la sortie standard (1) , 9 caractères soit Numb --> */

	while (n=read(0,buffer,256)) {
		/* nombre d'octect effrectivement lus */
		if(n==-1) {
			perror("read fails\n");
			/* affiche le message système d'erreur de l'appel système */
			return EXIT_FAILURE;
		}
		n=write(fd,buffer,n);
		/* on laisse le \n donc pas n-1 mais n */
		if(n==-1) {
			perror("write fails\n");
			/* affiche le message système d'erreur de l'appel système */
			return EXIT_FAILURE;
		}
		write(1,"Numb -->",9);
	}
	close(fd);

	return EXIT_SUCCESS;
}