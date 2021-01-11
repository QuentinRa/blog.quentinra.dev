=====================================
PullRequest et Issues
=====================================

PullRequest
	Généralement, pour éviter de faire n'importe quoi sur master, on fait une :code:`pull request`
	c'est-à-dire que l'on créé un événement qui demande au programmer de vérifier une branche et de valider
	sa fusion (merge) avec master.

	Vous pouvez définir le format (en gros un template a remplir pour soumettre la pull request) sur Github
	en créant un fichier .github/PULL_REQUEST_TEMPLATE/pull_request_template.md

	Le format est un .md normal donc vous faites ce que vous voulez. Par exemple vous pouvez demander
	au programmeur de spécifier

		* ce qu'il a changé
		* des détails sur sa branche (ex: manque commentaire, ...)
		* des événements liés (autre pull request, issue, commit, etc...)

Issues
	Les issues sont les problèmes associé au dépôt (ex: bug, erreur, demande d'ajout de fonctionnalité, etc.).

	Vous pouvez définir des template d'issues dans .github/ISSUE_TEMPLATE/config.yml

	.. code:: yaml

		blank_issues_enabled: false # pas d'issues "vides" donc sans template
		# ajout d'un autre moyen de contact : un site web
		contact_links:
			- name: Nom de cette option
				url: url_du_site
				about: une description de cette option de support

	Sinon tout fichier .md dans .github/ISSUE_TEMPLATE/ deviendra un template pour issues.