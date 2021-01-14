=======================================
Conversion et bases : #, hexdump, ...
=======================================

:code:`hexdump` : convertit texte vers hexadécimal/octal et inversement
	Ex d'un hexdump compliqué :code:`hexdump -ve '\"%08_ax\"  8/1 \"%02x\" \"  \" 8/1 \"%02x\" \"\n\"'`

	| :code:`-b` : octal
	| :code:`-C` : hexadécimal
	| :code:`-e` : personnalisable

Le bash peut faire des conversions de chiffres pour vous
avec :code:`base#nombre`. Il s'agit d'un calcul donc vous devez le mettre dans le bon bloc

	* :code:`$[base#nombre]`
	* Ex: :code:`echo $[2#101]` : affiche 5