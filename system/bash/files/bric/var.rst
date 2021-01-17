=======================================
Variables d'environnement
=======================================

On accède à une variable d'environnement, comme une variable normale.

	* :code:`${NOM}` ou :code:`$NOM` pour lire la valeur
	* :code:`NOM=valeur` pour créer/changer la valeur
	* :code:`export NOM=valeur` : change la valeur de cette variable partout (sinon ça change que dans le terminal actuel)

Commande :code:`printenv {VARIABLE}` : affiche la valeur d'une variable d'environnement
	C'est pareil que faire un :code:`echo $VARIABLE`. Si vous ne donnez pas le nom de la variable, alors
	toutes les variables d'environnement sont affichées.

Commande :code:`shopt {option}` : vous permet d'activer/désactiver des options du bash + consulter leur état
	J'ai seulement utilisé une options : nullglob.

	| :code:`-ps` : activer l'option
	| :code:`-pu` : désactiver l'option