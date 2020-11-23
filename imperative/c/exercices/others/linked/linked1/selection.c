/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include "../maillons/maillon_us.h"

int main(int argc, char * argv[]) {

	int indice,e1=0;
	unsigned short buf[nombre];
	liste_us* liste=NULL,*liste2=NULL;/* pointeur sur la liste */
	maillon_us* tmp=NULL;
	srand(time(NULL));

	/* génération des 10 valeurs aléatoires */
	for (indice = 0; indice < nombre; ++indice){
		buf[indice]=rand()%(max_rand-min_rand)+1+min_rand;
	}
	tmp = create_list_from_tab_us(buf);
	liste = &tmp;

	fprintf(stdout,"Liste non ordonée\n");
	afficher_liste(*liste);
	tmp = order_liste_decroissant(liste);
	liste2 = &tmp;
	fprintf(stdout,"Liste ordonée - décroissant\n");
	afficher_liste(*liste2);

	destruction_liste(*liste);

	return EXIT_SUCCESS;
}