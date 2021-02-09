=============================
Opérations et Conditions
=============================

Les opérations sont

	* les basiques : :code:`+,-,/,*`, :code:`nombre^puissance`, :code:`%%` (modulo), :code:`%/%` (division entière)
	* l'assignation : :code:`variable <- valeur` (= marche mais à éviter)
	* autre : :code:`sqrt, abs, log, xor, sum, ...`
	* concatenation (string) : :code:`paste(string, string, ...)`
	* vecteurs : :code:`a %in% v` (test si a dans vecteur v)

Les comparateurs sont

	* les basiques : :code:`>, >=, <=, <, ==, !=`
	* ou logique : :code:`|` (tester une condition vraie) [#3]_
	* et logique : :code:`&` (tester plusieurs conditions vraies) [#3]_
	* négation : :code:`!` (inverse le résultat de la condition)

.. [#3] Les symboles :code:`&&` et :code:`||` existent et font pareil que :code:`&` et :code:`|`.
	La seule différence est que dans le cas d'un vecteur, && et || font le et/ou uniquement sur le
	premier élément (donc cela ne retourne pas un vecteur).