===========================
Manipulation de window
===========================

Vous utiliserez la variable :code:`window`.

**Session JS**

Les session JS, appelé stockage local est disponible et lisible en clair dans
la console > application > stockage > Stockage local.

Vous pouvez y stocker des propriétés comme si l'utilisateur est en mode jour ou nuit, ...
ou des résultats de requêtes complexes.

On utilise :code:`window.localStorage` avec

	* :code:`localStorage.getItem('clef')` : récupérer une valeur depuis une clef
	* :code:`window.localStorage.setItem('clef', valeur)` : créer une valeur
	* :code:`window.localStorage.removeItem('clef')` : supprimer une valeur
	* :code:`window.localStorage.clear()` : supprimer le stockage local