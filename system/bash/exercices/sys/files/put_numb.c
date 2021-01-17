#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>

int main(int argc, char * argv[]) {
	int fr,n,l,x;
	long int i,offset;
	char buffer[256];

	if (argc!=4) {
		fprintf(stderr,"Usage : %s <file_name> <32-bit int in Hex> <Offset in Hex>\n",argv[0]);
		/* envoit l'erreur sur la sortie d'erreur */
		return EXIT_FAILURE;
	}

	fr=open(argv[1],O_WRONLY);
	if (fr==-1) {
		perror("open write mode fails\n");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
	}
	x = (int) strtol(argv[2],NULL,16)
	i = strtol(argv[3],NULL,16);
	offset=i*sizeof(int);

	l=lseek(fr,0,SEEK_EEND);
	if(l==-1) {
		perror("lseek fails");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
	} /* l renvoit lecart depuis le debutdduebutdebutdebutdebut   */
  if(offset>l) offset=l;
  l = lseek(fd,offset,SEEK_SET);
  
  if(l==-1) {
		perror("lseek fails");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
	}
  

	n=write(fr,argv[2],sizeof(int));
	if(n==-1) {
		perror("write in file fails");
		/* affiche le message système d'erreur de l'appel système */
		return EXIT_FAILURE;
	}

	close(fr);

	return EXIT_SUCCESS;
}