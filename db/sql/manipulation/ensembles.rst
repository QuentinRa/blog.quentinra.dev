=======================================================
2. Manipulation des tuples - Opérations ensemblistes
=======================================================

Les opérations ensemblistes permettent de faire
des opérations comme sur des ensembles
(union, intersection, privé de) mais sur
les résultats de requêtes.

.. code:: sql

		-- union (dans requête1 ou requête2)
		(requête1) Union (requête2);

		-- intersection (dans requête1 et requête2)
		(requête1) INTERSECT (requête2);

		-- différence (dans requête1 mais pas dans requête2 et vice-versa)
		--MINUS sous ORACLE
		(requête1) EXCEPT (requête2);