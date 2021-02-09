=========================================
Lois de probabilités en R
=========================================

Tout d'abord, les fonctions en commencent par ... suivie du nom de la loi
donc par exemple :code:`rbeta` pour la loi Beta.

	* :code:`r[nom]` : suit la loi de probabilité nom
	* :code:`p[nom]` : fonction de réparation de la loi (:math:`P(X \le k)`)
	* :code:`q[nom]` : inverse de la fonction de répartition soit les quantiles
	* :code:`d[nom]` : densité (loi continue) ou :math:`P(X=k)` (loi discrète)

Les différentes lois sont

	* Beta : fonction :code:`beta`
	* **Binomiale** : fonction :code:`binom`, ex: dbinom(x=3,size=5,prob=0.5) soit 3 succès sur 5 avec proba 0.5
	* **Cauchy** : fonction :code:`cauchy` (:code:`rcauchy(n,location=0,scale=1)`)
	* **Khi-deux** : fonction :code:`chisq` (:code:`rchisq(n,df)`)
	* **Exponentielle** : fonction :code:`exp` (Exponentielle : :code:`rexp(n,rate=1)`)
	* F : fonction :code:`f`
	* Gamma : fonction :code:`gamma`, :code:`gamma(n)=(n-1)!`
	* **Géométrique** : fonction :code:`geom`
	* **Hypergéométrique** : fonction :code:`hyper`
	* Logistique : fonction :code:`logis`
	* Log Normale : fonction :code:`lnorm`
	* **Binomiale négative** : fonction :code:`nbinom`
	* **Normale** (Gaussienne) : fonction :code:`norm` (norm(x,mu,sigma) avec mu=moyenne, sigma=écart type donc 0,1 = centrée)
	* **Poisson** : fonction :code:`pois` (:code:`rpois(n,lambda)`)
	* **Student T** : fonction :code:`t`
	* **Uniforme** : fonction :code:`unif` (:code:`runif(n,min=0,max=1)` centrée réduite)
	* **Weibull** : fonction :code:`weibull`

Donc si on veut calculer :math:`P(X \le k)` on utilise une fonction de type
p. Si on veut calculer :math:`P(X \gt k)` alors on fait :code:`1-fonction_de_type_p`.
Enfin si on veut calculer :math:`P(X = k)` alors on utilise une fonction de type d.