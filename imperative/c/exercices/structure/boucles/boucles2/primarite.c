#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	unsigned int entier1;
	int i,calcul,premier=0;

	printf("Entrez un entier >= 0 :");
	scanf("%d",&entier1);


	for(i=1;i<=entier1;i++) {	/* on commence à 1 car division par zéro impossible */
		calcul=entier1%i;		/* entier1 / i = 0 pour 1 et entier alors premier sinon nan */
		if (calcul==0) {
			premier++;
		}
	}

	if ((premier==2)&&(entier1!=0)) {	/* car zéro non premier et on pris pris sur N */
		printf("%d est un nombre premier.\n",entier1);
	} else { 
		printf("%d n'est pas un nombre premier...\n",entier1);
	}

	return EXIT_SUCCESS;
}
