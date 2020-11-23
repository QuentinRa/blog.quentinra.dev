/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#define capacitetab 3

void swap(char *tab,int capacite) {
	int i;
	char tmp;
	tab[capacite]='\0';

	for (i=0;i<capacite/2;i++) {
		tmp=tab[capacite-i-1];
		/* car le dernière case : '\0' */
		tab[capacite-i-1]=tab[i];
		tab[i]=tmp;
	}
}

int main(int argc, char * argv[]) {
	int i;

	for (i=argc;i>0;i--) {
		int x = strlen(argv[i-1]);
		swap(argv[i-1],x);
		printf("%s ",argv[i-1]);
		/* on veut le dernier en premier donc on commence par argc */
	}
	putchar('\n');

	return EXIT_SUCCESS;
}