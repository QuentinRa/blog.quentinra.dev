#include<stdio.h>
#include<stdlib.h>
#include "maillon_char.h"

/* char* */

liste_char create_anneau_from_tab(char **tableau_valeurs){
	int compteur=0;
	maillon_char* premier=NULL,*i;

	premier = ajouter_anneau(tableau_valeurs[compteur],NULL);

	for (i = premier,compteur=1; compteur < nombre; i = i->suivant,
		compteur++){
		i->suivant = ajouter_anneau(tableau_valeurs[compteur],NULL);
	}
	i->suivant=premier;

	return premier;
}

maillon_char* ajouter_anneau(char *valeur,maillon_char* suivant){
	maillon_char* element = (maillon_char*) malloc(sizeof(maillon_char));
	element->element=valeur;
	element->suivant=suivant;
	return element;
}

void afficher_anneau(const liste_char liste){
	maillon_char* i=NULL;
	i = liste;

	if (i!=NULL){
		do{
			fprintf(stdout,"| %s ",i->element );
			i=i->suivant;
		}while(i!=liste);
		fprintf(stdout, "|\n");
	} else {
		fprintf(stdout,"La liste est vide!\n");
	}
}

void destruction_anneau(liste_char liste){
	maillon_char* i=NULL,*tmp=NULL;
	i = liste;

	do{
		tmp = i;
		i=i->suivant;
		free(tmp);
	}while(i!=liste);
}

/* char */

liste_c create_liste_from_tab_c(char *tableau_valeurs){
	int compteur=0;
	maillon_c* premier=NULL,*i;

	premier = ajouter_c(tableau_valeurs[compteur],NULL);

	for (i = premier,compteur=1; tableau_valeurs[compteur]!= '\0'; i = i->suivant,
		compteur++){
		i->suivant = ajouter_c(tableau_valeurs[compteur],NULL);
	}

	return premier;
}

maillon_c* ajouter_c(char valeur,maillon_c* suivant){
	maillon_c* element = (maillon_c*) malloc(sizeof(maillon_c));
	element->element=valeur;
	element->suivant=suivant;
	return element;
}

void afficher_liste_c(const liste_c liste){
	maillon_c* i=NULL;
	i = liste;

	if (i!=NULL){
		do{
			fprintf(stdout,"%c",i->element );
			i=i->suivant;
		}while(i!=NULL);
		fprintf(stdout, "\n");
	} else {
		fprintf(stdout,"La liste est vide!\n");
	}
}

void destruction_liste_c(liste_c liste){
	maillon_c* i=NULL,*tmp=NULL;
	i = liste;

	do{
		tmp = i;
		i=i->suivant;
		free(tmp);
	}while(i!=NULL);
}

char *create_tab_from_liste_c(const liste_c liste){
	int capacite=10,compteur=0;
	char *tmp= (char*) malloc(capacite*sizeof(char));
	maillon_c* i;
	i = liste;

	while(i!=NULL){
		tmp[compteur]=i->element;
		if (compteur+1>capacite){
			capacite+=10;
			tmp = (char*) realloc(tmp,capacite*sizeof(char));
		}
		compteur++;
		i = i->suivant;
	}
	tmp[compteur]='\0';

	return tmp;
}

void putl(const liste_c liste){
	maillon_c* i=NULL;
	i = liste;

	/* Affichage */
	while(i!=NULL){
		fprintf(stdout,"%c",i->element );
		i=i->suivant;
	}
	fprintf(stdout, "\n");
}

char *fgetl(maillon_c* debut,int size,FILE *stream){
	int compteur=0;
	maillon_c* i=NULL,*tmp;
	i = debut;
	char c;

	/* lecture */
	while(compteur<size-1){
		c = getchar();
		if (c!='\n'){
			if (i->suivant==NULL){
				i->suivant=ajouter_c('\0',NULL);
			}
			i->element=c;
			tmp = i;
			i=i->suivant;
			compteur++;
		} else {
			/* si '\n' on quitte */
			compteur=size;
		}
	}
	/* destruction du reste de la liste */
	destruction_liste_c(i);
	/* l'avant dernier pointe sur NULL */
	tmp->suivant=NULL;
}

size_t listlen(const liste_c liste){
	size_t compteur=0;
	maillon_c* i=NULL;
	i = liste;
	if (i->suivant!=NULL){
		while(i!=NULL){
			compteur++;
			i=i->suivant;
		}
	}

	return compteur;
}

void listcpy(liste_c* destination,const liste_c* liste){
	maillon_c* tmp;
	tmp = *destination;
	*destination = *liste;
	destruction_liste_c(tmp);
}

void listcat(liste_c destination,const liste_c liste){
	maillon_c* i;
	i = destination;

	while(i->suivant!=NULL){
		i = i->suivant;
	}
	i->suivant = liste;
}

int listcmp(const liste_c liste1,const liste_c liste2){
	int differents=0,tmp;
	maillon_c* i,*j;
	i = liste1;
	j = liste2;

	while ((differents==0)&& (j->suivant!=NULL||i->suivant!=NULL)){
		if (i->element!=j->element){
			if (i->element!=tmp){
				return i->element;
			}
			if (j->element!=tmp){
				return -j->element;
			}
		} else {
			tmp = i->element;
		}
		if (i->suivant!=NULL){
			i = i->suivant;
		}
		if (j->suivant!=NULL)
			j = j->suivant;
	}

	return differents;
}