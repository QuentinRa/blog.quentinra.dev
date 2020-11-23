/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<graph.h>
#define taille_transition 20

typedef struct rectangle {
	int x,y;
	int hauteur;
	int largeur;
}rectangle;

rectangle rectangleinitalisation(rectangle rec);

void dessigner_rectangle(rectangle rec);

void rectangle_translation(rectangle* rec);

void rotation90c(rectangle* rec);

int main(int argc, char * argv[]) {
	int stop=0,tmp=0,x,y;
	InitialiserGraphique();
	rectangle rec;
	CreerFenetre(20,20,1080,720);

	while(stop==0) {
		rec = rectangleinitalisation(rec);
		dessigner_rectangle(rec);
		rectangle_translation(&rec);
		dessigner_rectangle(rec);
		rotation90c(&rec);
		dessigner_rectangle(rec);

		if (ToucheEnAttente()) {
			Touche();
			stop=1;
		}
	}

	FermerGraphique();

	return EXIT_SUCCESS;
}

rectangle rectangleinitalisation(rectangle rec) {
	int tmp;

	EcrireTexte(200,20,"Cliquez une premiere fois",1);
	
	while(1) {
		if(SourisCliquee()) {
			rec.x=_X;
			rec.y=_Y;
			while(!SourisCliquee()) {
				EcrireTexteC(200,20,"Cliquez une premiere fois",1,CouleurParComposante(255,255,255));
				EcrireTexte(200,40,"Cliquez une seconde fois",1);
				if (ToucheEnAttente()) {
					return rec;
				}
			}
			EcrireTexteC(200,40,"Cliquez une seconde fois",1,CouleurParComposante(255,255,255));
			if (rec.x>_X) {
				tmp=rec.x;
				rec.x=_X;
				_X=tmp;
				rec.largeur=(_X-rec.x);
			} else {
				rec.largeur=(_X-rec.x);
			}
			if (rec.y>_Y) {
				tmp=rec.y;
				rec.y=_Y;
				_Y=tmp;
				rec.hauteur=(_Y-rec.y);
			} else {
				rec.hauteur=(_Y-rec.y);
			}
			return rec;
		}
	}
}

void dessigner_rectangle(rectangle rec) {
	RemplirRectangle(rec.x,rec.y,rec.largeur,rec.hauteur);
	ChoisirCouleurDessin(CouleurParComposante(0,0,0));
}

void rectangle_translation(rectangle* rec) {
	rec->x+=taille_transition;
	rec->y-=taille_transition;
	ChoisirCouleurDessin(CouleurParComposante(220,20,60));
}

void rotation90c(rectangle* rec) {
	int tmp;

	rec->y-=rec->largeur;
	tmp=rec->hauteur;
	rec->hauteur=rec->largeur;
	rec->largeur=tmp;
	ChoisirCouleurDessin(CouleurParComposante(255,215,0));
}