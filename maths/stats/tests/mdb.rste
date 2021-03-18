=========================
Techniques de Bootstrap
=========================

La méthode de bootstrap ne demande aucun prérequis
et permet d'estimer un interval de confiance de la moyenne/médiane/...

Elle permet d'agrandir un petit échantillon (ech) ce qui vous permettra
de faire vos tests. Le nouvel échantillon suivra une loi normale donc vous pourrez
appliquer tous les tests paramétriques dessus.

.. code:: R

	# vos données
	data <- ...
	# prends une précision de 10000
	n <- 10000
	# on peut prendre moyenne/médiane/....
	fonction <- mean
	# on génère notre tableau plus grand (replace=recycle)
	res <- sapply(1:n, FUN = function (x) { return(fonction(sample(data, length(data), replace = T)))})
	# trie pour faire une distribution normale
	res.sorted <- sort(res)
	# on considère un seul de 95%
	# on exclu les 2.5% à gauche et à droite
	# la moyenne (car fonction=mean) est donc inclue dans les bornes suivantes
	c(res[250], res[9750])

