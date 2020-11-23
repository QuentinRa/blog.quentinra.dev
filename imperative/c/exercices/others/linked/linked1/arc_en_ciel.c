/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<graph.h> /* bibliothèque graphique maison */
#include "../maillons/maillon_char.h"
#define gap_ligne 25
#define gap_lettres 25
#define xdep 50
#define ydep 100

int main(int argc, char * argv[]) {

	int x=xdep,y=ydep,indice,compteur=1;
	char *couleurs[nombre]=arc_en_ciel,buf[2]="";
	liste_char* liste=NULL;/* pointeur sur la liste */
	maillon_char* tmp=NULL,*i=NULL;

	if (argc<2){
		fprintf(stderr, "Usage : %s <text>*\n",argv[0]);
		return EXIT_FAILURE;
	}

	InitialiserGraphique();
	CreerFenetre(0,0,700,760);

	tmp = create_anneau_from_tab(couleurs);
	liste = &tmp;
	i = *liste;

	while(compteur<argc){
		for (x=xdep, indice=0; argv[compteur][indice]!='\0'; i=i->suivant,
		x+=gap_lettres,indice++){
			ChoisirCouleurDessin(CouleurParNom(i->element));
			buf[0]=argv[compteur][indice];
			EcrireTexte(x,y,buf,2);
		}
		y += gap_ligne;
		compteur++;
	}

	while(!SourisCliquee() || ToucheEnAttente()){}

	destruction_anneau(*liste);

	FermerGraphique();

	return EXIT_SUCCESS;
}