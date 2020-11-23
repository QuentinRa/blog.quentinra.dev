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

	for (i=0;i<nbrligne_3;i++) {	/* on utilise ici nbrligne_3 car il est le plus grand ... */
		if (i<nbrligne_1) {	/* ... et on doit donc faire en sorte d'arreter de remplire les tableaux d'ou ce if */
			for (j=0;j<nbrcolonne_1;j++) {	/* tant que le nombre de colonnes <5 */
				tab1[i][j]=j+1;	/* on rempli chaque valeur est plus grande de 1 que la précédente */
				printf("%2d ",tab1[i][j]);
			}
		} else {	/* et on met des espaces dès que notre tableau est rempli */
			for (j=0;j<nbrcolonne_1;j++) {
				printf("%2s "," ");
			}
		}
		if (i<nbrligne_2) {	/* ... et on doit donc faire en sorte d'arreter de remplire les tableaux d'ou ce if */
			printf("  ");
			for (j=0;j<nbrcolonne_2;j++) {	
				tab2[i][j]=j+1+tour;	/* chaque valeur + grande de 1 est +5 chaque pour chaque ligne */
			printf("%2d ",tab2[i][j]);
			}
			tour+=nbrcolonne_2;
		} else {	/* et on met des espaces dès que notre tableau est rempli */
			printf("  "); 	/* ce espace sert à faire une colonne séparatrice entre tab1 et tab2 */
			for (j=0;j<nbrcolonne_2;j++) {
				printf("%2s "," ");
			}
		}
		printf("  ");
		for (j=0;j<nbrcolonne_3;j++) {
			if ((i>0)&&(j<i)) {	/* sauf pour la 1ere ligne, tant que l'indice de la colonne
			est plus petit que l'indice de la ligne en gros ligne 1 on met 1 nombre car 0<1...*/
				tab3[i][j]=j+1;
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