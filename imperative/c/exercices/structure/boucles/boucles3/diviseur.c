#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int a,b,tmp=0,entier1,entier2;

	printf("Entrez un premier entier :");
	scanf("%d",&entier1);
	printf("Entrez un deuxième entier :");
	scanf("%d",&entier2);

	a=entier1,b=entier2;	/* pgcd (a,b) */

	while (b!=0) {
		tmp=b;
		b=a%b;
		a=tmp;
	}

	/* pgcd (a,b) si b=0 = a */
	printf("Le plus grand diviseur commun de %d et %d est %d\n",entier1,entier2,a); 

	return EXIT_SUCCESS;
}
