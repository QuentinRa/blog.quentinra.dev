#include<stdio.h>
#include<stdlib.h>
/* compiler avec unalias gcc pour les commentaires // ou les changer */


int memb(int valeur, int size, int * tab);

int main(void){

	int valeur;
	int size;
	int i = 0;
	int* tab;

	printf("valeur recherchée : "); /* valeur */
	scanf("%d",&valeur);

	printf("size: ");	/* taille */
	scanf("%d",&size);

	tab = (int*) malloc(size*sizeof(int));

	while(i<size){ /* tableau */
		printf("valeur %d: ",i);
		scanf("%d",tab+i);
		i++;
	}

	printf("retour : %d\n",memb(valeur,size,tab));
}
