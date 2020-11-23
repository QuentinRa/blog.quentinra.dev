/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

char menu();
void carre();
void triangle();

int main(int argc, char * argv[]) {
	char c;
	do {
		c=menu();
		if (c=='q'){
			printf("\nAu revoir...\n");
			return EXIT_SUCCESS;
		} else if (c=='1') {
			triangle();
		} else if (c=='2') {
			carre();
		}
	}while(c!='q');

	return EXIT_SUCCESS;
}

char menu() {
	char c;
	printf("_______________\n");
	printf(" 1) Triangle\n");
	printf(" 2) Carré\n");
	printf(" q) Quitter\n");
	printf("Votre choix ? ");
	scanf("%c",&c);

	return c;
}

void carre(){
	int hauteur,i,j;
	printf("\nHauteur ? ");
	scanf("%d",&hauteur);
	getchar();
	putchar('\n');
	for (j=0;j<hauteur;j++) {
		printf("*");
	}
	putchar('\n');
	for (i=hauteur-2;i>0;i--) {
		printf("*");
		for (j=hauteur-2;j>0;j--) {
			printf(" ");
		}
		printf("*\n");
	}
	for (j=0;j<hauteur;j++) {
		printf("*");
	}
	putchar('\n');
}

void triangle() {
	int hauteur,i,j;
	printf("\nHauteur ? ");
	scanf("%d",&hauteur);
	getchar();
	for (i=0;i<hauteur;i++) {
		for (j=0;j<i+1;j++) {
			printf("*");
		}
		putchar('\n');
	}
}