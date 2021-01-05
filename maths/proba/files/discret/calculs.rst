===================================
Calculer une probabilité discrète
===================================

Probabilité (uniforme)
	Soit :math:`\Omega` fini et dénombrable,
	:math:`\forall{w} \in \Omega \ alors \ \mathbb{P}(w) = \frac{1}{card(\Omega)}`.

	Dans ce cas, :math:`\mathbb{P}(A) = \color{green}{\frac{card(A)}{card(\Omega)} = \frac{|A|}{|\Omega|}}`

	C'est le moyen le plus simple : vous comptez combien de cas sont valides pour votre événement A
	et vous divisez cette valeur par le nombre de cas total (voir dénombrement pour compter).

Probabilité conditionnelle
	Soit A et B deux évènements, il est possible de calculer la probabilité de A sachant celle de B

	.. math::

		\mathbb{P}(A|B) := \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}

	.. note::

		Par produit en croix, on obtient :math:`\mathbb{P}(A \cap B) = \mathbb{P}(B) * \mathbb{P}(A|B)`.

Formule de Bayes
	On déduis depuis la formule de la probabilité conditionnelle, la formule suivante appelée formule de bayes

	.. math::

		\mathbb{P}(A|B) := \frac{\mathbb{P}(B) * \mathbb{P}(A|B)}{\mathbb{P}(B)}