#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	unsigned entier1,reste;
	int i=0,j=0,k=0,l=0,tour=0,testeur=0;
	int icarre,jcarre,kcarre,lcarre;

	printf("Entrez un entier :");
	scanf("%d",&entier1);

	do{
		reste=entier1;	/* NOTE : reste est unsigned donc sa valeur minimale est 0 qui est un carre*/
		for (i=0;i*i<=reste;i++) {
			icarre=i-tour;	/* je prends le 1er carre de tel sorte que ce soit le plus grand puis à chaque
			tour qu'il soit moins grand de 1 par exemple 5carre au 1er tour puis 4carre au 2eme tour*/
		}
		reste-=(icarre*icarre);	/* le reste : entier 1 - 1er carré */

		for (j=0;j*j<=reste;j++) {
			jcarre=((((j+1)*(j+1))>reste)&&(tour>0))?(j-1):j; /* a part pour le 1er tour, si le carré que je vais
			avoir est plus grand que mon reste, ce qui donnerait reste négatif alors je diminue le carré de 1
			pour avoir un carré qui laisse le reste positif */
		}
		reste-=(jcarre*jcarre);	/* le reste : reste précédent - 2e carré */

		for (k=0;k*k<=reste;k++) {
			kcarre=((((k+1)*(k+1))>reste)&&(tour>2))?(k-1):k; /* même chose mais a part pour les tours 1 et 2 */
		}
		reste-=(kcarre*kcarre); /* le reste : reste précédent - 3e carré */

		for (l=0;l*l<=reste;l++) {
			lcarre=((((l+1)*(l+1))>reste)&&(tour>2))?(l-1):l; /* même chose mais a part pour les tours 1 et 2 */
		}
		testeur=(icarre*icarre)+(jcarre*jcarre)+(kcarre*kcarre)+(lcarre*lcarre);
		if (testeur==entier1) {
			printf("%d =%d+%d+%d+%d\n",entier1,icarre*icarre,jcarre*jcarre,kcarre*kcarre,lcarre*lcarre);
		}
		tour++;
	} while ((testeur==entier1));

	return EXIT_SUCCESS;
} 