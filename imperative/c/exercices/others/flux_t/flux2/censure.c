/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	
	int i;
	char c;
	FILE *fichier=NULL;

	if (argc!=2){
		fprintf(stderr, "Usage : %s <nom/chemin>\n",argv[0]);
		return EXIT_FAILURE;
	}

	fichier = fopen(argv[1],"r+");
	if (!fichier){
		fprintf(stdout,"Unable to open %s in read mode.\n",argv[1]);
		return EXIT_FAILURE;
	}

	for (i = 0; !feof(fichier) ; i++){
		fread(&c,sizeof(char),1,fichier);
		if(c=='e'){
			/* Vide les tampon/renvient de 1 en arrière */
			fseek(fichier,-1UL,SEEK_CUR);
			c='X';
			fwrite(&c,sizeof(char),1,fichier);
			/* Vide le tampon */
			fseek(fichier,0,SEEK_CUR);
		}
	}

	/* Si on modifie 'e' par 'XXX' alors logiquement on as sauté deux caractères
	a chaque fois : effectivement on ecrit les XXX puis fread continue après le
	dernier X
	for (i = 0; !feof(fichier) ; i++){
		fread(&c,sizeof(char),1,fichier);
		if(c=='e'){
			char buf[4]="XXX";
			/* Vide les tampon/renvient de 1 en arrière *
			fseek(fichier,-1UL,SEEK_CUR);
			fwrite(buf,3*sizeof(char),1,fichier);
			/* Vide le tampon *
			fseek(fichier,0,SEEK_CUR);
		}
	}
	*/

	fclose(fichier);

	return EXIT_SUCCESS;
}