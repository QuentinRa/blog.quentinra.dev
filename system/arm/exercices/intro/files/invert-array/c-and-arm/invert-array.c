#include<stdio.h>
#include<stdlib.h>

void invert(int size, int* tab);

void disp(int size, int* tab){
	int i;
	invert(size,tab);
	/*affiche*/
	for(i=0;i<size;i++){
		printf("%d\n",tab[i]);
	}
}

int main(int argc, char * argv[]){
	int tab[] = {1,3,5,7,9,11,16};
	int size = 7;

	disp(size,tab);
}