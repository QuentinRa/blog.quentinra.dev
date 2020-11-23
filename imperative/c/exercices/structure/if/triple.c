#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	unsigned int entier,calcul;
	printf("Entrez un entier naturel (>= 0) :");
	scanf("%d",&entier);

	calcul=entier%3;

	if (calcul==0) {
		printf("%d était déja le multiple de 3 le plus proche !\n",entier);
		/*s'il reste 0 alors entier/3 = 0 donc multiple*/
	} else if (calcul==1) {
		printf("%d est le multiple de 3 le plus proche !\n",entier-1);
		/*s'il reste 1 on retire 1 : entier/3 = 1 -1 = 0 donc multiple inférieur*/
	} else if (calcul==2) {
		printf("%d est le multiple de 3 le plus proche !\n",entier+1);
		/*s'il reste 2 on ajoute 1 pour atteindre 3 : entier/3= 2 +1 = 3 = 0 donc multiple supérieur*/
	}

	return EXIT_SUCCESS;
}