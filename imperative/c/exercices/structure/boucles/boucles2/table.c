#include<stdio.h>
#include<stdlib.h>
#define taille_table 10

int main(int argc, char * argv[]) {
	int j,i,quotient;	/* i = colonne ; j = ligne */

	printf("  X  |");
	for (i=0;i<=taille_table;i++) {		/*1ere ligne du tableau */
		printf("%4d",i);
	}
	putchar('\n');

	printf("-----+");	
	for (i=0;i<=taille_table;i++) {		/*2eme ligne du tableau */
		printf("----");
	}
	putchar('\n');

	for (j=0;j<=taille_table;j++) {		/* coeur : on écrit à chaque ligne la 1ere colonne */
		printf("%3d  |",j);			/* celle la */
		for (i=0;i<=taille_table;i++) {	/* puis dans chaque colonne */
			printf("%4d",j*i);	/*on écrit la ligne x colonne */
		}
		putchar('\n');
	}
	putchar('\n');

	return EXIT_SUCCESS;
}
