#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	double reel,calcul=0,i;
	int chiffre_unite=0,chiffre_dixieme=0,tour=0;

	printf("Entrez un réel :");
	scanf("%lf",&reel);
	calcul=reel;

	if (calcul<10) {
		chiffre_unite = (int) calcul;		/* si <10 alors le chiffre est déja celui des unités */
		printf("chiffre_unite = %d\n",chiffre_unite);
	} else if (calcul>=10) {
		do {
			calcul-=10.0;
		} while (calcul>0);
		i = calcul;
		chiffre_unite = (int) (calcul+10.0);	/* parce que si on est sortit c'est que c'est négatif donc
		le chiffre d'avant (+10) est le bon */
	}
	i=i+10.0-chiffre_unite;	/* donne un i entre 0 et 1 avec que les chiffres derrière la virgule */

	while (i>0.1) {
		i-=0.1;		/* on compte juste le nombre de fois que l'on retire 0.1 */
		tour++;
	}
	chiffre_dixieme = tour; /* pas besoin de soustraire quoi que ce soit car le nombre tour commence à 0 donc 
	de 0 à x il y a x-1 tour sauf que nous c'est ce qu'on veut parce que le dernier est faux*/

	printf("chiffre des unités : %d\n",chiffre_unite);
	printf("chiffre des dixième : %d\n",chiffre_dixieme);

	return EXIT_SUCCESS;
}