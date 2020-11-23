#include<stdio.h>
#include<stdlib.h>
#define piecede2 2.00
#define piedede20 0.20
#define piedede1 0.01

int main(int argc, char * argv[]) {
	double monnaie;
	int nombre_piece2=0,nombre_piece20=0,nombre_piece01=0;

	printf("Combien avez vous payé ?");
	scanf("%lf",&monnaie);

	if (monnaie>=piecede2) {/* si la monnaie que j'ai est supérieure ou égale à 2€ donc on peut 
	me donner au moins une pièce sinon je peut passer à la boucle suivante*/
		while ((monnaie-piecede2)>=0) {
			monnaie-=piecede2;
			nombre_piece2++;
		}
	}
	if (monnaie>=piedede20) {	/* si la monnaie qui me reste est supérieure ou égale à 20 centimes donc on peut 
	me donner au moins une pièce sinon je peut passer à la boucle suivante*/
		while ((monnaie-piedede20)>=0) {
			monnaie-=piedede20;
			nombre_piece20++;
		}
	}
	if (monnaie>=piedede1) { /* si la monnaie qui me reste est supérieure ou égale à 20 centimes donc on peut 
	me donner au moins une pièce sinon on a plus rien donc fini*/
		while ((monnaie-piedede1)>=0) {
			monnaie-=piedede1;
			nombre_piece01++;
		}
	}

	printf("Vous devez avoir reçu %d x 2€, %d x 0.20c et %d x 0.01c.\n",nombre_piece2,nombre_piece20,nombre_piece01);

	return EXIT_SUCCESS;
}