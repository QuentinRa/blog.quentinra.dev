#include<stdio.h>
#include<stdlib.h>
#define hauteur 30	/* on veut une hauteur de 30 */

int main(int argc, char * argv[]) {
	int triangle[hauteur][hauteur],i,j;	/* i pour les lignes , j pour les colonnes */
	system("clear");	/* on efface l'interface parce que là ... */

	/* triangle [n][k] avec n qui fera les lignes et k les colonnes */

	printf("LA HAUTEUR MAXIMUM EST DE x lisible RIP sauf si tu change le zoom\n");

	for (i=0;i<hauteur;i++){
		for (j=0;j<i;j++) {
			if (j==0) {			/* met que des 1 dans la 1ere colonne */
				triangle[i][j]=1;
			} else {
				triangle[i][j]=triangle[i-1][j-1]+triangle[i-1][j];
		/* les valeurs des cases entre la 1ere et la dernière colonnes sont prisent avec
		celle des la valeur une case au dessus à gauche + la case au dessus */
			}
			printf("%8d",triangle[i][j]); /* réserve 7 emplacement pour afficher une valeur */
		}		
		for (;j<i+1;j++) {
			triangle[i][j]=1;	/* complète la dernière colonne avec des 1 */
			printf("%8d ",triangle[i][j]);
		}

		putchar('\n');
	}

	return EXIT_SUCCESS;
}