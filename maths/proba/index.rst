.. _proba:

================================
Probabilités
================================

| :math:`\color{grey}{Version \ 2.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 05/01/2021}`

1. Espaces de probabilités
================================

.. toctree::
	 :maxdepth: 1

		 Notations        <files/voc/notations>
		 Définitions      <files/voc/def>

2. Variable aléatoire discrète (:math:`\Omega` fini)
===================================================================

:math:`\Omega` fini
	Un ensemble fini est un ensemble qui est dénombrable. Si Oméga est fini, cela signifie que les probabilités
	sont par exemple dans :math:`\mathbb{N}` ou dans :math:`\mathbb{Z}`.

	Lorsque oméga est fini, on prend :math:`\mathbb{F}=P(\Omega)` (tribu = l'ensemble des parties donc tous les sous-ensembles
	possibles d'Oméga).

	On écrit dans le cas discret simplement : :math:`(\Omega, \mathbb{P})`.

Loi discrète
	On définit :math:`\mathbb{P}_{X_w}{k} = \mathbb{P}(X_w=k)` la probabilité que :math:`X_w` prenne la valeur k.

	w est optionnel s'il n'y a qu'une seule loi X.

.. toctree::
	 :maxdepth: 1

		 Calculer une probabilité discrète        <files/discret/calculs>
		 Dénombrer un ensemble de possibilités    <files/discret/count>
		 Indépendance                             <files/discret/independence>
		 Lois de probabilités discrètes           <files/discret/lois>
		 Espérance                                <files/discret/esp>
		 Variance et Covariance                   <files/discret/var>

3. Variables à densité/continues
===================================

...

5. Exercices
=================

.. toctree::
    :name: exercices
    :maxdepth: 1

		Dénombrement                              <exercices/count>
		Probabilités conditionnelles              <exercices/condition>
		Loi de probabilités                       <exercices/loi>
		Espérance et variance                     <exercices/avg>
		Non triés                                 <exercices/non_rank>

------

**Crédits**
	* Oleg LOUKIANOV (enseignant à l'IUT de Sénart-Fontainebleau)
	* Vathana LY VATH (enseignant à l'ENSIIE)
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* Tribu et Tribu borélienne
		* http://www.les-mathematiques.net/phorum/read.php?3,779703,779703
		* http://dictionnaire.sensagent.leparisien.fr/Tribu%20bor%C3%A9lienne/fr-fr/
		* https://www.techno-science.net/definition/5291.html
		* https://www.ilemaths.net/sujet-tribu-borelienne-402711.html
		* https://fr.wikipedia.org/wiki/Tribu_bor%C3%A9lienne
		* Discord: Yann J#2613 et FennecFeu#4212
	* Lois
		* http://www.math.univ-toulouse.fr/~rau/retro%20stat%20inf/c1.pdf
		* https://misterprepa.net/les-lois-discretes-formules-mathematiques/
		* http://maths.cnam.fr/Membres/ghorbanzadeh/lois.pdf
		* https://fr.wikipedia.org/wiki/Loi_de_probabilit%C3%A9#Lois_discr%C3%A8tes
		* https://fr.wikipedia.org/wiki/Loi_de_probabilit%C3%A9_marginale
		* https://fr.wikipedia.org/wiki/Loi_de_Bernoulli
		* https://fr.wikipedia.org/wiki/Liste_de_lois_de_probabilit%C3%A9
		* https://fr.wikipedia.org/wiki/Loi_g%C3%A9om%C3%A9trique
		* https://fr.wikipedia.org/wiki/Loi_normale#Loi_normale_centr%C3%A9e_r%C3%A9duite
		* https://fr.wikipedia.org/wiki/Fonction_gaussienne
		* https://fr.wikipedia.org/wiki/Loi_normale
		* https://fr.wikipedia.org/wiki/Loi_exponentielle
		* Poisson

			* https://www.techno-science.net/definition/6212.html
			* http://www.jybaudot.fr/Probas/parampoisson.html

	* Espérance, variance et covariance
		* https://www.techno-science.net/definition/5950.html
		* https://fr.wikipedia.org/wiki/Formulaire_de_d%C3%A9veloppements_en_s%C3%A9ries
		* https://fr.wikiversity.org/wiki/S%C3%A9rie_enti%C3%A8re
		* https://fr.wikipedia.org/wiki/Covariance
		* http://dictionnaire.sensagent.leparisien.fr/Variance%20(statistiques%20et%20probabilit%C3%A9s)/fr-fr/

	* autre
		* http://atomurl.net/math/