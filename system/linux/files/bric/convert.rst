=======================================
Conversion et bases : #, hexdump, ...
=======================================

:code:`hexdump` : convertit texte vers hexadécimal/octal et inversement
	Ex d'un hexdump compliqué :code:`hexdump -ve '\"%08_ax\"  8/1 \"%02x\" \"  \" 8/1 \"%02x\" \"\n\"'`

	| :code:`-b` : octal
	| :code:`-C` : hexadécimal
	| :code:`-e` : personnalisable