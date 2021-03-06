===========================
Manipulation des Zippers
===========================

Un zipper est une sorte de structure en C (dans la syntaxe) mais son utilité
est de découper en deux une donnée et d'avoir une moitié à droite et une à gauche.
On va considérer comme curseur l'endroit ou vous êtes.

Voilà un exemple de zipper pour une liste générique

.. code:: ocaml

	type 'a zipper = {
	 left : 'a list;
	 right : 'a list;
	};;

Quelques opérations à prendre en compte

	* conversion liste vers zipper
	* conversion zipper vers liste
	* avancer le curseur vers la droite (déplacer un élément de droite vers gauche)
	* avancer le curseur vers la gauche (déplacer un élément de gauche vers droite)
	* pareil pour les fonctions d'ajout, de suppression
	* pouvoir se déplacer au début/à la fin

Pour l'instant je ne les aient pas encore utilisé donc pas vu d'utilité.