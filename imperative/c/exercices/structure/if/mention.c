#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int moyenne;
	do {
		printf("Entrez votre moyenne au BAC :");
		scanf("%d",&moyenne);
	} while ((moyenne<0)||(moyenne>20));		/*TOUTES les moyennes suivantes seront entre 0 et 20 forcément */

	if (moyenne<10) {								/* en dessous de dix : pas de BAC */
		printf("Vous n'avez ni le BAC ni une mention ... RIP\n");
	} else if ((moyenne>=10)&&(moyenne<12)) {		/* Entre [10;12[ : pas de mention, BAC */
		printf("Vous avez le BAC sans mention.\n");
	} else if ((moyenne>=12)&&(moyenne<14)) {		/* Entre [12;14[ : mention assez bien */
		printf("Vous avez le BAC mention assez bien.\n");
	} else if ((moyenne>=14)&&(moyenne<16)) {		/* Entre [14;16[ : mention bien */
		printf("Vous avez le BAC mention bien.\n");
	} else if (moyenne>=16) {						/* Entre [16;20[ : mention très bien */
		printf("Vous avez le BAC mention très bien.\n");
	}


	return EXIT_SUCCESS;
}