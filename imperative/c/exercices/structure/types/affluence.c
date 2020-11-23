#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int j=1,nombrevisit_moyen;	/* j pour jour */
	double nombrevisit_jour=0,nombrevisit_total=0;
	
	while (j<=5) {
		printf("Nombre de visiteurs %s :",(j==1?"lundi":j==2?"mardi":j==3?"mercredi":j==4?"jeudi":j==5?"vendredi":0));
		/*remplace en fonction du jour par le jour #j'ai pas trouvé mieux*/
		scanf("%lf",&nombrevisit_jour);
		nombrevisit_total+=nombrevisit_jour;
		j++;
	}

	printf("Le nombre de visiteurs moyen est de %.0lf.\n",nombrevisit_total/5);

	/*	nombrevisit_moyen = (int) (nombrevisit_total/5);	/* car 5 jours de travail */
	/* SIL FAILAIT CONVERTIR */
	/* printf("Le nombre de visiteurs moyen est de %d.\n",nombrevisit_moyen); */

	return EXIT_SUCCESS;
}