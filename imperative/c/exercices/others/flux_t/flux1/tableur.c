/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#define separateur ';'

int fcopen(char *path,char *mode,FILE **file);
int fstrlen(int valeur);

int main(int argc, char * argv[]) {

	int i,j,k;
	int tab1[2][5],tab2[3][5],tab3[5][5];
	FILE *file=NULL;

	/* Ouverture */
	if(fcopen("files/t1.csv","w",&file)==-1){
		return EXIT_FAILURE;
	}
	/* 1er tableau */
	for (i = 0; i < 2; i++){
		for (j = 0 ; j< 5; j++){
			tab1[i][j]=j+1;
			fprintf(file,"%d%c",tab1[i][j],separateur);
		}
		fprintf(file,"\n");
	}
	fclose(file);
	
	/* Ouverture */
	if(fcopen("files/t2.csv","w",&file)==-1){
		return EXIT_FAILURE;
	}
	/* 2eme tableau */
	for (i = 0,k=0; i < 3; i++){
		for (j = 0 ; j< 5; j++,k++){
			tab2[i][j]=k+1;
			fprintf(file,"%d%c",tab2[i][j],separateur);
		}
		fprintf(file,"\n");
	}
	fclose(file);

	/* Ouverture */
	if(fcopen("files/t3.csv","w",&file)==-1){
		return EXIT_FAILURE;
	}
	/* 3eme tableau */
	for (i = 0; i < 5; i++){
		for (j = 0; j < i && j<5; j++){
			tab3[i][j]=j+1;
			fprintf(file,"%d%c",tab3[i][j],separateur);
		}
		for (; j < 5; j++){
			tab3[i][j]=0;
			fprintf(file,"%d%c",tab3[i][j],separateur);
		}
		fprintf(file,"\n");
	}
	fclose(file);

	return EXIT_SUCCESS;
}

int fcopen(char *path,char *mode,FILE **file){
	*file = fopen(path,mode);
	if (!*file){
		fprintf(stderr,"Unable to open %s in write mode.\n",path);
		return -1;
	}
	return 0;
}

int fstrlen(int valeur){
	int quotient_10=10,taille=1;
	int var_absolue=valeur>=0?valeur:valeur*-1;
	
	while(var_absolue>=quotient_10){
		quotient_10*=10;
		taille++;
	}	

	return taille;
}