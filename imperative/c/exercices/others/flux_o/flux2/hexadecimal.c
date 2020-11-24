/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#define file_path "files/top10"
#define champs 16

int main(int argc, char * argv[]) {
	
	FILE *file=NULL;
	int i,j,fin/*indice fin fichier */,compteur/*indice de parcours du tableau*/;
	int capacite=10/*capacite de valeurs*/,space=0;
	char *valeurs; /* valeurs récupérées */
	
	/* Allocation dynamique */
	valeurs = (char*) malloc(capacite*sizeof(char));

	/* ouverture du fichier sur lequel faire hexdump */
	file = fopen(file_path,"r");
	if (!file){
		fprintf(stderr,"Unable to open %s in read mode.\n",file_path);
		return EXIT_FAILURE;
	}

	/* lecture du fichier */
	for (i = 0; !feof(file) ; i++){
		fread(valeurs+i,sizeof(char),1,file);
		/* réallocation */
		if (i+1>capacite){
			capacite+=10;
			valeurs = (char*) realloc(valeurs,capacite*sizeof(char));
		}
	}
	fin=i;

	/* affichage du fichier comme hexdump sans option */
	for (i = 0,compteur=0,space=1; compteur<fin-1 ; i++){
		/* offset */
		fprintf(stdout,"%07x ",compteur);
		/* affichage de x valeurs (base) */
		for (j = 0; j<champs && compteur < fin; j+=2,compteur+=2,space++){
			/* on reéchange les valeurs de little-endian vers big-endian */
			fprintf(stdout,"%02x",valeurs[compteur+1]);
			fprintf(stdout,"%02x ",valeurs[compteur]);
		}
		putchar('\n');
	}
	/* dernier offset */
	fprintf(stdout,"%07x\n",compteur);

	/* Fermeture du fichier*/
	fclose(file);
	/* Libération de la mémoire */
	free(valeurs);

	return EXIT_SUCCESS;
}