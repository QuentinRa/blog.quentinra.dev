#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>
#define BFSZ 256 /* buf size */

int main(int argc, char * argv[]) {
	int fd,n,x;

	if (argc!=2) {
		fprintf(stderr,"Usage : %s <file_name> \n",argv[0]);
		/* envoit l'erreur sur la sortie d'erreur */
		return EXIT_FAILURE;
	}

	/* 00... 000 0F ...
	La première partie c'est l'offset
	0F 00 00 00 little endian octect de poids faible d'abord alors que nous on écrit
	00 00 00 0F normalement soit 00000...01111 */

	fd=open(argv[1],O_WRONLY|O_CREAT|O_TRUNC,0600);

	if (fd==-1) {
		perror("open write mode fails\n");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
	}

	write(1,"Numb -->",9);
	/* ecrit sur la sortie standard (1) , 9 caractères soit Numb --> */
	
	n=scanf("%d",&x);
	
	while (n==1) {
		n=write(fd,&x,sizeof(int));
		if(n==-1) {
			perror("write fails\n");
			/* affiche le message système d'erreur de l'appel système */
			return EXIT_FAILURE;
		}
		write(1,"Numb -->",9);
		n=scanf("%d",&x);
	}
	close(fd);

	/* hexdump -C numbers.dat puis après echo $((16#c6)) pour vérifier */

	return EXIT_SUCCESS;
}