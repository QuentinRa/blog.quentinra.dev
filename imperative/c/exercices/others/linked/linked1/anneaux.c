/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include "../maillons/maillon_int.h"

int main(int argc, char * argv[]) {

	int indice,e1;
	int buf[nombre];
	liste_int* liste=NULL;/* pointeur sur la liste */
	liste_int* somme=NULL;/* pointeur sur la liste */
	maillon_int* tmp=NULL;
	srand(time(NULL));

	/* génération des 10 valeurs aléatoires */
	for (indice = 0; indice < nombre; ++indice){
		buf[indice]=rand()%(max_rand-min_rand)+1+min_rand;
	}
	tmp = create_anneau_from_tab_int(buf);
	liste = &tmp;

	afficher_anneau(*liste);

	fprintf(stdout,"Combien additionner ? ");
	scanf("%d",&e1);

	tmp = addition_anneau(e1,*liste);
	somme = &tmp;
	afficher_anneau(*somme);
	
	destruction_anneau(*liste);

	return EXIT_SUCCESS;
}