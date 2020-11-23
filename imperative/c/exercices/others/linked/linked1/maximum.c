/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include "../maillons/maillon_us.h"

int main(int argc, char * argv[]) {

	int indice;
	unsigned short buf[nombre];
	liste_us* liste=NULL;/* pointeur sur la liste */
	maillon_us* tmp=NULL;
	srand(time(NULL));

	/* génération des 10 valeurs aléatoires */
	for (indice = 0; indice < nombre; ++indice){
		buf[indice]=rand()%(max_rand-min_rand)+1+min_rand;
	}
	tmp = create_list_from_tab_us(buf);
	liste = &tmp;

	afficher_liste(*liste);

	fprintf(stdout,"%d\n",(max_liste(*liste))->element);
	
	destruction_liste(*liste);

	return EXIT_SUCCESS;
}