#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	unsigned int entier1,i,j,tmp=0,tmp2=0,premier=0,premin=0;

	do {
		printf("Entrez un entier :");
		scanf("%d",&entier1);		/* Entier naturel NON NULL (!=0)*/
	} while (entier1<=0);

	printf("%d = ",entier1);	/*affiche entier = */

	if (entier1%2==0) {	/*SI PAIR : affiche mtn : entier = 2 */ 
	/* plus petit entier pair est 2 car 0 non inclus mais combien de 2* après ? */
		putchar('2');
		entier1/=2;
		while (entier1%2==0) {
			printf("*2"); /* mtn : entier = 2*2*2...*/
			entier1/=2;
		}
		/* mtn : entier = 2*2*2...*reste (impair) */
		while (entier1!=1){
			for (i=2;i<=entier1;i++) {	/* de [2,entier] car 1 n'est pas premier et 0 exclu*/
				tmp=entier1%i;
				if (tmp==0) {
					printf("*%d",i);	/* on prends le plus petit diviseur a chaque fois */
					entier1/=i;	/* on divise entier1 par ce nombre pour recommence*/
				}
			}
		}
		putchar('\n');

	} else { /* Si LE nombre est IMPAIR */
		for (i=2;i<=entier1;i++) {	/* de [2,entier[ car on sait qu'il n'est pas premier*/
			tmp=entier1%i;
			if (tmp==0) {
				printf("%d",i);	/* on prends le plus petit diviseur a chaque fois */
				entier1=entier1/i;	/* on divise entier1 par ce nombre pour recommence*/
				break;	/* on sort pour recommencer mais avec * dans le printf */
			}
		}
		while (entier1!=1){
			for (i=2;i<=entier1;i++) {	/* de [2,entier[ car on sait qu'il n'est pas premier*/
				tmp=entier1%i;
				if (tmp==0) {
					printf("*%d",i);	/* on prends le plus petit diviseur a chaque fois */
					entier1/=i;	/* on divise entier1 par ce nombre pour recommence*/
				}
			}
		}
		putchar('\n');
	}

	return EXIT_SUCCESS;
}