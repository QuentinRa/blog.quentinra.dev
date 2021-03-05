================================
Variables
================================

En javascript, les variables doivent être déclarées pour être utilisées mais
sont faiblement typées. On utilise

	* :code:`let nom_variable` : pour déclarer une variable
	* :code:`var nom_variable` : pour déclarer une variable (~globale)
	* :code:`const CONSTANTE = valeur` : pour déclarer une constante

Pour tester la différence entre let et var

.. code:: js

	for(let j=0; j<5; j++) console.log('test')
	j // erreur car n'existe pas

	for(var j=0; j<5; j++) console.log('test')
	j // vaut 5, ok

Ceci peut poser des problèmes parce que vous auriez pu oublier de déclarer une variable mais n'avez
pas d'erreur car vous aviez déjà utilisé le même nom ailleurs. Cela peut aussi poser problème dans
les boucles car var = une adresse donc si la valeur est changées alors toutes les références
vont avoir la nouvelle valeur. **Utilisez let pour éviter les problèmes**.
