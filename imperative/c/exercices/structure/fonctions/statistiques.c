/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int i,j,nombre_de_e=0,longueur_check=1,presente=0,nombre_diffrents=0;
	char texte[200],differents[200];
	
	printf("texte:");
	fgets(texte,200,stdin);

	for (i=0;texte[i]!='\n'&&i<200;i++) {
		presente=0;
		if (texte[i]=='e'){
			nombre_de_e++;
		}
		for (j=0;j<longueur_check;j++) {
			if (texte[i]==differents[j]) {
				presente=1;
			}
		}
		if (presente==0) {
			differents[j-1]=texte[i];
		/* lors de la 1er boucle : on teste j=0 puis lorsqu'on sort j=1, je veut mettre
		dans la 1er case donc j-1 (la valeur avant la sortie de j) */
			longueur_check++;
		}
	}
	texte[i]='\0';
	
	printf("Nombre de caractère différents : %d\n",longueur_check-1);
	printf("Nombre de 'e' : %d\n",nombre_de_e);

	return EXIT_SUCCESS;
}