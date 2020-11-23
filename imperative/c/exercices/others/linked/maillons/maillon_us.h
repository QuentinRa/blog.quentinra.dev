#ifndef MAILLON_US_H
#define MAILLON_US_H

	#define nombre 10
	#define min_rand 111
	#define max_rand 999
	
	/* maillon (us) */
	struct maillon_s_us{
		unsigned short element;
		struct maillon_s_us* suivant;
	};
	typedef struct maillon_s_us maillon_us;
	typedef maillon_us* liste_us;
	
	liste_us create_list_from_tab_us(unsigned short *tableau_valeurs);
	maillon_us* ajouter_liste(unsigned short valeur,maillon_us* suivant);
	void destruction_liste(liste_us liste);
	void afficher_liste(const liste_us liste);
	maillon_us* max_liste(const liste_us liste);
	unsigned short ajout_element_fin(unsigned short valeur,liste_us liste);
	unsigned short supprimer_max(liste_us* liste);
	liste_us order_liste_decroissant(liste_us* liste);

	unsigned short destruction_dernier(liste_us premier);
	void permutation(liste_us *liste,int decallage);

#endif