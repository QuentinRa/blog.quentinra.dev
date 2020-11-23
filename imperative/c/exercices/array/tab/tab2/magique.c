#include<stdio.h>
#include<stdlib.h>
#define taille_ligne 3
#define taille_colonne 3
/* si on veut un tableau de x ON CHANGE LES DEUX valeurs avec x elle sont uniquement 
séparés pour le côté visuel mais un carre a deux côtés de même longueur...*/

int main(int argc, char * argv[]) {
	int i,j,carre[taille_ligne][taille_colonne],magique=0,nlr=0;
	int testeur=0,test[taille_ligne*taille_colonne]={0},somme_colonne[taille_colonne]={0};
	int somme_ligne[taille_ligne]={0},somme_diagonale1=0,valeur=0,somme_diagonale2=0;
	/*int(2) : assigne un tableau test de x * y, on commence à zéro, on rangera dans ce les
	valeurs de un à 9 dans les emplacements de 0 à 8 et si une valeur vaut toujours zéro 
	alors il y en as au moins une d'identique */

	for (i=0;i<taille_ligne;i++) {
		for (j=0;j<taille_colonne;j++) {
			testeur=0;
			printf("Quelle chiffre [1-9] voulez vous (ligne %d, colonne %d)? ",i+1,j+1);
			scanf("%d",&carre[i][j]);	/* On demande les chiffres */
			if ((carre[i][j]<1)||(carre[i][j]>9)) {
				printf("Le carré n'est pas magique.\n");
				return EXIT_SUCCESS;
			}
			/*test 1 : tous les nombres sont entre 1 et 9 */
			testeur=carre[i][j];
			test[testeur-1]=carre[i][j];	/* car on commence à zéro (cases) */
			somme_colonne[j]+=carre[i][j]; /* additionne tous les j=0... donc ceux de la 1ere colonne */
			somme_ligne[i]+=carre[i][j]; /* additionne tous les i=0... donc ceux de la 1ere ligne */
			if (i==j) {
				somme_diagonale1+=carre[i][j];
			}
		}
	}

	for (i=0;i<taille_ligne;i++) {			/* On affiche le carré */
		for (j=0;j<taille_colonne;j++) {
			printf("%2d",carre[i][j]);
		}
		putchar('\n');
	}

	for (i=0;i<taille_ligne*taille_colonne;i++) {	/*test 2 : aucun valeur n'est répétée */
		if (test[i]==0) {
			printf("Le carré n'est pas magique.\n");
			return EXIT_SUCCESS;
		}
	}
	valeur=somme_colonne[0];
	for (i=1;i<taille_colonne;i++) {		/*test 3 : vérifie somme des colonnes */
		if (somme_colonne[i]!=valeur) {
			printf("Le carré n'est pas magique.\n");
			return EXIT_SUCCESS;
		}
	}
	for (i=0;i<taille_ligne;i++) {		/*test 4 : vérifie somme des lignes */
		if (somme_ligne[i]!=valeur) {
			printf("Le carré n'est pas magique.\n");
			return EXIT_SUCCESS;
		}
	}

	if (valeur!=somme_diagonale1) {		/* test 5 : vérifie somme de la 1ere diagonale */
		printf("Le carré n'est pas magique.\n");
			return EXIT_SUCCESS;
	}

	for (i=0;i<taille_colonne;i++) { /* nlr un limiteur pour que l'on prenne max 1 nombre par ligne */
		nlr=0;
		for (j=taille_colonne-1-i;nlr==0;nlr++)	{	/* un carré [0,x] à x-1 emplacemnts et la on veut encore
			réduire de un certain nombre de cases par lignes pour avoir la diagonales qui est i */
			somme_diagonale2+=carre[i][j];
		}
	}
	
	if (valeur!=somme_diagonale1) {		/* test 5 : vérifie somme de la 2eme diagonale */
		printf("Le carré n'est pas magique.\n");
			return EXIT_SUCCESS;
	}

	printf("Le carré est magique.\n");

	return EXIT_SUCCESS;
}