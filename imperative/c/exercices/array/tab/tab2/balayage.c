#include<stdio.h>
#include<stdlib.h>
#define hauteur 10

int main(int argc, char * argv[]) {
	int triangle[hauteur*hauteur],i,j,compteur=0;	/* i pour les lignes , j pour les colonnes */
	system("clear");
/* le compteur monte à chaque fois que l'on met une valeur dans une case et sert à les identifier */

	for (i=0;i<hauteur;i++){
		for (j=0;j<i;j++) {		/* sur la ligne 0 y a 1nombre, ligne 1 2 nombres... donc boucle de 0 
			à i+1 sauf que nous on veut que dans la ligne i+1, il y ait 1 donc on va de 0 à i dans
			cette boucle */
			if (j==0) {
				triangle[compteur]=1;	/* ici on met des 1 dans la 1ère colonne */
				printf("%6d",triangle[compteur]);
				compteur++;
				/*printf("%6d",triangle[compteur]);*/
			} else {
				triangle[compteur]=triangle[compteur-i]+triangle[compteur-i-1];
	/* je sais que chaque valeur du triangle et la somme de 2 valeurs à un emplacement précis
	BUT : retrouver ces emplacements avec un calcul */
				printf("%6d",triangle[compteur]);
				compteur++;
			}
		}		
		for (;j<i+1;j++) {
			triangle[compteur]=1;
			printf("%6d",triangle[compteur]);
			compteur++;
		}

		putchar('\n');
	}

	return EXIT_SUCCESS;
}
