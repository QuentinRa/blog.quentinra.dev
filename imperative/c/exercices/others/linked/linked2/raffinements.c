/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include "../maillons/maillon_char.h"

int main(int argc, char * argv[]) {

	liste_c* liste=NULL;
	maillon_c *tmp;
	char chaine[]="Héla qui voila inspecteur gadget Héla qui voila tutu...";
	
	tmp = create_liste_from_tab_c(chaine);
	liste = &tmp;

	/*
	size_t listlen(const liste_c liste);
	void listcpy(liste_c* destination,const liste_c* liste);
	void listcat(liste_c destination,const liste_c liste);
	int listcmp(const liste_c liste1,const liste_c liste2);
	*/

	destruction_liste_c(*liste);

	return EXIT_SUCCESS;
}