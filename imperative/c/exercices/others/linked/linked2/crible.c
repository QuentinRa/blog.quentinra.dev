/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include "../maillons/maillon_int.h"
#define max 1000

int main(int argc, char * argv[]) {

	int buf[max-1],indice;
	liste_int* liste=NULL;/* pointeur sur la liste */
	maillon_int* tmp=NULL;

	/* génération des 10 valeurs aléatoires */
	for (indice = 2; indice <= max; indice++){
		buf[indice-2]=indice;
	}
	
	tmp = create_liste_from_tab_int(buf,max-1);
	liste = &tmp;

	tmp = tri_par_nombre_premier(liste);
	liste = &tmp;

	afficher_liste(*liste);
	
	destruction_liste(*liste);

	return EXIT_SUCCESS;
}