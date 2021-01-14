#include<stdio.h>
#include<stdlib.h>
/* compiler avec unalias gcc pour les commentaires // ou les changer */


int memb(int valeur, int size, int * tab){

	int i , min = 0, max = size-1;

	while(max!=min){ //tant qu'on a pas join les 2 bouts
		i = (max + min)/2;	//on trouve le milieu

		if(tab[i] == valeur){ //si c'est notre valeur : fini
			return i+1;

		//si au milieu la valeur est plus grande que celle recherchée
		//et ce n'est pas la valeur recherchée alors la valeur est entre min
		// et i-1 (-1 car ce n'est pas i)
		}else if(tab[i] > valeur){
			max = i-1;

		//si au milieu la valeur est plus petite que celle recherchée
		//et ce n'est pas la valeur recherchée alors la valeur est au minimum
		// i+1 (+1 car ce n'est pas i)	et max
		}else if(tab[i] < valeur){
			min = i+1;
		}

	}

	//on regarde si on a pas quitté alors que c'était cette valeur
	i = (max + min)/2;
	if(tab[i] == valeur){
		return i+1;
	}

	return -1;
}

//int memb(int valeur, int size, int * tab);

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
