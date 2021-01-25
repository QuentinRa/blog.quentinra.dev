=========================
robots.txt
=========================

robots.txt
	Un fichier à la racine destiné aux robots.

	.. code:: bash

			User-agent: * # * = tous
			Disallow: / # si vous mettez rien alors il ont accès à tout
			# vous pouvez définir d'autres Disallow

			# vous pouvez bloquer un robot particulier
			User-agent: Bingbot # ou Googlebot, Yandex, AdsBot-Google, Twitterbot ...
			Disallow: /

			# optionnel, un lien vers un xml : https://www.sitemaps.org/schemas/sitemap/0.9/
			# un exemple : https://www.blackdesertonline.com/sitemap.xml <3
			Sitemap: url/fichier.xml