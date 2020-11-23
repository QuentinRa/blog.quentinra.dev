/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include "../maillons/maillon_char.h"

int main(int argc, char * argv[]) {

	liste_c* liste=NULL;
	maillon_c *tmp;
	char chaine[]="Alalilala inspecteur gadget Héla qui voila... - Calistro 2019";
	
	tmp = create_liste_from_tab_c(chaine);
	liste = &tmp;

	fgetl(*liste,10,stdin);
	putl(*liste);

	destruction_liste_c(*liste);

	return EXIT_SUCCESS;
}