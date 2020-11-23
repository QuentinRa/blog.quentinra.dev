#ifndef MAILLON_CHAR_H
#define MAILLON_CHAR_H

	#define nombre 7
	#define arc_en_ciel {"red","orange","yellow","green","blue","purple","pink"}
	
	/* maillon (char*) */
	struct maillon_s_char{
		char* element;
		struct maillon_s_char* suivant;
	};
	typedef struct maillon_s_char maillon_char;
	typedef maillon_char* liste_char;

	liste_char create_anneau_from_tab(char **tableau_valeurs);
	maillon_char* ajouter_anneau(char *valeur,maillon_char* suivant);
	void afficher_anneau(const liste_char liste);
	void destruction_anneau(liste_char liste);

	/* maillon (char) */

	struct maillon_s_c{
		char element;
		struct maillon_s_c* suivant;
	};
	typedef struct maillon_s_c maillon_c;
	typedef maillon_c* liste_c;

	liste_c create_liste_from_tab_c(char *tableau_valeurs);
	maillon_c* ajouter_c(char valeur,maillon_c* suivant);
	void afficher_liste_c(const liste_c liste);
	void destruction_liste_c(liste_c liste);
	char *create_tab_from_liste_c(const liste_c liste);
	void putl(const liste_c liste);
	char *fgetl(maillon_c* debut,int size,FILE *stream);
	size_t listlen(const liste_c liste);
	void listcpy(liste_c* destination,const liste_c* liste);
	void listcat(liste_c destination,const liste_c liste);
	int listcmp(const liste_c liste1,const liste_c liste2);

#endif