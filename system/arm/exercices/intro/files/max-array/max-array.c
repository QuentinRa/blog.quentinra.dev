#include<stdio.h>
#include<stdlib.h>

/*
int max(int taille, int* tableau){

	int i=1;
	int maximum=tableau[0];

	while(i<taille){
		if(tableau[i] > maximum) maximum=tableau[i];
		i++;
	}

	return maximum;
}*/

/* on appelle max.s donc on donne juste la signature */
int max(int taille, int* tableau);

int main(int argc, char * argv[]){
	
	int size;
	int *tab;
	int i;
	
	/* taille */
	printf("size:");
	scanf("%d",&size);
	
	/* valeurs */
	tab = (int*) malloc(size*sizeof(int));
	/* saisie */
	for(i=0;i<size;i++){
		printf("array[%d]=",i);
		scanf("%d",tab+i);
	}		

	/*
	*
	* Attention printf appelle max, on doit empiller les
	* registres de printf ou on les écrasera dans max
	*
	*/
	printf("maximum : %d\n",max(size,tab));
	
	return EXIT_FAILURE;
}
	