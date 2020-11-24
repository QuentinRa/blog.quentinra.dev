/* Quentin Version:??? Date : 20/11/18 */
#include<stdio.h>
#include<stdlib.h>
#define file_top "files/top10"

typedef struct records_s{
	int score;
	char sigle[4];
}records;

int main(int argc, char * argv[]){

	int i;
	FILE* top10=NULL;
	records top[10];

	top10 = fopen(file_top,"r");
	if (!top10){
		fprintf(stderr, "open %s in read mode failed.\n",file_top);
		return EXIT_FAILURE;
	}

	for (i = 0; i < 10; i++){
		fread(top+i,sizeof(int)+3*sizeof(char),1,top10);
		top[i].sigle[3]='\0';
	}

	for (i = 0; i < 10; i++){
		fprintf(stdout,"%09d %s\n",top[i].score,top[i].sigle);
	}

	fclose(top10);

	return EXIT_SUCCESS;
}