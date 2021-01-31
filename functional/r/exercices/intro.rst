================================
Introduction
================================

Niveau débutant
***********************

aucun

Niveau supérieur
***********************

1. Analyse de lois
------------------------

**Génération et sauvegarde de données**

Générez une échantillon de 40 observations i.i.d. (indépendantes et identiquement
distribuées) pour les lois : Gaussienne, Uniforme, Poisson, Exponentielle, :math:`\chi^2`, Binomiale
et Cauchy.

Chaque loi sera stockée dans un vecteur, et le tout dans un data.frame enregistré dans un csv.

**Tracer les données**

Générez un vecteur qui contient 10 réalisations de la loi normale N(0,1).
Tracez un lignes horizontale en 0, puis en 1 et -1.
Combien de points sont en dehors de ces lignes?

La même chose avec les lignes horizontales 2 et -2, 3 et -3.

Testez avec 100 et 1000 valeurs. Pouvez conclure quelque chose sur "distribution_inconnue.csv" ?

**Histogrammes**

Tracer un histogramme (testez les paramètres breaks et freq)
pour l’échantillon de 100 réalisations que vous avez créé, et pour
"distribution_inconnue.csv". Que remarquez vous?

**Moments d’ordre supérieur**

Calculez les moments centrés des 4 premiers ordres (moyenne, variance, Skewness, Kurtosis)
pours les échantillons que vous avez généré et stockez les résultats dans une matrice.

:code:`Note` : Skewness et Kurtosis se trouvant dans la librairie :code:`e1071` ou dans :code:`moments`.

**Quantiles et Boxplot**

Ajouter les quantiles (0.25,0.5,0.75 respectivement Q1,Q2,Q3) à la matrice précédente. Vous
pouvez voir graphiquement les quantiles avec :code:`boxplot`.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<intro/s1>

| :code:`[TAG] ENSIIE MST TP1 2021 S2`

Niveau avancé
***********************

aucun

-----

**Crédits**
	* ...