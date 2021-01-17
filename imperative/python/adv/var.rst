======================
Fonctions variadiques
======================

Il s'agit de fonction dont le nombre d'arguments n'est pas fixe.

.. code:: py

		def fct(arg1, *args):
		 print(list(args)) # tableau des arguments

		# appel
		fct(1) # affiche rien
		fct(1,2,3) # affiche 2,3

		# fonction spéciale
		def fct(arg1, **opts):
		 print(opts.get('opt1'), opts.get('opt2'))

		# appel
		fct(1, opt1 = 'xxx', opt2 = 'chocolat');