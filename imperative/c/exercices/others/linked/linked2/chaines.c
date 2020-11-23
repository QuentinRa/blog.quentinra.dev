/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include "../maillons/maillon_char.h"

int main(int argc, char * argv[]) {

	liste_c* liste=NULL;
	maillon_c *tmp;
	char chaine[]="Alalilala inspecteur gadget Héla qui voila... - Calistro 2019";
	char *chaine_vide=NULL;
	
	tmp = create_liste_from_tab_c(chaine);
	liste = &tmp;

	afficher_liste_c(*liste);

	chaine_vide = create_tab_from_liste_c(*liste);

	fprintf(stdout,"%s\n",chaine_vide);

	destruction_liste_c(*liste);

	free(chaine_vide);

	return EXIT_SUCCESS;
}