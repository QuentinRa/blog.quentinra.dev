========================================
4. CyberSécurité - Les problèmes du web
========================================

SSRF
	Il s'agit d'un site web qui fait des requêtes a un autre site web par exemple pour faire une recherche.
	Si le programmeur n'a pas bien fait son travail, alors il est possible d'attaquer/explorer le
	serveur distant (Server-Side Request Forgery).

		* vous pouvez essayer d'énumérer les ports du serveur
		*
			vous pouvez essayer de rediriger les requêtes vers localhost, par exemple avec :code:`domaine_proxy.localtest.me`,
			avec domaine_proxy le domaine du serveur vers lequel sont faites les requêtes (localtest.me est un domaine
			qui redirige vers localhost, il y en a d'autres).