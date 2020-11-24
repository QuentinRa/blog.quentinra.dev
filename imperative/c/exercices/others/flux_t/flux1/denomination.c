/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define src "files/rgb.txt"

void verification_composantes(char *buf,char *argv[]);

int main(int argc, char * argv[]) {

	FILE *file=NULL;
	char buf[256];

	/* Arguments */
	if (argc!=4){
		fprintf(stderr, "Usage : %s <c1> <c2> <c3>\n",argv[0]);
		fprintf(stderr, "Exemple : %s 128 56 213\n",argv[0]);
		return EXIT_FAILURE;
	}
	/* ouverture */
	file = fopen(src,"r");
	if (!file){
		fprintf(stderr,"Unable to open %s in read mode.\n",argv[1]);
		return EXIT_FAILURE;
	}
	fgets(buf,256,file); /* absorbtion de la 1er ligne */
	
	while(!feof(file)){
		fgets(buf,256,file);
		verification_composantes(buf,argv);
	}

	fclose(file);

	return EXIT_SUCCESS;
}

void verification_composantes(char *buf,char *argv[]){
	int i=0,j=0,k,stop=0/*arrêt forcé (aucun match)*/,stop2=0;
	int capacite=0/*arguments match*/,present=0/*presence dans ... */;
	int checked[3]={-1,-1,-1}; /* les arguments qui on match */;
	int compteur;/* position dans le buf */
	char str[4]=""; /* chaine contenant la partie du buf a étudier */

	for (i = 0,compteur=0; i<3 && !stop ; i++){
		/* on isole la 1er composante */
		while(buf[compteur]!=' '&&buf[compteur]!='\t'){
			str[j]=buf[compteur];
			compteur++;
			j++;
		}
		/* on prepare le compteur pour la suivante */
		while(buf[compteur]==' '||buf[compteur]=='\t'){
			compteur++;
		}
		/* on regarde la composante pour les 3 arguments */
		for (j = 0; j < 3 && !stop2 ; j++){
			/* on regarde si ce n'est pas un argument qui a déja match */
			for(k = 0; k < capacite && present!=1 ; k++){
				if(checked[k]==j+1){
					present=1;
				}
			}
			if(!present){
				/* compare l'argument avec notre composante */
				if(strcmp(str,argv[j+1])==0){
					present=1;
					stop2=1;
				}
			} else {
				/* Si cet argument a déja match alors on le
				regarde pas mais on reset present pour le suivant */
				present=0;
			}
		}
		/* Si la comoosante a eu un match */
		if(present){
			/* on enregistre l'argv (son indice) avec qui elle a match */
			checked[capacite]=j;
			capacite++;
		} else {
			/* Sinon, il y a eu aucun match : on quitte */
			stop=1;
		}
		j=0,present=0,stop2=0; /* reset */
	}
	if(!stop){
		fprintf(stdout,"%s",(buf+compteur));
	}
}