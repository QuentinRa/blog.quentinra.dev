#include<stdio.h>
#include<stdlib.h>

int main(void) {
	long long int n = 32217268732456802LL;
	printf("%s\n",&n);
	/* affiche bonjour (avec WARNING) */
	/*printf("%x\n",n);*/
	/* 6a 6e 6f 62 correspond à j n o b (man ascii - hex) on remarque
	que jnob et le systètique de bonj (le début de bonjour) donc logiquement
	on met le mot bonsoir ferait r i o s 6e 6f 62 soit 72 69 6F 73 6e 6f 62 */
	long long int bonsoir =0x72696F736E6F62;
	printf("%s\n",&bonsoir);

  return EXIT_SUCCESS;
}