#include<stdio.h>
#include<stdlib.h>
#define nbrligne_1 2
#define nbrligne_2 3
#define nbrligne_3 5
#define	nbrcolonne_1 5
#define	nbrcolonne_2 5
#define	nbrcolonne_3 5

int main(int argc, char * argv[]) {
	int i,j,tour=0;
	int tab1[nbrligne_1][nbrcolonne_1],tab2[nbrligne_2][nbrcolonne_2],tab3[nbrligne_3][nbrcolonne_3];

	for (i=0;i<nbrligne_1;i++) {			/* sur deux lignes */
		for (j=0;j<nbrcolonne_1;j++) {	/* tant que le nombre de colonnes <5 */
			tab1[i][j]=j+1;	/* on rempli chaque valeur est plus grande de 1 que la précédente */
		}
	}
	for (i=0;i<nbrligne_1;i++) {
		for (j=0;j<nbrcolonne_1;j++) {		/* affiche le tableau */
			printf("%2d ",tab1[i][j]);
		}
		putchar('\n');
	}
	putchar('\n');

	for (i=0;i<nbrligne_2;i++) {
		for (j=0;j<nbrcolonne_2;j++) {	
			tab2[i][j]=j+1+tour;	/* chaque valeur + grande de 1 est +5 chaque pour chaque ligne */
		}
		tour+=nbrcolonne_2;
	}

	for (i=0;i<nbrligne_2;i++) {
		for (j=0;j<nbrcolonne_2;j++) {	/* affiche le tableau */
			printf("%2d ",tab2[i][j]);
		}
		putchar('\n');
	}
	putchar('\n');

	for (i=0;i<nbrligne_3;i++) {
		for (j=0;j<nbrcolonne_3;j++) {
			if ((i>0)&&(j<i)) {	/* sauf pour la 1ere ligne, tant que l'indice de la colonne
			est plus petit que l'indice de la ligne en gros ligne 1 on met 1 nombre car 0<1...*/
				tab3[i][j]=j+1;
			} else {	/* partour ailleurs on met zéro */
				tab3[i][j]=0;
			}
		}
	}

	for (i=0;i<nbrligne_3;i++) {
		for (j=0;j<nbrcolonne_3;j++) {
				printf("%2d ",tab3[i][j]);
		}
		putchar('\n');
	}
	putchar('\n');

	return EXIT_SUCCESS;
}