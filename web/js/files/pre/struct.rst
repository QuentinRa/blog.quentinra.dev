=================
Boucles en JS
=================

On connait nos boucles en C, on aura les mêmes en JAVAScript

	* :code:`if (cond) { ... }`
	* :code:`if (cond) { ... } else { ... }`
	* :code:`if (cond) { ... } else if (...) { ... }`
	* :code:`switch(...){ case v: ...;break; default: ...;break; }`
	* :code:`while(...){}`
	* :code:`do { ... } while(...);`
	* :code:`for(let i = 0; i < ...; i++) { ... }`
	* :code:`for(var i = 0; i < ...; i++) { ... }`
	* :code:`for(i = 0; i < ...; i++) { ... }` (pareil qu'avec var)

Mais vous avez un nouveau type de boucle pour les tableaux, le foreach

.. code:: js

	// i prends les valeurs 0,1,... soit les indices
	for(i in tab) console.log(a)

	// e prends les valeurs des éléments du tableau
	for(e of tab) console.log(e)