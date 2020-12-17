================================================================
2. Présentation de Cypher - Représentation d'un nœud
================================================================

On note une arête : :code:`(ref: nom{attribut: valeur, ...})`.

	* :code:`nom` correspond au nom de l'objet (ex: nom de table en sql)
	* :code:`ref`, facultatif, correspond a un nom de variable [#f2]_
	* spécifier des attributs est facultatif

.. [#f2] vous utilisez alors ce nom pour créer des arêtes par exemple (ex: nom d'un tuple)

Notes

	* :code:`()` : nœud anonyme sans attributs
	* :code:`(ref)` : nœud anonyme sans attributs dans la variable ref
	* :code:`(:nom)` : nœud nom sans attributs
	* :code:`(:nom {attribut:valeur})` : nœud nom avec 1 attribut
	* :code:`(ref:nom {attribut:valeur})` : nœud nom avec 1 attribut stocké dans ref