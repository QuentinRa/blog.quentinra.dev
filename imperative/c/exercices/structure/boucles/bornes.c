#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int entier1,entier2,min,max,stop;

	printf("Entrez des entiers (-1 pour finir la saisie) :\n");
	scanf("%d",&entier1);
	max=entier1,min=entier1;	/* la 1ere forcément et la plus grand et la plus petite */

	do {
		scanf("%d",&entier2);
		stop=entier2;	
		min=min<entier2?min:entier2;  /* si la précédente valeur tjrs la + petite, on la garde sinon on échange */
		max=max>entier2?max:entier2; /* si la précédente valeur tjrs la + grande, on la garde sinon on échange */

	} while (stop!=-1);

	printf("Le maximum est %d et le minimum est %d.\n",max,min);

	return EXIT_SUCCESS;
}