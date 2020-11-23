/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int premiers(int nombre);

int main(int argc, char * argv[]) {
	int entier,n,i;
	unsigned int saisie;
	int *prem=NULL;
	prem = (int*) malloc(10*sizeof(int));

	/* prérempli le tableau de 10 */
	for (n=0,i=0;i<10;n++) {
		if (premiers(n)) {
			prem[i]=n;
			i++;
		}
	}
	
	while (saisie!=0) {
		printf("nombre ? ");
		scanf("%d",&saisie);
		if (saisie==0) {
			free(prem);
			return EXIT_SUCCESS;
		}
		/* on fait un calcul que si on a pas déja le nombre au rang n */
		if (saisie>10) {
			/* je realloue de la place */
			prem = (int*) realloc(prem,(saisie+1)*sizeof(int));
			for (n=0,i=0;i<saisie;n++) {
			/* je teste tous les nombres (n) et si j'en trouve un je le met dans le tableau */
				if (premiers(n)) {
					prem[i]=n;
					/* j'augmente alorsi */
					i++;
				}
			}
		}
		printf("i(%d)=%d\n",saisie,prem[saisie-1]);
		/* on commence a 0 <=> la 9e case contient le 10e ran (n=10) */
	}
	free(prem);
	return EXIT_SUCCESS;
}

int premiers(int nombre) {
	int premier=0,i;
	for (i=1;i<=nombre;i++) {
		if (nombre%i==0) {
			premier++;
		}
	}

	if (premier==2)
		return 1;
	else
		return 0;
}