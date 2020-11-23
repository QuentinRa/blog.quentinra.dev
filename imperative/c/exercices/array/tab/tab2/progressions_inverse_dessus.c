#include<stdio.h>
#include<stdlib.h>
#define nbrligne_1 5
#define nbrligne_2 5
#define nbrligne_3 5
#define	nbrcolonne_1 2
#define	nbrcolonne_2 3
#define	nbrcolonne_3 5

int main(int argc, char * argv[]) {
	int i,j,tour=0;
	int tab1[nbrligne_1][nbrcolonne_1],tab2[nbrligne_2][nbrcolonne_2],tab3[nbrligne_3][nbrcolonne_3];

	for (i=0;i<nbrligne_1;i++) {			/* sur deux lignes */
		for (j=0;j<nbrcolonne_1;j++) {	/* tant que le nombre de colonnes <5 */
			tab1[i][j]=i+1;	/* on rempli chaque valeur est plus grande de 1 que celle de la ligne précédente */
			printf("%2d ",tab1[i][j]);
		}
		putchar('\n');
	}
	putchar('\n');

	for (i=0;i<nbrligne_2;i++) {
		tour=0+i;
		for (j=0;j<nbrcolonne_2;j++) {	
				tab2[i][j]=1+tour;	/* chaque valeur + grande de 5 est +1 chaque pour chaque ligne par
			rapport à la colonne */
				tour+=nbrligne_2;
			printf("%2d ",tab2[i][j]);
		}
		putchar('\n');
	}
	putchar('\n');

	for (i=0;i<nbrligne_3;i++) {
		for (j=0;j<nbrcolonne_3;j++) {
			if ((j>0)&&(j>i)) {	/* sauf pour la 1ere colonne, tant que l'indice de la colonne
			est plus grand que la ligne en gros j=1 et i=0 on met 1 nombre car 1>0...*/
				tab3[i][j]=i+1;
				printf("%2d ",tab3[i][j]);
			} else {	/* partour ailleurs on met zéro */
				tab3[i][j]=0;
				printf("%2d ",tab3[i][j]);
			}
		}
		putchar('\n');
	}
	putchar('\n');

	return EXIT_SUCCESS;
}