#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int i,j,hauteur,stop,choix;	/* i pour les lignes, j pour les colonnes*/

	do {
		choix=0;
		printf("_______________\n");
		printf("1) Triangle\n");
		printf("2) Carré\n");			/* affiche l'interface LA MEME*/
		printf("q) Quitter\n");
		printf("Votre Choix ?");
		scanf("%d",&choix);
		if ((choix!=1)&&(choix!=2)) {
			printf("Au revoir...\n");	/* si choix = q SANS FAIRE AVEC CHAR */
			stop=1;
		}
		if (choix==1) {
			printf("\nHauteur ?");	/* Hauteur ? */
			scanf("%d",&hauteur);
			putchar('\n');
			for (i=0;i<hauteur;i++) {	/* TANT QUE il y a moins de ligne que la hauteur, j'en met une et */
				for (j=0;j<i+1;j++) {	/* je met autant d'étoile que le numéro de la ligne de 0 à hauteur +1*/
					printf("*");
				}
				putchar('\n');
			}
		}
		if (choix==2) {
			printf("\nHauteur ?");	/* Hauteur ? */
			scanf("%d",&hauteur);
			putchar('\n');
			for (j=0;j<hauteur;j++) {	/* Je fais la 1ere ligne */
				printf("*");
			}
			putchar('\n');

			for (i=0;i<hauteur-2;i++) { 	/* la 1ere et la dernière ligne je les fais a part donc hauteur-2(lignes) */
				printf("*");	/* Je met * de la 1ere colonne */
				for (j=hauteur-2;j>0;j--) { /* la 1ere et la dernière colonne faites à part donc hauteur-2(colonnes) */
					printf(" ");
				}
			printf("*\n");	/* je met * de la dernière colonne */
			}
			for (j=0;j<hauteur;j++) {	/* Je fais la derniere ligne */
				printf("*");
			}
			putchar('\n');
		}

	} while (stop!=1);	/* EN VRAI, le if plus haut sert à quitter la boucle donc sert juste à répéter */

	return EXIT_SUCCESS;
}