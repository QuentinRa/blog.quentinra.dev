================================================================
2. Spécificité du C - Structures and symboles
================================================================

Condition
	Une condition qui vaut 1 est vraie, sinon elle est fausse.

	Vous pouvez utilisez des comparaisons (voir opérateurs, les ==, >, <, ...) qui retournent
	1 ou 0.

	Vous pouvez spécifier plusieurs conditions avec les opérateurs logiques (voir opérateurs &&, ||).

Branchement
	Le branchement se fait avec if(condition) et condition une expression.

		.. code:: c

				if(condition){} // si condition vraie alors exécute code
				else if(...){ } // optionnel, test d'autres conditions
				else {} // optionnel, cas aucune condition vraie

				// if else s'écrit aussi condition?code_true:code_false

	Parfois, vous avez beaucoup de if qui comparent la valeur d'une variable, il vaut mieux
	utiliser un switch dans ce cas.

	.. code:: c

			switch(variable){
			 //test si variable égal valeur
			 case valeur:
			  // code si oui
			 break;
			 // ...
			 //tous les cas ont échoué
			 default:
			  // code du else
			 break;
			}

Boucles
	La boucle for initialise une variable ou plusieurs dans init, puis tant que la condition
	est vraie : exécute le code et met à jour les variables.

	.. code:: c

		// boucles (for(init; condition ; before_loop_again){})
		for(int i=0; i < ... ; i++){
		 // code
		}

	La boucle do while fait le code une fois puis reboucle tant que la condition est vraie

	.. code:: c

		do {
		 // code
		} while(condition);

	Enfin, la boucle while exécute le code tant que condition est vrai.

	.. code:: c

		while(condition){
		 // code
		}

	Deux instructions que vous pouvez mettre dans une boucle :

		* break : quitte la boucle dans laquelle le break est
		* continue : saute le code et passe directement au prochain tour d'une boucle

Opérateurs
	Les opérateurs en c sont :

		* assignation (donner une valeur) : :code:`=`
		* opération : :code:`+` (plus), :code:`-` (moins), :code:`*` (multiplié), :code:`/` (divisé)
		* opération (2) : :code:`==` (comparaison), :code:`!` (négation), :code:`!=` (différent)
		* opération (3) : :code:`>` (sup), :code:`<` (inf), :code:`<=` (inf égal), :code:`>=` (sup égal)
		* opération puis assignation : :code:`+=`, ...
		* opération puis assignation (2) : :code:`var++` (+1), :code:`var--` (-1)
		* barrel shift : :code:`a >> b` (divise a par 2^b), :code:`a << b`  (multiplie a par 2^b)
		* logique : :code:`&&` (et), :code:`||` (ou), :code:`&` (et bit à bit), :code:`|` (ou bit à bit)
		* logique (2) : :code:`xor` (ou exclusif), :code:`^` (ou exclusif)