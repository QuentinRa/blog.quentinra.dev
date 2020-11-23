================================================================
8. Flux et Fichiers - Manipulation de flux de caractères
================================================================

La logique est que vous allez ouvrir un fichier dans un mode (lecture/écriture)
et toutes les informations seront conservées dans une variable. Vous devrez donc passer cette variable
aux fonctions d'écriture/lecture/... pour qu'elles travaillent sur votre fichier.

Il existe trois flux pré-ouverts pour vous et que vous n'avez pas a fermer

	*	stdin : saisie à la console
	*	stdout : écriture à la console
	*	stderr : écriture à la console d'erreur

Explications des mots de lecture/écriture
	Il existe 3 modes d'ouverture : r (read=lecture uniquement),
	w (write=écriture uniquement, vide le fichier) et a (append=écriture mais met le curseur à la fin).

	Vous pouvez ouvrir un fichier en écriture et lecture mais généralement on ouvre le fichier
	en écriture, on écrit, on le ferme et on le ré-ouvre un lecture. Cependant c'est possible avec
	r+ (read et autres), w+ (write puis autres), a+ (append puis autres).

	Pour passer de lecture à écriture, vous devez d'abord vider les tampons. fseek (faire un fseek
	qui change pas le curseur par exemple) ou fflush vident les tampons.

Les fonctions sont

	* fopen : ouvre un fichier
	* fclose : ferme un fichier
	* fseek, rewind : vous permet de vous déplacer dans le fichier
	* ftell : indique votre position dans le fichier
	* fflush : vide les tampons

.. code:: c

		// type FILE contient un fichier
		FILE* fichier=NULL;

		// ouverture, modes sont r (lire), w (écrire), a (ajout), r+, w+, a+
		FILE fopen(chemin, mode_ouverture);

		// fseek permet de déplacer le curseur de lecture à un certain emplacement dans le fichier
		// position : SEEK_CUR=position actuelle, SEEK_SET (=debut), SEEK_END (=end)
		int fseek(flux, taille_saut, position);
		void rewind(flux); //curseur au début
		long ftell(flux); //position du curseur
		int fflush(flux); //vide les tampons

		//fermeture du flux
		int fclose(flux);

.. toctree::
  :maxdepth: 1

     Manipulation de flux d'octets                    <octets>
     Manipulation de flux de caractères               <string>