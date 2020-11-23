/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define randmax 100 /* entre 0 et 100 soustrait 50 donc entre -50 et 50*/

void random(int *tab,int capacite);
void print_tab(int *tab,int capacite);
void inverse(int *tab,int capacite,int *tabinverse);

int main(int argc, char * argv[]) {
	int tab[10],tabinverse[10];
	srand(time(NULL));

	random(tab,10);
	print_tab(tab,10);
	inverse(tab,10,tabinverse);
	print_tab(tabinverse,10);

	return EXIT_SUCCESS;
}

void random(int *tab,int capacite) {
	int i;
	for (i=0;i<capacite;i++) {
		tab[i]=(rand()%randmax)-50+1;
	}
}

void print_tab(int *tab,int capacite) {
	int i;
	putchar('|');
	for (i=0;i<capacite;i++) {
		printf("%3d |",tab[i]);
	}
	putchar('\n');
}

void inverse(int *tab,int capacite,int *tabinverse) {
	int i,j,tmp;

	for (i=capacite,j=0;i>0;i--,j++) {
		tabinverse[j]=tab[i-1];
	}
}