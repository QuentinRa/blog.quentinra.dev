#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]) {
	int entier1,entier2,entier3,tmp,resultat=0;

	printf("Entrez un premier entier :\n");
	scanf("%d/",&entier1);
	printf("Entrez un second entier :\n");
	scanf("%d",&entier2);
	printf("Entrez un troisième entier :\n");
	scanf("%d",&entier3);

	if (entier1>entier2) {
		tmp=entier2;			/* si entier1 est plus grand que entier2 alors on*/
		entier2=entier1;		/* échange leurs valeur sinon c'est déja bon*/
		entier1=tmp;			/*donc maintenant entier1 < entier2*/
	}

	if (entier2>entier3) {		
		tmp=entier3;			/* si entier2 est plus grand que entier3 alors on*/
		entier3=entier2;		/* échange leurs valeur sinon c'est déja bon*/
		entier2=tmp;			/*donc maintenant entier1 ?<? entier2 < entier 3 */
	}

	if (entier2<entier1) {
		tmp=entier2;			/* si entier2 est plus petit que entier1 alors on*/
		entier2=entier1;		/* échange leurs valeur sinon c'est déja bon*/
		entier1=tmp;			/*donc maintenant entier1 < entier2 < entier 3 */
	}

	printf("%d < %d < %d \n",entier1,entier2,entier3);

	return EXIT_SUCCESS;
}