#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	double vitesse_de_vol,vitesse_du_vent,distance,vitesse,temps_heures,temps_minutes;
	double reel,calcul=0,i;
	int chiffre_unite=0,chiffre_dixieme=0;

	printf("Quelle est la vitesse de l'avion (km/h) ?");
	scanf("%lf",&vitesse_de_vol);

	printf("Quelle est la vitesse du vent (km/h) ?\n(positive pour un vent contraire, negative pour un vent arrière)\n");
	scanf("%lf",&vitesse_du_vent);
	
	printf("Quelle est distance à parcourir en km ?");
	scanf("%lf",&distance);

	vitesse=vitesse_de_vol-vitesse_du_vent;
	/* car vent contraire réduit notre vitesse et vent arrière augmente */

	/* d = v * t donc t = d/v et v vitesse de l'avion+vitesse du vent ou -vitesse du vent*/

	temps_heures=distance/vitesse;	/*en heures*/
	printf("LE TEMPS est %lf.\n",temps_heures);

	calcul=temps_heures;
	if (calcul<10) {
		i=calcul;	/* si <10 alors le chiffre est déja celui des unités */
		chiffre_unite = (int) calcul;
		i=i-chiffre_unite;
	} else if (calcul>=10) {
		do {
			calcul-=10.0;
		} while (calcul>0);
		i = calcul;
		chiffre_unite = (int) (calcul+10.0);	/* parce que si on est sortit c'est que c'est négatif donc
		le chiffre d'avant (+10) est le bon */
	i=i+10.0-chiffre_unite;	/* donne un i entre 0 et 1 avec que les chiffres derrière la virgule */
	}
	temps_minutes=i;

	printf("La durée du vol est de %.lf heures et %.lf minutes\n",temps_heures,temps_minutes*60);

	return EXIT_SUCCESS;
}