================================================================
8. Flux et Fichiers - Manipulation de flux de caractères
================================================================

Lecture
		.. code:: c

			// lis selon format printf et stocke à une adresse
			int scanf(format, adresses);// lecture dans stdin

			int fscanf(flux,"format",&...);
			// lis un caractère dans un flux
			int getc();// lecture dans stdin
			int fgetc(flux);
			// lis une ligne, stocke dans un buffer, met '' en dernier caractère
			char* gets(buffer, taille);// lecture dans stdin
			char* fgets(buffer, taille, flux);

Écriture
	.. code:: c

		//affichage selon format
		int prinf(format, args);
		int fprintf(flux, format, args);
		//affiche un caractère
		int putc(int caractère);//dans stdout
		int putchar(int caractère);//dans stdout
		int fputc(int caractère, flux);
		//affiche une string
		int fputs(string);//dans stdout
		int fputs(string, flux);