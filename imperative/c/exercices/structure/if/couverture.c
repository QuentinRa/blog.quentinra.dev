#include<stdio.h>
#include<stdlib.h>
#define tauxfranchise 10
#define franchisemin 200
#define franchisemax 800

int main(int argc, char * argv[]) {
	int montant,partassure,partassurance;

	printf("Entrez le montant total des réparations :");
	scanf("%d",&montant);

	partassure = montant*tauxfranchise/100 ;

	if ((partassure>=franchisemin)&&(partassure<=franchisemax)) { /* si la part assuré [franchisemin,franchisemax]*/
		partassure = montant*tauxfranchise/100;					/*alors le client paye 10%, l'assurance le reste */
		partassurance = montant - partassure;
	} else if (partassure<franchisemin) {						/*si la part assuré < franchise min */
		partassure=montant<franchisemin?montant:franchisemin;	/* alors l'assuré paye la franchise minimum*/
		partassurance=partassure<montant?(montant-partassure):0;  /* l'assurance paye le reste ou rien*/
	} else if (partassure>franchisemax) {
		partassure= franchisemax;							/* si la part assuré > franchise max */
		partassurance= montant-franchisemax;			/*alors l'assurance paie tout sauf la franchise max */
	}

	printf("Pour un montant de %d€, vous payez %d€ et l'assurance payera %d€.\n",montant,partassure,partassurance);

	return EXIT_SUCCESS;
}