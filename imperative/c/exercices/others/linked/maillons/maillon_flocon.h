#ifndef MAILLON_FLOCON_H
#define MAILLON_FLOCON_H
	
	struct maillon_flocon_s{
		double x;
		double y;
		struct maillon_flocon_s* precedent;
		struct maillon_flocon_s* suivant;
	};
	typedef struct maillon_flocon_s maillon_flocon;
	typedef maillon_flocon* flocon;

	maillon_flocon* creer_flocon(double x,double y,double largeur,char signe);
	maillon_flocon* ajouter_liste(int x,int y,maillon_flocon*prev,
		maillon_flocon* next);
	void afficher_flocon(flocon liste);
	void DetruireFlocon(flocon liste);
	double CalculerDistance(int x1,int y1,int x2,int y2);
	maillon_flocon* fractale(flocon liste);

	maillon_flocon* fractale(flocon liste);
	void fractaleSegment(flocon liste,maillon_flocon* cur,maillon_flocon* next,
	double distance);
	double Pythagore(double hypotenuse,double adjacent,double oppose);

#endif