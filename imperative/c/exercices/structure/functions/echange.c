/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define randmax 100 /* entre 0 et 100 soustrait 50 donc entre -50 et 50*/

void random(int *tab,int capacite);
void print_tab(int *tab,int capacite);
void swap(int *tab,int capacite);

int main(int argc, char * argv[]) {
	int tab[10];
	srand(time(NULL));

	random(tab,10);
	print_tab(tab,10);
	swap(tab,10);
	print_tab(tab,10);

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

void swap(int *tab,int capacite) {
	int i,tmp;

	for (i=0;i<capacite/2;i++) {
		tmp=tab[capacite-i-1];
		tab[capacite-i-1]=tab[i];
		tab[i]=tmp;
	}
}