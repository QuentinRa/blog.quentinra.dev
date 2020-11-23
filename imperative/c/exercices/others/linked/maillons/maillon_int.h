#ifndef MAILLON_INT_H
#define MAILLON_INT_H
	
	#define nombre 10
	#define min_rand 111
	#define max_rand 999
	
	/* maillon (int) */
	struct maillon_s_int{
		int element;
		struct maillon_s_int* precedent;
		struct maillon_s_int* suivant;
	};
	typedef struct maillon_s_int maillon_int;
	typedef maillon_int* liste_int;

	maillon_int *create_anneau_from_tab_int(int *tableau_valeurs);
	maillon_int* ajouter_element(int valeur,maillon_int* precedent,
		maillon_int* suivant);
	void afficher_anneau(const liste_int liste);
	void destruction_anneau(liste_int liste);
	void afficher_element(const maillon_int* element);
	maillon_int* previous(maillon_int* current);
	maillon_int* next(maillon_int* current);
	int get_if_current_value_null(maillon_int* current);
	maillon_int* addition_anneau(int valeur,liste_int liste);

	maillon_int *create_liste_from_tab_int(int *tableau_valeurs,int capacite);
	void afficher_liste(const liste_int liste);
	void destruction_liste(liste_int liste);
	maillon_int* ajouter_element_liste(int valeur,maillon_int* precedent,
		maillon_int* suivant);
	maillon_int *tri_par_nombre_premier(liste_int* liste);
	int destruction_element(maillon_int *element);
	int destruction_premier(liste_int *liste);

#endif