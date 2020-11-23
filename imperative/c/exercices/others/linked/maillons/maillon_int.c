#include<stdio.h>
#include<stdlib.h>
#include "maillon_int.h"

maillon_int *create_anneau_from_tab_int(int *tableau_valeurs){
	int compteur=0;
	maillon_int* premier=NULL,*i;

	premier = ajouter_element(tableau_valeurs[compteur],NULL,NULL);

	for (i = premier,compteur=1; compteur < nombre; i = i->suivant,
		compteur++){
		i->suivant = ajouter_element(tableau_valeurs[compteur],i,NULL);
	}
	i->suivant=premier;
	premier->precedent=i;

	return premier;
}

maillon_int* ajouter_element(int valeur,maillon_int* precedent,maillon_int* suivant){
	maillon_int* element = (maillon_int*) malloc(sizeof(maillon_int));
	element->element=valeur;
	element->precedent=precedent;
	element->suivant=suivant;
	return element;
}

void afficher_anneau(const liste_int liste){
	maillon_int* i=NULL;
	i = liste;

	if (i!=NULL){
		do{
			afficher_element(i);
			i=i->suivant;
		}while(i!=liste);
		fprintf(stdout, "|\n");
	} else {
		fprintf(stdout,"La liste est vide!\n");
	}
}

void afficher_element(const maillon_int* element){
	fprintf(stdout,"| %d ",element->element );
	/*
	fprintf(stdout,"%p|%d %p\n",element,element->element,element->suivant);
	*/
}

void destruction_anneau(liste_int liste){
	maillon_int* i=NULL,*tmp=NULL;
	i = liste;

	do{
		tmp = i;
		i=i->suivant;
		free(tmp);
	}while(i!=liste);
}

maillon_int* previous(maillon_int* current){
	return current->precedent;
}

maillon_int* next(maillon_int* current){
	return current->suivant;
}

int get_if_current_value_null(maillon_int* current){
	return current->element==0?1:0;
}

maillon_int* addition_anneau(int valeur,liste_int liste){
	int compteur=0;
	maillon_int *i;
	i=liste;

	if (valeur>0){
		while(compteur<valeur){
			i = previous(i);
			compteur++;
		}
		return i;
	}
	if(valeur<0){
		while(compteur>valeur){
			i=next(i);
			compteur--;
		}
		return i;
	}
}

maillon_int* produit_anneau(int quotient,liste_int liste){
	int compteur=0;
	maillon_int *i;
	i=liste;

	if (quotient>0){
		while(compteur<quotient){
			i = previous(i);
			compteur++;
		}
		return i;
	}
	if(quotient<0){
		while(compteur>quotient){
			i=next(i);
			compteur--;
		}
		return i;
	}
}

maillon_int *create_liste_from_tab_int(int *tableau_valeurs,int capacite){
	int compteur=0;
	maillon_int* premier=NULL,*i;

	premier = ajouter_element_liste(tableau_valeurs[compteur],NULL,NULL);

	for (i = premier,compteur=1; compteur < capacite; i = i->suivant,
		compteur++){
		i->suivant = ajouter_element_liste(tableau_valeurs[compteur],i,NULL);
	}

	return premier;
}

maillon_int* ajouter_element_liste(int valeur,maillon_int* precedent,
	maillon_int* suivant){
	maillon_int* element = (maillon_int*) malloc(sizeof(maillon_int));
	element->element=valeur;
	element->precedent=precedent;
	element->suivant=suivant;
	return element;
}

void afficher_liste(const liste_int liste){
	maillon_int* i=NULL;
	i = liste;

	if (i!=NULL){
		while(i!=NULL){
			afficher_element(i);
			i=i->suivant;
		}
		fprintf(stdout, "|\n");
	} else {
		fprintf(stdout,"La liste est vide!\n");
	}
}

void destruction_liste(liste_int liste){
	maillon_int* i=NULL,*tmp=NULL;
	i = liste;

	while(i!=NULL){
		tmp = i;
		i=i->suivant;
		free(tmp);
	}
}

maillon_int *tri_par_nombre_premier(liste_int* liste){
	maillon_int* i=NULL,*j=NULL;
	maillon_int* premier=NULL;
	i = *liste;
	premier = ajouter_element_liste((*liste)->element,NULL,NULL);
	destruction_premier(liste);
	j = premier;

	while(*liste!=NULL){
		while(i!=NULL){
			if (i->element%j->element==0){
				destruction_element(i);
			}
			i = i->suivant;
		}
		i = *liste;
		j->suivant=ajouter_element_liste((*liste)->element,j,NULL);
		j = j->suivant;
		destruction_premier(liste);
	}
	
	return premier;
}

int destruction_element(maillon_int *element){	
	if(element->suivant!=NULL&&element->precedent!=NULL){

		element->precedent->suivant=element->suivant;
		element->suivant->precedent=element->precedent;
	} else if(element->suivant==NULL){

		element->precedent->suivant=element->suivant;
	} else if(element->precedent==NULL){
		element->suivant->precedent=element->precedent;
	}
}

int destruction_premier(liste_int *liste){
	maillon_int* i,*tmp;
	int valeur;
	tmp = (*liste)->suivant;
	valeur = (*liste)->element;
	free(*liste);
	*liste = tmp;

	return valeur;
}