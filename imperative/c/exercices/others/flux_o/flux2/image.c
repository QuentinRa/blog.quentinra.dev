/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<graph.h>
#define img_file "files/image.bin"

int main(int argc, char * argv[]) {
	
	FILE *image=NULL;
	int largeur=0,hauteur=0,i=0,j=0,compteur=0;
	couleur dessin;

	image = fopen(img_file,"r");
	if (!image){
		fprintf(stdout,"Unable to open %s in read mode.\n",img_file);
		return EXIT_FAILURE;
	}

	/* Recuperation largeur/hauteur */
	fread(&largeur,sizeof(int),1,image);
	fread(&hauteur,sizeof(int),1,image);
	
	InitialiserGraphique();
	CreerFenetre(0,0,largeur,hauteur);

	for (i = 0; i < largeur; i++){
		for (j = 0; j < hauteur; j++){
			fread(&dessin,sizeof(couleur),1,image);
			ChoisirCouleurDessin(dessin);
			DessinerPixel(i,j);
		}
	}
	
	while(!SourisCliquee() || ToucheEnAttente()){}
	
	FermerGraphique();
	fclose(image);

	return EXIT_SUCCESS;
}