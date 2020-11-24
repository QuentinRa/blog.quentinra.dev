/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#define fichier "compteur"

int main(int argc, char * argv[]) {
	
	FILE *compteur=NULL;
	int nombre=0;

	compteur = fopen(fichier,"r");
	if (!compteur){
		compteur = fopen(fichier,"w");
		if (!compteur){
			fprintf(stdout,"Unable to open %s in read mode nor in write mode.\n",fichier);
			return EXIT_FAILURE;
		}
		fwrite(&nombre,sizeof(int),1,compteur);
		fclose(compteur);
		compteur = fopen(fichier,"r");
		if (!compteur){
			fprintf(stdout,"Unable to open %s in read mode.\n",fichier);
			return EXIT_FAILURE;
		}
	}

	fread(&nombre,sizeof(int),1,compteur);
	fclose(compteur);

	nombre++;
	fprintf(stdout,"%d\n",nombre);

	compteur = fopen(fichier,"w");
	if (!compteur){
		fprintf(stdout,"Unable to open %s in write mode.\n",fichier);
		return EXIT_FAILURE;
	}
	fwrite(&nombre,sizeof(int),1,compteur);

	return EXIT_SUCCESS;
}
