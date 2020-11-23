#include<stdio.h>
#include<stdlib.h>
#include<math.h> /* gcc -lm */

int main(int argc, char * argv[]) {
	double x1,x2,y1,y2,resultat1=0,resultat2=0,distance,x,y;

	do {
		if ((resultat1!=0)||(resultat1!=0)) {
			printf("Oups... Je crois que vous avez mal tapé :\"x,y\".\n\n");
		}
		printf("Entrez les coordonnées du 1er point (x,y):");
		resultat1=scanf("%lf,%lf",&x1,&y1);			/* ici 2 saisies donc résultat1=2 */
		printf("Entrez les coordonnées du 2e point (x,y):");
		resultat2=scanf("%lf,%lf",&x2,&y2);			/* ici 2 saisies donc résultat1=2 */
	} while ((resultat1!=2)||(resultat2!=2)); /* vérificaton saisie */

	 distance=sqrt(pow((x2-x1),2)+pow((y2-y1),2));
	 /*racine carré de (xb-xa)au carré + (yb-ya) au carré */

	printf("La distance entre A(%.2lf,%.2lf) et B(%.2lf,%.2lf) est de %.2lf\n",x1,y1,x2,y2,distance);

	return EXIT_SUCCESS;
}