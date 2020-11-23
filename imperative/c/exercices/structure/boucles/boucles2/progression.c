#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	unsigned int n,n_e_terme,Un,Uzero=0,Uun=1;

	do {
		printf("Entrez un n >= 2 :");
		scanf("%d",&n_e_terme);
	} while (n_e_terme<2);

	for (n=2;n<=n_e_terme;n++) 	{
		Un=Uzero+Uun;		/* a chaque terme le dernier terme additionne devient */
		Uzero=Uun;		/* le 1er (et donc l'ancien premier disparait) */
		Uun=Un;		/* et le nouveau second terme est le résultat du précédent calcul*/
	}

	printf("Le %dème terme de la suite de Fibonacci est %d.\n",n_e_terme,Un);

	return EXIT_SUCCESS;
}
