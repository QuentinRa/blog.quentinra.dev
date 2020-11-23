#include<stdio.h>
#include<stdlib.h>
#include "maillon_us.h"

liste_us create_list_from_tab_us(unsigned short *tableau_valeurs){
	int compteur=0;
	maillon_us *premier;/* premier element de la liste */
	maillon_us *indice; /* indice */

	/* création du premier element*/
	premier = ajouter_liste(tableau_valeurs[compteur],NULL);

	for (indice = premier,compteur=1; compteur < nombre; indice=indice->suivant,compteur++){
		indice->suivant = ajouter_liste(tableau_valeurs[compteur],NULL);
	}

	return premier;
}

maillon_us* ajouter_liste(unsigned short valeur,maillon_us* suivant){
	maillon_us* element = (maillon_us*) malloc(sizeof(maillon_us));
	element->element=valeur;
	element->suivant=suivant;
	return element;
}

void destruction_liste(liste_us liste){
	maillon_us* i,*tmp=NULL;
	i=liste;
	while(i!=NULL){
		tmp=i;
		i=i->suivant;
		free(tmp);
	}
}

void afficher_liste(const liste_us liste){
	maillon_us* i;
	i=liste;
	while(i!=NULL){
		fprintf(stdout,"| %4d ",i->element);
		i=i->suivant;
	}
	liste!=NULL?printf("|\n"):printf("liste vide\n");
	/* CHECK BY ADDRESSE
	i=liste;
	while(i!=NULL){
		fprintf(stdout,"%p|%d -- %p|\n",i,i->element,i->suivant);
		i=i->suivant;
	}
	putchar('\n'); */
}

maillon_us* max_liste(const liste_us liste){
	maillon_us* i;
	maillon_us* max = liste;
	i=liste->suivant;
	while(i!=NULL){
		if (i->element>max->element){
			max=i;
		}
		i=i->suivant;
	}
	return max;
}

unsigned short destruction_dernier(liste_us liste){
	maillon_us *i,*tmp;
	unsigned short retour;
	i=liste;
	while(i->suivant->suivant!=NULL){
		i=i->suivant;
	}
	retour=i->suivant->element;
	tmp = i->suivant;
	i->suivant=NULL;
	free(tmp);
	return retour;
}

unsigned short destruction_premier(liste_us *liste){
	maillon_us* i,*tmp;
	unsigned short valeur;
	tmp = (*liste)->suivant;
	valeur = (*liste)->element;
	free(*liste);
	*liste = tmp;

	return valeur;
}

unsigned short ajout_element_fin(unsigned short valeur,liste_us liste){
	maillon_us* i;
	i=liste;
	while(i->suivant!=NULL){
		i=i->suivant;
	}
	i->suivant=ajouter_liste(valeur,NULL);
}

void permutation(liste_us *liste,int decallage){
	int compteur=0;
	if (decallage>0){
		while(compteur<decallage){
			*liste = ajouter_liste(destruction_dernier(*liste),*liste);
			compteur++;
		}
	}
	if (decallage<0){
		while(compteur>decallage){
			ajout_element_fin(destruction_premier(liste),*liste);
			compteur--;
		}
	}
}

unsigned short supprimer_max(liste_us* liste){
	maillon_us* i;
	maillon_us* maillon_a_retirer;
	maillon_a_retirer =  max_liste(*liste);
	unsigned short max=maillon_a_retirer->element;
	i=*liste;

	while(i!=NULL/* on a un suivant*/&& i->suivant!=maillon_a_retirer/*ce n'est pas
	celui qui précède celui que l'on veut retirer*/){
		i=i->suivant;
	}
	if (i!=NULL){
		i->suivant=i->suivant->suivant;
		free(maillon_a_retirer);
	} else {
		(*liste)=(*liste)->suivant;
		free(maillon_a_retirer);
	}

	return max;
}

liste_us order_liste_decroissant(liste_us* liste){
	maillon_us *premier;/* premier element de la liste */
	maillon_us *i;
	unsigned short max;
	max = supprimer_max(liste);
	premier = ajouter_liste(max,NULL);
	i = premier;
	
	while(*liste!=NULL){
		max = supprimer_max(liste);
		i->suivant = ajouter_liste(max,NULL);
		i = i->suivant;
	}

	return premier;
}