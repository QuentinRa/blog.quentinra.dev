==========================
Couplets/Types composites
==========================

Vous pouvez faire un couple de valeurs (typiquement une truc (clef,valeur) par
exemple dans les dictionnaires) avec ce qu'on appelle un couple.

Il suffit de mettre des valeurs entre parenthèses, séparés par une virgule par exemple
:code:`(5, "test", 3.0)`.

Vous pouvez briser un couple avec :code:`let (a,b,c) = (5, "test", 3.0)` et donc
dans respectivement a,b,c chacun des valeurs.

Le type d'un couple est de la forme :code:`type a * type b * type c`.

Si vous avez un couple (n,k) vous pouvez utiliser

	* :code:`fst (n,k)` retourne n
	* :code:`snd (n,k)` retourne k