/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char * argv[]){

	int i;
	FILE* file=NULL;
	
	if (argc!=3){
		fprintf(stdout,"%s <file> <encrypt|decrypt>\n", );
	}

	/* ouverture fichier a chiffrer */
	file = fopen(argv[1],"r");
	if (!file){
		fprintf(stderr, "open %s in read mode failed.\n",argv[1]);
		return EXIT_FAILURE;
	}

	/*for (i = 0; !feof(file) ; i++){
		fread(top+i,sizeof(int)+3*sizeof(char),1,file);
		top[i].sigle[3]='\0';
	}

	for (i = 0; i < 10; i++){
		fprintf(stdout,"%09d %s\n",top[i].score,top[i].sigle);
	}*/

	fclose(file);

	return EXIT_SUCCESS;
}