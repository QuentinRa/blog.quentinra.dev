#include<stdio.h>
#include<stdlib.h>
#include<graph.h>
#include<math.h>
#include "maillon_flocon.h"

maillon_flocon* creer_flocon(double x,double y,double largeur,char signe){
	int compteur=0,signev=-1;
	maillon_flocon* premier;
	maillon_flocon *i; /* indice */
	if (signe=='-')
		signev=1;

	premier = ajouter_liste(x,y,NULL,NULL);
	i = premier;
	i->suivant = ajouter_liste(x+largeur/2,y+(Pythagore(largeur,0.0,largeur/2.0)*
		signev),i,NULL);
	i = i->suivant;
	i->suivant = ajouter_liste(x+largeur,y,i,NULL);
	i = i->suivant;
	i->suivant = premier;
	premier->precedent=i;

	return premier;
}

maillon_flocon* ajouter_liste(int x,int y,maillon_flocon*prev,maillon_flocon* next){
	maillon_flocon* element = (maillon_flocon*) malloc(sizeof(maillon_flocon));
	element->x=x;
	element->y=y;
	element->suivant=next;
	element->precedent=prev;
	return element;
}

void afficher_flocon(flocon liste){
	maillon_flocon *i; /* indice */
	i = liste;

	/*do{
		fprintf(stdout,"|x=%lf",i->x);
		i=i->suivant;
	}while(i!=liste&&i!=NULL);
	fprintf(stdout,"|\n");
	i = liste;
	do{
		fprintf(stdout,"|y=%lf : ",i->y);
		if (i->suivant!=NULL){
			DessinerSegment(i->x,i->y,i->suivant->x,i->suivant->y);
		}
		i=i->suivant;
	}while(i!=liste&&i!=NULL);
	fprintf(stdout,"|\n");
	i = liste;*/
	do{
		fprintf(stdout,"%p | %p \n",i,i->suivant);
		if (i->suivant!=NULL)
		DessinerSegment(i->x,i->y,i->suivant->x,i->suivant->y);
		i=i->suivant;
		Touche();
	}while(i!=liste&&i!=NULL);
	fprintf(stdout,"\n");
}

void DetruireFlocon(flocon liste){
	maillon_flocon *i,*tmp;
	i = liste;

	do{
		tmp = i;
		i=i->suivant;
		free(tmp);
	}while(i!=liste&&i!=NULL);
}

double CalculerDistance(int x1,int y1,int x2,int y2){
	double distance;
	return distance=sqrt(pow((x2-x1),2)+pow((y2-y1),2));
}

maillon_flocon* fractale(flocon liste){
	maillon_flocon *i,*tmp; /* indice */
	double distance;
	i = liste;

	do{
		tmp = i->suivant;
		if (i->suivant!=NULL){
			distance = CalculerDistance(i->x,i->y,i->suivant->x,i->suivant->y);
			distance/=3.0;
			fractaleSegment(liste,i,i->suivant,distance);
		}
		i=tmp;
		break;
	}while(i!=liste&&i!=NULL);
}

void fractaleSegment(flocon liste,maillon_flocon* cur,maillon_flocon* next,
	double distance){
	
	maillon_flocon *i;

	/*cur->suivant= creer_flocon(cur->x+distance,cur->y,distance,'-');*/
	/*i = cur->suivant;
	do{
		i = i->suivant;
	}while(i->suivant!=cur->suivant);
	i->suivant=i->suivant;
	i->suivant=next;*/
	cur->suivant=ajouter_liste(cur->x+distance,cur->y+
		Pythagore(distance,0.0,distance/2.0),cur,NULL);
	i = cur->suivant;
	i->suivant=next;
}

double Pythagore(double hypotenuse,double adjacent,double oppose){
	if (hypotenuse==0.0 && adjacent!=0.0 && oppose!=0.0 )
		return sqrt(adjacent*adjacent+oppose*oppose);
	if (hypotenuse!=0.0 && adjacent==0.0 && oppose!=0.0)
		return sqrt(hypotenuse*hypotenuse-oppose*oppose);
	if (hypotenuse!=0.0 && adjacent!=0.0 && oppose==0.0)
		return sqrt(hypotenuse*hypotenuse-adjacent*adjacent);
	return 0.0;
}